package pl.maciejk.todoList.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import pl.maciejk.todoList.services.UserService;

@RestController
@RequestMapping(value = "/api")
public class AvailabilityController {
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/loginAvailable", method = RequestMethod.POST, consumes = { "text/plain" })
	public ResponseEntity<Boolean> loginAvailable(@RequestBody String login) {
		if (userService.doesExist(login)) 
			return new ResponseEntity<Boolean>(false, new HttpHeaders(), HttpStatus.OK);
		else
			return new ResponseEntity<Boolean>(true, new HttpHeaders(), HttpStatus.OK);
	}

	@RequestMapping(value = "/emailAvailable", method = RequestMethod.POST, consumes = { "text/plain" })
	public ResponseEntity<Boolean> emailAvailable(@RequestBody String email) {
		if (userService.doesEmailExist(email))
			return new ResponseEntity<Boolean>(false, new HttpHeaders(), HttpStatus.OK);
		else
			return new ResponseEntity<Boolean>(true, new HttpHeaders(), HttpStatus.OK);
	}
}
