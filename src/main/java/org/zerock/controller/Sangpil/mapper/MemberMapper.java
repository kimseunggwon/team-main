package org.zerock.controller.Sangpil.mapper;

import org.zerock.controller.Sangpil.domain.AuthVO;
import org.zerock.controller.Sangpil.domain.MemberVO;

public interface MemberMapper {

	public int insert(MemberVO vo);
	
	public int insertAuth(AuthVO vo);
	
	public MemberVO read(String userid);

	public int update(MemberVO vo);

	public int remove(MemberVO vo);
	
	public int removeAuth(MemberVO vo);
}
