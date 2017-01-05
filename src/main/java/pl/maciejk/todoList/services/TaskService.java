package pl.maciejk.todoList.services;

import java.util.List;

import org.springframework.stereotype.Service;

import pl.maciejk.todoList.dao.ITaskDao;
import pl.maciejk.todoList.model.Task;
import pl.maciejk.todoList.model.User;

@Service
public class TaskService extends BaseService<ITaskDao, Task> {

	public List<Task> taskByUserId(Long id) {
		return iDao.findByUser_id(id);
	}
	
	public List<Task> taskByUser(User user) {
		return iDao.findByUser_id(user.getId());
	}

	public List<Task> taskByUserIdOrderByDate(Long id) {
		return iDao.findByUser_idOrderByTaskDateAsc(id);
	}
	
	public List<Task> taskByUserOrderByDate(User user) {
		return iDao.findByUser_idOrderByTaskDateAsc(user.getId());
	}
	
	public void completeTask(Long id) {
		Task task = findById(id);
		task.setCompleted(true);
		addOrUpdate(task);
	}
	
	public boolean doesExist(Long id) {
		return (findById(id) != null);
	}
}
