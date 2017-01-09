package pl.maciejk.todoList.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import pl.maciejk.todoList.model.Task;

@Repository
public interface ITaskDao extends CrudRepository<Task, Long> {
	public Task findById(Long id);
	public List<Task> findByUser_id(Long id);
	public List<Task> findByUser_idOrderByTaskDateAsc(Long id);
	public List<Task> findByUser_idAndTaskDate(Long user_id, Date taskdate);
}
