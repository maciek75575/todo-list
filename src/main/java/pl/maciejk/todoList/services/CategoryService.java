package pl.maciejk.todoList.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.maciejk.todoList.dao.ICategoryDao;
import pl.maciejk.todoList.model.Category;
import pl.maciejk.todoList.model.User;

@Service
public class CategoryService {

	@Autowired
	private ICategoryDao iCategoryDao;
	
	public Category categoryById(Long id) {
		return iCategoryDao.findById(id);
	}
	
	public List<Category> categoryByUser(User user) {
		return iCategoryDao.findByUser(user);
	}
	
	public void categoryAdd(Category category) {
		iCategoryDao.save(category);
	}
	
	public void categoryRemove(Long id) {
		iCategoryDao.delete(id);
	}
	
	public boolean doesExist(Long id) {
		return (categoryById(id) != null);
	}
}
