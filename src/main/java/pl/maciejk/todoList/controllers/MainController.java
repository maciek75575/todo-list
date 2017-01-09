package pl.maciejk.todoList.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.maciejk.todoList.utils.CheckAuthority;

@Controller
public class MainController {

	@RequestMapping(value = "/")
	public String glowna() {
		if (CheckAuthority.hasAuthority("ROLE_USER"))
			return "redirect:/task/today";
		else if (CheckAuthority.hasAuthority("ROLE_ADMIN"))
			return "redirect:/admin/userList";
		else
			return "/main/index";
	}
}
