package org.zerock.service;

import java.util.List;


import org.zerock.domain.B2BmemberVO;
import org.zerock.domain.MemberVO;

public interface MemberService {

	boolean insert(MemberVO vo);

	boolean b2binsert(B2BmemberVO vo);
	
	boolean empinsert(B2BmemberVO vo);
	
	MemberVO read(String name);

	List<MemberVO> read4(String userid);
	
	List<MemberVO> read2(MemberVO vo);
	
	List<MemberVO> read3(MemberVO vo);
	
	boolean modify(MemberVO vo);

	boolean remove(MemberVO vo);

	boolean remove(MemberVO vo, String oldPassword);

	boolean modify(MemberVO vo, String oldPassword);

	boolean updateauth(String id);
}
