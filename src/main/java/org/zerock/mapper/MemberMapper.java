package org.zerock.mapper;

import org.zerock.domain.AuthVO;
import org.zerock.domain.B2BmemberVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.StoreVO;

public interface MemberMapper {

	public int insert(MemberVO vo);
	
	public int insertb2b(B2BmemberVO vo);
	
	public int insertemp(B2BmemberVO vo);
	
	public void insertstoreinfo(StoreVO svo);
	
	public int insertAuth(AuthVO vo);
	
	public MemberVO read(String userid);

	public int update(MemberVO vo);

	public int remove(MemberVO vo);
	
	public int removeAuth(MemberVO vo);


}
