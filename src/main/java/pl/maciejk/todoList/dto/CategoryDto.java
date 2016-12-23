package pl.maciejk.todoList.dto;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class CategoryDto {
	
	@NotEmpty
	@Size(max = 100)
	private String name;
	
	@NotNull
	private Long categoryColor;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getCategoryColor() {
		return categoryColor;
	}

	public void setCategoryColor(Long categoryColor) {
		this.categoryColor = categoryColor;
	}
	
}
