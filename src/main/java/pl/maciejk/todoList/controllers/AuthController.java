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
import pl.maciejk.todoList.model.Authority;
import pl.maciejk.todoList.model.User;
import pl.maciejk.todoList.services.AuthorityService;
import pl.maciejk.todoList.services.UserService;
import pl.maciejk.todoList.utils.BCryptEncoder;

@Controller
public class AuthController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AuthorityService authorityService;
	
	@ModelAttribute("formSignUp")
	public SignUpDto getForm() {
		return new SignUpDto();
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signUpForm() {
		return "auth/signup";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signUp(@ModelAttribute("formSignUp") @Valid SignUpDto form, BindingResult result) {
		if (result.hasErrors() || 
				!(form.getPassword().equals(form.getRepeatPassword())) || 
				!(form.getEmail().equals(form.getRepeatEmail())) || 
				userService.isLoginOccupied(form.getLogin()) || 
				userService.isEmailOccupied(form.getEmail()))
			return "auth/signup";
		else {
			User user = new User();
			user.setFirstName(form.getFirstName());
			user.setLastName(form.getLastName());
			user.setLogin(form.getLogin());
			user.setEmail(form.getEmail());
			user.setPassword(BCryptEncoder.encode(form.getPassword()));
			user.setEnabled(true);
			user.setPhoneNumber(form.getPhoneNumber());
			ZonedDateTime zdt = ZonedDateTime.now();
			Date date = Date.from(zdt.toInstant());
			user.setSignUpDate(date);
			userService.addOrUpdate(user);
			
			user = userService.userByLogin(form.getLogin());
			Authority auth = new Authority();
			auth.setAuthority("ROLE_USER");
			auth.setUser(user);
			authorityService.addOrUpdate(auth);
			
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "/login")
	public String signIn() {
		return "auth/login";
	}
}
