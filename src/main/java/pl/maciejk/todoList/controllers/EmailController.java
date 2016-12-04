package pl.maciejk.todoList.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmailController {
	
	@Autowired
	private MailSender mailSender;

	@RequestMapping(value = "/testMail")
	public String testEmail() {

		SimpleMailMessage message = new SimpleMailMessage();

		message.setFrom("from@email.com");
		message.setTo("to@email.com");
		message.setSubject("Test subject");
		message.setText("Test message");
		mailSender.send(message);
		return "redirect:/";
	}
}
