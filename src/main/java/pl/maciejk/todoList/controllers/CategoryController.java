package pl.maciejk.todoList.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.maciejk.todoList.dto.CategoryDto;
import pl.maciejk.todoList.model.Category;
import pl.maciejk.todoList.services.CategoryColorService;
import pl.maciejk.todoList.services.CategoryService;
import pl.maciejk.todoList.services.UserService;

@Controller
@Secured({"ROLE_USER"})
@RequestMapping(value = "/category")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryColorService categoryColorService;
	
	@ModelAttribute("formCategory")
	public CategoryDto getCategory() {
		return new CategoryDto();
	}
	
	@RequestMapping(value = "")
	public String category(Model model) {
		model.addAttribute("categories", categoryService.categoryByUser(userService.userByLogin(SecurityContextHolder.getContext().getAuthentication().getName())));
		return "/category/category";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addCategory(Model model) {
		model.addAttribute("colors", categoryColorService.findAll());
		return "/category/categoryAdd";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addCategory(@ModelAttribute("formCategory") @Valid CategoryDto form, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("colors", categoryColorService.findAll());
			return "/category/categoryAdd";
		}
		else {
			Category category = new Category();
			category.setName(form.getName());
			category.setCategoryColor(categoryColorService.findById(form.getCategoryColor()));
			category.setUser(userService.userByLogin(SecurityContextHolder.getContext().getAuthentication().getName()));
			categoryService.addOrUpdate(category);
			return "redirect:/category";
		}
	}
	
	@RequestMapping(value = "/edit-{id}", method = RequestMethod.GET)
	public String editCategory(@PathVariable("id") Long id, Model model) {
		if (!categoryService.doesExist(id))
			return "redirect:/404";
		if (!userService.isLogged(categoryService.findById(id).getUser()))
			return "redirect:/403";
		else {
			model.addAttribute("colors", categoryColorService.findAll());
			model.addAttribute("formCategory", categoryService.findById(id));
			return "/category/categoryEdit";
		}
	}
	
	@RequestMapping(value = "/edit-{id}", method = RequestMethod.POST)
	public String editCategory(@PathVariable("id") Long id, @ModelAttribute("formCategory") @Valid CategoryDto form, BindingResult result, Model model) {
		if (!categoryService.doesExist(id))
			return "redirect:/404";
		if (!userService.isLogged(categoryService.findById(id).getUser()))
			return "redirect:/403";
		else if (result.hasErrors()) {
			model.addAttribute("colors", categoryColorService.findAll());
			model.addAttribute("formCategory", categoryService.findById(id));
			return "/category/categoryEdit";
		}
		else {
			Category category = categoryService.findById(id);
			category.setName(form.getName());
			category.setCategoryColor(categoryColorService.findById(form.getCategoryColor()));
			categoryService.addOrUpdate(category);
			return "redirect:/category";
		}
	}
	
	@RequestMapping(value = "/remove-{id}")
	public String removeCategory(@PathVariable("id") Long id) {
		if (!categoryService.doesExist(id))
			return "redirect:/404";
		else if (!userService.isLogged(categoryService.findById(id).getUser()))
			return "redirect:/403";
		else {
			categoryService.delete(id);
			return "redirect:/category";
		}
	}
}
