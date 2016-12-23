package pl.maciejk.todoList.dto;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class SignUpDto {
	
	@NotEmpty
	@Size(min = 1, max = 40)
	private String firstName;
	
	@Size(max = 40)
	private String lastName;

	@NotEmpty
	@Size(min = 1, max = 30)
	private String login;

	@NotEmpty
	@Size(min = 6, max = 30)
	private String password;

	@NotEmpty
	@Size(min = 6, max = 30)
	private String repeatPassword;

	@NotEmpty
	@Email
	@Size(min = 3, max = 254)
	private String email;

	@NotEmpty
	@Email
	@Size(min = 3, max = 254)
	private String repeatEmail;
	
	@Size(max = 15)
	private String phoneNumber;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRepeatPassword() {
		return repeatPassword;
	}

	public void setRepeatPassword(String repeatPassword) {
		this.repeatPassword = repeatPassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRepeatEmail() {
		return repeatEmail;
	}

	public void setRepeatEmail(String repeatEmail) {
		this.repeatEmail = repeatEmail;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	
}
