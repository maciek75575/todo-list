package pl.maciejk.todoList.controllers;

import java.time.ZonedDateTime;
import java.util.Date;

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

import pl.maciejk.todoList.dto.TaskDto;
import pl.maciejk.todoList.model.Task;
import pl.maciejk.todoList.services.CategoryService;
import pl.maciejk.todoList.services.TaskService;
import pl.maciejk.todoList.services.UserService;

@Controller
@Secured({"ROLE_USER"})
@RequestMapping(value = "/task")
public class TaskController {
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryService categoryService;
	
	@ModelAttribute("formTask")
	public TaskDto getFormTaskAdd() {
		return new TaskDto();
	}
	
	@RequestMapping(value = "")
	public String task(Model model) {
		model.addAttribute("tasks", taskService.taskByUserOrderByDate(userService.userByLogin(SecurityContextHolder.getContext().getAuthentication().getName())));
		return "task/task";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addTask(Model model) {
		model.addAttribute("categories", categoryService.categoryByUser(userService.userByLogin(SecurityContextHolder.getContext().getAuthentication().getName())));
		return "task/taskAdd";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addTask(@ModelAttribute("formTask") @Valid TaskDto form, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("categories", categoryService.categoryByUser(userService.userByLogin(SecurityContextHolder.getContext().getAuthentication().getName())));
			return "task/taskAdd";
		}
		else {
			Task task = new Task();
			task.setTitle(form.getTitle());
			task.setDescription(form.getDescription());
			task.setTaskDate(form.getTaskDate());
			task.setCategory(categoryService.findById(form.getCategory()));
			task.setUser(userService.userByLogin(SecurityContextHolder.getContext().getAuthentication().getName()));
			ZonedDateTime zdt = ZonedDateTime.now();
			Date date = Date.from(zdt.toInstant());
			task.setCompleted(false);
			task.setAddDate(date);
			task.setImportant(form.isImportant());
			taskService.addOrUpdate(task);
			return "redirect:/task";
		}
	}

	@RequestMapping(value = "/edit-{id}", method = RequestMethod.GET)
	public String editTask(@PathVariable("id") Long id, Model model) {
		if (!taskService.doesExist(id))
			return "redirect:/404";
		else if (!userService.isLogged(taskService.findById(id).getUser()))
			return "redirect:/403";
		else {
			model.addAttribute("categories", categoryService.categoryByUser(userService.userByLogin(SecurityContextHolder.getContext().getAuthentication().getName())));
			model.addAttribute("formTask", taskService.findById(id));
			return "task/taskEdit";
		}
	}
	
	@RequestMapping(value = "/edit-{id}", method = RequestMethod.POST)
	public String editTask(@PathVariable("id") Long id, @ModelAttribute("formTask") @Valid TaskDto form, BindingResult result, Model model) {
		if (!taskService.doesExist(id))
			return "redirect:/404";
		else if (!userService.isLogged(taskService.findById(id).getUser()))
			return "redirect:/403";
		else if (result.hasErrors()) {
			model.addAttribute("categories", categoryService.categoryByUser(userService.userByLogin(SecurityContextHolder.getContext().getAuthentication().getName())));
			model.addAttribute("formTask", taskService.findById(id));
			return "task/taskEdit";
		}
		else {
			Task task = taskService.findById(id);
			task.setTitle(form.getTitle());
			task.setDescription(form.getDescription());
			task.setTaskDate(form.getTaskDate());
			task.setCategory(categoryService.findById(form.getCategory()));
			ZonedDateTime zdt = ZonedDateTime.now();
			Date date = Date.from(zdt.toInstant());
			task.setEditDate(date);
			task.setImportant(form.isImportant());
			taskService.addOrUpdate(task);
			return "redirect:/task";
		}
	}
	
	@RequestMapping(value = "/remove-{id}")
	public String removeTask(@PathVariable("id") Long id) {
		if (!taskService.doesExist(id))
			return "redirect:/404";
		else if (!userService.isLogged(taskService.findById(id).getUser()))
			return "redirect:/403";
		else {
			taskService.delete(id);
			return "redirect:/task";
		}
	}
	
	@RequestMapping(value = "/complete-{id}")
	public String completeTask(@PathVariable("id") Long id) {
		if (!taskService.doesExist(id))
			return "redirect:/404";
		else if (!userService.isLogged(taskService.findById(id).getUser()))
			return "redirect:/403";
		else {
			taskService.completeTask(id);
			return "redirect:/task";
		}
	}
}
