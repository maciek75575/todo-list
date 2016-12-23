package pl.maciejk.todoList.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import pl.maciejk.todoList.model.CategoryColor;

@Repository
public interface ICategoryColorDao extends CrudRepository<CategoryColor, Long> {
	public List<CategoryColor> findAll();
	public CategoryColor findById(Long id);
}
