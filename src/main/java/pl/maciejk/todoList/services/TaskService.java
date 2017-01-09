package pl.maciejk.todoList.services;

import java.time.ZonedDateTime;
import java.util.Date;
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

	public List<Task> taskByUserIdAndDate(Long id, Date date) {
		return iDao.findByUser_idAndTaskDate(id, date);
	}
	
	public List<Task> taskByUserAndDate(User user, Date date) {
		return iDao.findByUser_idAndTaskDate(user.getId(), date);
	}
	
	public void completeTask(Long id) {
		Task task = findById(id);
		ZonedDateTime zdt = ZonedDateTime.now();
		Date date = Date.from(zdt.toInstant());
		task.setCompleted(true);
		task.setCompletionDate(date);
		addOrUpdate(task);
	}
	
	public boolean doesExist(Long id) {
		return (findById(id) != null);
	}
}
