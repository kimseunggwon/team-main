package org.zerock.controller.Sangpil.service;

import org.zerock.controller.Sangpil.domain.B2BmemberVO;
import org.zerock.controller.Sangpil.domain.MemberVO;

public interface MemberService {

	boolean insert(MemberVO vo);

	boolean b2binsert(B2BmemberVO vo);
	
	MemberVO read(String name);

	boolean modify(MemberVO vo);

	boolean remove(MemberVO vo);

	boolean remove(MemberVO vo, String oldPassword);

	boolean modify(MemberVO vo, String oldPassword);
}
