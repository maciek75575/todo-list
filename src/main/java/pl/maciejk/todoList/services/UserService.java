package pl.maciejk.todoList.services;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import pl.maciejk.todoList.dao.IUserDao;
import pl.maciejk.todoList.model.User;

@Service
public class UserService extends BaseService<IUserDao, User> {
	
	public User userByLogin(String name) {
		return iDao.findByLogin(name);
	}
	
	public User userByEmail(String email) {
		return iDao.findByEmail(email);
	}
	
	public boolean isIdAndLoginMatching(Long id, String login) {
		if (iDao.findById(id).equals(iDao.findByLogin(login))) return true;
		else return false;
	}
	
	public boolean isLogged(Long id) {
		if (iDao.findById(id).getLogin().equals(SecurityContextHolder.getContext().getAuthentication().getName())) return true;
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
		return (findById(id) != null);
	}
	
	public boolean doesExist(String login) {
		return (userByLogin(login) != null);
	}
	
	public boolean doesEmailExist(String email) {
		return (userByEmail(email) != null);
	}
	
	public boolean isLoginOccupied(String login) {
		if (iDao.findByLogin(login) == null) return false;
		else return true;
	}
	
	public boolean isEmailOccupied(String email) {
		if (iDao.findByEmail(email) == null) return false;
		else return true;
	}
}
