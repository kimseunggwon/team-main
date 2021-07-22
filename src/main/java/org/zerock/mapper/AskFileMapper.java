package org.zerock.mapper;

import org.zerock.domain.AskFileVO;
import org.zerock.domain.MemberVO;

public interface AskFileMapper {
	
	public int insert(AskFileVO vo);

	public void deleteByBno(Long bno);

	public void removeByUserid(MemberVO vo);
	
}

