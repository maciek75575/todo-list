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

import pl.maciejk.todoList.dto.UserEditDto;
import pl.maciejk.todoList.model.Authority;
import pl.maciejk.todoList.model.User;
import pl.maciejk.todoList.services.AuthorityService;
import pl.maciejk.todoList.services.UserService;

@Controller
@Secured({"ROLE_ADMIN"})
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AuthorityService authorityService;
	
	@ModelAttribute("formUserEdit")
	public UserEditDto getFormEdit() {
		return new UserEditDto();
	}

	@RequestMapping(value = "/userList")
	public String users(Model model) {
		model.addAttribute("users", userService.userList());
		return "admin/userList";
	}

	@RequestMapping(value = "/userDetails-{id}")
	public String userDetails(@PathVariable("id") Long id, Model model) {
		model.addAttribute("user", userService.userById(id));
		model.addAttribute("roleUser", authorityService.roleUser(userService.userById(id)));
		model.addAttribute("roleAdmin", authorityService.roleAdmin(userService.userById(id)));
		return "admin/userDetails";
	}

	@RequestMapping(value = "/userEdit-{id}", method = RequestMethod.GET)
	public String userEdit(@PathVariable("id") Long id, Model model) {
		User user = userService.userById(id);
		model.addAttribute("formUserEdit", user);
		return "admin/userEdit";
	}

	@RequestMapping(value = "/userEdit-{id}", method = RequestMethod.POST)
	public String userEdit(@PathVariable("id") Long id, @ModelAttribute("formUserEdit") @Valid UserEditDto form, BindingResult result) {
		if (result.hasErrors())
			return "admin/userEdit";
		else {
			User user = userService.userById(id);
			if (!user.getLogin().equals(form.getLogin()) && (userService.isLoginOccupied(form.getLogin()))) return "userEdit";
			if (!user.getEmail().equals(form.getEmail()) && (userService.isEmailOccupied(form.getEmail()))) return "userEdit";
			
			user.setFirstName(form.getFirstName());
			user.setLastName(form.getLastName());
			user.setLogin(form.getLogin());
			user.setEmail(form.getEmail());
			user.setPhoneNumber(form.getPhoneNumber());
			user.setEnabled(form.isEnabled());
			userService.userAdd(user);
			return "redirect:userDetails-{id}";
		}
	}

	@RequestMapping(value = "/userRemove-{id}")
	public String userRemove(@PathVariable("id") Long id) {
		userService.userRemove(id);
		return "redirect:userList";
	}
	
	@RequestMapping(value = "/authorityRemove-{userId}-{id}")
	public String authorityRemove(@PathVariable("userId") Long userId, @PathVariable("id") Long id) {
		authorityService.authorityRemove(id);
		return "redirect:userDetails-{userId}";
	}
	
	@RequestMapping(value = "/authorityAdd-{userId}-{authority}")
	public String authorityAdd(@PathVariable("userId") Long userId, @PathVariable("authority") String authority) {
		User user = userService.userById(userId);
		Authority auth = new Authority();
		auth.setAuthority(authority);
		auth.setUser(user);
		authorityService.authorityAdd(auth);
		return "redirect:userDetails-{userId}";
	}
}