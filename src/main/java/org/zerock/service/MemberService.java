package org.zerock.service;

import org.zerock.domain.MemberVO;

public interface MemberService {
 
	MemberVO read(String name);
	
	boolean modify(MemberVO vo);

	boolean remove(MemberVO vo);
	
	boolean insert(MemberVO vo);
}
