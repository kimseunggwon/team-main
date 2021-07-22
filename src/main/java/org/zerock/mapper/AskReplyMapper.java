package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AskReplyVO;



public interface AskReplyMapper {

	public int insert(AskReplyVO vo);
	
	public int insertSelectKey(AskReplyVO vo);
	
	public AskReplyVO read(Long rno);
	
	public int delete(Long rno);
	
	public int update(AskReplyVO vo);
	
	public List<AskReplyVO> getList(Long bno);
	
	public int getCountByBno(Long bno);
	
	public int deleteByBno(Long bno);

	public void removebyUserid(AskReplyVO vo);

	public void removeByBnoByUser(AskReplyVO vo);
	
}
