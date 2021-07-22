package org.zerock.service;

import java.util.List;

import org.zerock.domain.AskReplyVO;

public interface AskReplyService {

	public int register(AskReplyVO vo);
	
	public AskReplyVO get(Long rno);
	
	public int modify(AskReplyVO vo);
	
	public int remove(Long rno);
	
	public List<AskReplyVO> getList(Long bno);
	
}
