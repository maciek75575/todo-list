package pl.maciejk.todoList.dto;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class UserEditDto {
	
	@NotEmpty
	@Size(min = 1, max = 40)
	private String firstName;
	
	@Size(max = 40)
	private String lastName;

	@NotEmpty
	@Size(min = 1, max = 30)
	private String login;
	
	@NotEmpty
	@Email
	@Size(min = 3, max = 60)
	private String email;

	@Size(max = 15)
	private String phoneNumber;
	
	private boolean enabled;

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
}
