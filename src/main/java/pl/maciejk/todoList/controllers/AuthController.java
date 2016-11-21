package pl.maciejk.todoList.controllers;

import java.time.ZonedDateTime;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.maciejk.todoList.dto.SignUpDto;
import pl.maciejk.todoList.model.User;
import pl.maciejk.todoList.services.UserService;

@Controller
public class AuthController {
	
	@Autowired
	private UserService userService;
	
	@ModelAttribute("formSignUp")
	public SignUpDto getForm() {
		return new SignUpDto();
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signUpForm() {
		return "signup";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signUp(@ModelAttribute("formSignUp") @Valid SignUpDto form, BindingResult result) {
		if (result.hasErrors() || !(form.getPassword().equals(form.getRepeatPassword())) || !(form.getEmail().equals(form.getRepeatEmail())))
			return "signup";
		else {
			User user = new User();
			user.setFirstName(form.getFirstName());
			user.setLastName(form.getLastName());
			user.setLogin(form.getLogin());
			user.setEmail(form.getEmail());
			user.setPassword(form.getPassword());
			user.setEnabled(true);
			user.setPhoneNumber(form.getPhoneNumber());
			user.setRole("ROLE_USER");
			ZonedDateTime zdt = ZonedDateTime.now();
			Date date = Date.from(zdt.toInstant());
			user.setSignUpDate(date);
			userService.userAdd(user);
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "/login")
	public String signIn() {
		return "login";
	}
}
