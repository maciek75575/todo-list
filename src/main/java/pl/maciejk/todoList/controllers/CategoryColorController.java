package pl.maciejk.todoList.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.maciejk.todoList.dto.CategoryColorDto;
import pl.maciejk.todoList.model.CategoryColor;
import pl.maciejk.todoList.services.CategoryColorService;

@Controller
@Secured({"ROLE_ADMIN"})
@RequestMapping(value = "/catColor")
public class CategoryColorController {

	@Autowired
	private CategoryColorService categoryColorService;
	
	@ModelAttribute("formCategoryColor")
	public CategoryColorDto getCategoryColor() {
		return new CategoryColorDto();
	}
	
	@RequestMapping(value = "")
	public String categoryColor(Model model) {
		model.addAttribute("categoryColors", categoryColorService.findAll());
		return "/categoryColor/categoryColor";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addCategoryColor() {
		return "/categoryColor/categoryColorAdd";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addCategoryColor(@ModelAttribute("formCategoryColor") @Valid CategoryColorDto form, BindingResult result) {
		if (result.hasErrors())
			return "/categoryColor/categoryColorAdd";
		else {
			CategoryColor categoryColor = new CategoryColor();
			categoryColor.setPrimaryColor(form.getPrimaryColor());
			categoryColor.setPrimaryCode(form.getPrimaryCode());
			categoryColor.setSecondaryColor(form.getSecondaryColor());
			categoryColor.setSecondaryCode(form.getSecondaryCode());
			categoryColor = categoryColorService.addMissingHashes(categoryColor);
			categoryColorService.addOrUpdate(categoryColor);
			return "redirect:/catColor";
		}
	}
	
	@RequestMapping(value = "/edit-{id}", method = RequestMethod.GET)
	public String editCategoryColor(@PathVariable("id") Long id, Model model) {
		if (!categoryColorService.doesExist(id))
			return "redirect:/404";
		else {
			model.addAttribute("formCategoryColor", categoryColorService.findById(id));
			return "/categoryColor/categoryColorEdit";
		}
	}
	
	@RequestMapping(value = "/edit-{id}", method = RequestMethod.POST)
	public String editCategoryColor(@PathVariable("id") Long id, @ModelAttribute("formCategoryColor") @Valid CategoryColorDto form, BindingResult result) {
		if (!categoryColorService.doesExist(id))
			return "redirect:/404";
		else if (result.hasErrors())
			return "/categoryColor/categoryColorEdit";
		else {
			CategoryColor categoryColor = categoryColorService.findById(id);
			categoryColor.setPrimaryColor(form.getPrimaryColor());
			categoryColor.setPrimaryCode(form.getPrimaryCode());
			categoryColor.setSecondaryColor(form.getSecondaryColor());
			categoryColor.setSecondaryCode(form.getSecondaryCode());
			categoryColor = categoryColorService.addMissingHashes(categoryColor);
			categoryColorService.addOrUpdate(categoryColor);
			return "redirect:/catColor";
		}
	}
	
	@RequestMapping(value = "/remove-{id}")
	public String removeCategoryColor(@PathVariable("id") Long id) {
		if (!categoryColorService.doesExist(id)) return "redirect:/404";
		else {
			categoryColorService.delete(id);
			return "redirect:/catColor";
		}
	}
}
