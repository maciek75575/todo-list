package pl.maciejk.todoList.dto;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class SignInDto {
	
	@NotEmpty
	@Size(min = 1, max = 30)
	private String login;

	@NotEmpty
	@Size(min = 6, max = 30)
	private String password;

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
	
	
}
