package pl.maciejk.todoList.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.maciejk.todoList.dao.IAuthorityDao;
import pl.maciejk.todoList.model.Authority;
import pl.maciejk.todoList.model.User;

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
	
	public Authority roleUser(User user) {
		List<Authority> auth = user.getAuthorities();
		for(Authority a:auth)
			if (a.getAuthority().equals("ROLE_USER"))
				return a;
		return null;
	}
	
	public Authority roleAdmin(User user) {
		List<Authority> auth = user.getAuthorities();
		for(Authority a:auth)
			if (a.getAuthority().equals("ROLE_ADMIN"))
				return a;
		return null;
	}
}
