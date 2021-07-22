package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.AskReplyVO;
import org.zerock.mapper.AskReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AskServiceImpl implements AskReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private AskReplyMapper mapper;
	
	@Override
	public int register(AskReplyVO vo) {
		
		return mapper.insert(vo);
	}

	@Override
	public AskReplyVO get(Long rno) {
		
		return mapper.read(rno);
	}

	@Override
	public int modify(AskReplyVO vo) {
		
		return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) {
		
		return mapper.delete(rno);
	}

	@Override
	public List<AskReplyVO> getList(Long bno) {
		
		return mapper.getList(bno);
	}
	
}
