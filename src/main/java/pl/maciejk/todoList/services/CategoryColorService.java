package pl.maciejk.todoList.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.maciejk.todoList.dao.ICategoryColorDao;
import pl.maciejk.todoList.model.CategoryColor;

@Service
public class CategoryColorService {

	@Autowired
	private ICategoryColorDao iCategoryColorDao;
	
	public List<CategoryColor> categoryColorAll() {
		return iCategoryColorDao.findAll();
	}
	
	public CategoryColor categoryColorById(Long id) {
		return iCategoryColorDao.findById(id);
	}
	
	public void categoryColorAdd(CategoryColor categoryColor) {
		iCategoryColorDao.save(categoryColor);
	}
	
	public void categoryColorRemove(Long id) {
		iCategoryColorDao.delete(id);
	}
	
	public boolean doesExist(Long id) {
		return (categoryColorById(id) != null);
	}
	
	public CategoryColor addMissingHashes(CategoryColor categoryColor) {
		if (categoryColor.getPrimaryCode().length()==6) categoryColor.setPrimaryCode("#" + categoryColor.getPrimaryCode());
		if (categoryColor.getSecondaryCode().length()==6) categoryColor.setSecondaryCode("#" + categoryColor.getSecondaryCode());
		return categoryColor;
	}
}
