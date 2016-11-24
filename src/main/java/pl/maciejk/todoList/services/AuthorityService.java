package pl.maciejk.todoList.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.maciejk.todoList.dao.IAuthorityDao;
import pl.maciejk.todoList.model.Authority;

@Service
public class AuthorityService {
	
	@Autowired
	private IAuthorityDao iAuthorityDao;

	public Authority authorityById(Long id) {
		return iAuthorityDao.findById(id);
	}
	
	public void authorityRemove(Long id) {
		iAuthorityDao.delete(id);
	}
	
	public void authorityAdd(Authority auth) {
		iAuthorityDao.save(auth);
	}
}
