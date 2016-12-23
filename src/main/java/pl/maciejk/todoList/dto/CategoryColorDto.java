package pl.maciejk.todoList.dto;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class CategoryColorDto {
	
	@NotEmpty
	@Size(max = 100)
	private String primaryColor;

	@NotEmpty
	@Size(min = 6, max = 7)
	private String primaryCode;
	
	@NotEmpty
	@Size(max = 100)
	private String secondaryColor;

	@NotEmpty
	@Size(min = 6, max = 7)
	private String secondaryCode;

	public String getPrimaryColor() {
		return primaryColor;
	}

	public void setPrimaryColor(String primaryColor) {
		this.primaryColor = primaryColor;
	}

	public String getPrimaryCode() {
		return primaryCode;
	}

	public void setPrimaryCode(String primaryCode) {
		this.primaryCode = primaryCode;
	}

	public String getSecondaryColor() {
		return secondaryColor;
	}

	public void setSecondaryColor(String secondaryColor) {
		this.secondaryColor = secondaryColor;
	}

	public String getSecondaryCode() {
		return secondaryCode;
	}

	public void setSecondaryCode(String secondaryCode) {
		this.secondaryCode = secondaryCode;
	}
	
}
