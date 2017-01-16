package pl.maciejk.todoList.dto;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class AuthorityAddDto {
	
	@NotEmpty
	@Size(max = 100)
	private String authority;

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
}
