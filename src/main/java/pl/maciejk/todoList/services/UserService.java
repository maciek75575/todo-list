package pl.maciejk.todoList.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
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
	
	public boolean isIdAndLoginMatching(Long id, String login) {
		if (iUserDao.findById(id).equals(iUserDao.findByLogin(login))) return true;
		else return false;
	}
	
	public boolean isLogged(Long id) {
		if (iUserDao.findById(id).getLogin().equals(SecurityContextHolder.getContext().getAuthentication().getName())) return true;
		else return false;
	}
	
	public boolean isLogged(String login) {
		if (login.equals(SecurityContextHolder.getContext().getAuthentication().getName())) return true;
		else return false;
	}
	
	public boolean isLogged(User user) {
		if (user.getLogin().equals(SecurityContextHolder.getContext().getAuthentication().getName())) return true;
		else return false;
	}
	
	public boolean doesExist(Long id) {
		return (userById(id) != null);
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
