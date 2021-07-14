package org.zerock.controller.Sangpil.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.zerock.controller.Sangpil.domain.MemberVO;
import org.zerock.controller.Sangpil.mapper.MemberMapper;
import org.zerock.controller.Sangpil.security.domain.CustomUser;

import lombok.Setter;

public class CustomUserDetailsService implements UserDetailsService{

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberVO vo = mapper.read(username);
		
		if (vo == null) {
			throw new UsernameNotFoundException("사용자를 찾을 수 없습니다. username: " + username);
			
		}
		
		return new CustomUser(vo);
	}

}
