package pl.maciejk.todoList.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public abstract class BaseService<T extends CrudRepository<K, Long>, K> {
	
	@Autowired
	protected T iDao;
	
	public K findById(Long id) {
		return iDao.findOne(id);
	}
	
	public List<K> findAll() {
		return (List<K>) iDao.findAll();
	}

	public void addOrUpdate(K k) {
		iDao.save(k);
	}
	
	public void delete(K k) {
		iDao.delete(k);
	}
	
	public void delete(Long id) {
		iDao.delete(id);
	}
}
