package pl.maciejk.todoList.dto;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class UserChangePasswordDto {

	@NotEmpty
	@Size(min = 6, max = 30)
	private String oldPassword;
	
	@NotEmpty
	@Size(min = 6, max = 30)
	private String newPassword;
	
	@NotEmpty
	@Size(min = 6, max = 30)
	private String repeatPassword;

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getRepeatPassword() {
		return repeatPassword;
	}

	public void setRepeatPassword(String repeatPassword) {
		this.repeatPassword = repeatPassword;
	}
	
}
