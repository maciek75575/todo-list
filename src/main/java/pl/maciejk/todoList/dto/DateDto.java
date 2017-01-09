package pl.maciejk.todoList.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class DateDto {

	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date taskDate;

	public Date getTaskDate() {
		return taskDate;
	}

	public void setTaskDate(Date taskDate) {
		this.taskDate = taskDate;
	}
}
