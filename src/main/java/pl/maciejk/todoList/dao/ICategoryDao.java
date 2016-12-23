package pl.maciejk.todoList.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import pl.maciejk.todoList.model.Category;
import pl.maciejk.todoList.model.User;

@Repository
public interface ICategoryDao extends CrudRepository<Category, Long> {
	public Category findById(Long id);
	public List<Category> findByUser(User user);
}
