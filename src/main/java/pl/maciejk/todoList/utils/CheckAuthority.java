package pl.maciejk.todoList.utils;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

public class CheckAuthority {

	@SuppressWarnings("unchecked")
	public static boolean hasAuthority(String auth) {
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		boolean hasRole = false;
		for (GrantedAuthority authority : authorities) {
			hasRole = authority.getAuthority().equals(auth);
			if (hasRole)
				break;
		}
		return hasRole;
	}
}
