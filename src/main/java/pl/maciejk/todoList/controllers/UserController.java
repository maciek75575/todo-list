package pl.maciejk.todoList.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.maciejk.todoList.services.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;

	@Secured({"ROLE_USER"})
	@RequestMapping(value = "/users")
	public String users(Model model) {
		model.addAttribute("users", userService.userList());
		return "users";
	}

	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value = "/user-{id}")
	public String userDetails(@PathVariable("id") Long id, Model model) {
		model.addAttribute("user", userService.userById(id));
		return "userDetails";
	}

	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value = "/userRemove-{id}")
	public String userDelete(@PathVariable("id") Long id, Model model) {
		userService.userRemove(id);
		return "redirect:users";
	}
}
