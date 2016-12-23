package pl.maciejk.todoList.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.maciejk.todoList.dao.ITaskDao;
import pl.maciejk.todoList.model.Task;
import pl.maciejk.todoList.model.User;

@Service
public class TaskService {

	@Autowired
	private ITaskDao iTaskDao;
	
	public Task taskById(Long id) {
		return iTaskDao.findById(id);
	}

	public List<Task> taskByUserId(Long id) {
		return iTaskDao.findByUser_id(id);
	}
	
	public List<Task> taskByUser(User user) {
		return iTaskDao.findByUser_id(user.getId());
	}

	public List<Task> taskByUserIdOrderByDate(Long id) {
		return iTaskDao.findByUser_idOrderByTaskDateAsc(id);
	}
	
	public List<Task> taskByUserOrderByDate(User user) {
		return iTaskDao.findByUser_idOrderByTaskDateAsc(user.getId());
	}
	
	public void taskAdd(Task task) {
		iTaskDao.save(task);
	}
	
	public void completeTask(Long id) {
		Task task = taskById(id);
		task.setCompleted(true);
		taskAdd(task);
	}
	
	public void taskRemove(Long id) {
		iTaskDao.delete(id);
	}
	
	public boolean doesExist(Long id) {
		return (taskById(id) != null);
	}
}
