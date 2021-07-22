package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.HelpVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.Pagenation;

public interface HelpMapper {
	
	public List<HelpVO> getList();
	
	public List<HelpVO> getListWithPaging(Pagenation pag);
	
	public int insert(HelpVO help);
	
	public int insertSelectkey(HelpVO help);
	
	public HelpVO read(long bno);
		
	public int delete(long bno);
	
	public int update(HelpVO help);
	
	public int getTotalCount(Pagenation pag);
	
	public void removeByUserId(MemberVO vo);
}
