package pl.maciejk.todoList.services;

import java.util.List;

import org.springframework.stereotype.Service;

import pl.maciejk.todoList.dao.ICategoryDao;
import pl.maciejk.todoList.model.Category;
import pl.maciejk.todoList.model.User;

@Service
public class CategoryService extends BaseService<ICategoryDao, Category> {
	
	public List<Category> categoryByUser(User user) {
		return iDao.findByUser(user);
	}
	
	public boolean doesExist(Long id) {
		return (findById(id) != null);
	}
}
