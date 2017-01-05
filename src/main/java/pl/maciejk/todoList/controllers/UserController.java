package pl.maciejk.todoList.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.maciejk.todoList.dto.UserChangePasswordDto;
import pl.maciejk.todoList.dto.UserUpdateDto;
import pl.maciejk.todoList.model.User;
import pl.maciejk.todoList.services.UserService;
import pl.maciejk.todoList.utils.BCryptEncoder;

@Controller
@Secured({"ROLE_USER", "ROLE_ADMIN"})
@RequestMapping(value = "/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@ModelAttribute("formUserUpdate")
	public UserUpdateDto getFormUpdate() {
		return new UserUpdateDto();
	}
	
	@ModelAttribute("formUserChangePassword")
	public UserChangePasswordDto getFormChangePassword() {
		return new UserChangePasswordDto();
	}
	
	@RequestMapping(value = "/profile")
	public String userProfile(Model model) {
		User user = userService.userByLogin(SecurityContextHolder.getContext().getAuthentication().getName());
		model.addAttribute("user", user);
		return "user/userProfile";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String userUpdateForm(Model model) {
		User user = userService.userByLogin(SecurityContextHolder.getContext().getAuthentication().getName());
		model.addAttribute("formUserUpdate", user);
		return "user/userUpdate";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String userUpdate(@ModelAttribute("formUserUpdate") @Valid UserUpdateDto form, BindingResult result) {
		if (result.hasErrors())
			return "user/userUpdate";
		else {
			User user = userService.userByLogin(SecurityContextHolder.getContext().getAuthentication().getName());
			user.setFirstName(form.getFirstName());
			user.setLastName(form.getLastName());
			user.setPhoneNumber(form.getPhoneNumber());
			userService.addOrUpdate(user);
			return "redirect:profile";
		}
	}
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
	public String userChangePasswordForm() {
		return "user/userChangePassword";
	}
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String userChangePassword(@Valid UserChangePasswordDto form, BindingResult result) {
		if (result.hasErrors() || !form.getNewPassword().equals(form.getRepeatPassword()))
			return "user/userChangePassword";
		else {
			User user = userService.userByLogin(SecurityContextHolder.getContext().getAuthentication().getName());
			if (!BCryptEncoder.check(form.getOldPassword(), user.getPassword())) return "userChangePassword";
			user.setPassword(BCryptEncoder.encode(form.getNewPassword()));
			userService.addOrUpdate(user);
			return "redirect:profile";
		}
	}
}
