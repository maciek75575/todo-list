package pl.maciejk.todoList.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import pl.maciejk.todoList.model.User;

@Repository
public interface IUserDao extends CrudRepository<User, Long> {
	public List<User> findAll();
	public User findById(Long id);
	public User findByLogin(String login);
	public User findByEmail(String email);
}
