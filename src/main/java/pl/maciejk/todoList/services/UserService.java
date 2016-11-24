package pl.maciejk.todoList.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.maciejk.todoList.dao.IUserDao;
import pl.maciejk.todoList.model.User;

@Service
public class UserService {
	
	@Autowired
	private IUserDao iUserDao;
	
	public List<User> userList() {
		return iUserDao.findAll();
	}
	
	public User userById(Long id) {
		return iUserDao.findById(id);
	}
	
	public User userByLogin(String name) {
		return iUserDao.findByLogin(name);
	}
	
	public void userAdd(User user) {
		iUserDao.save(user);
	}
	
	public void userRemove(Long id) {
		iUserDao.delete(id);
	}
	
	public boolean isLoginOccupied(String login) {
		if (iUserDao.findByLogin(login) == null) return false;
		else return true;
	}
	
	public boolean isEmailOccupied(String email) {
		if (iUserDao.findByEmail(email) == null) return false;
		else return true;
	}
}
