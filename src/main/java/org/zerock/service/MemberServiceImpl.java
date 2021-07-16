package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
 
	@Override
	public MemberVO read(String name) {

		return mapper.read(name);
	}

	@Override
	public boolean modify(MemberVO vo) {
	
		 
		 mapper.update(vo);
		 
		 return false;
	}

	@Override
	public boolean remove(MemberVO vo) {
		
		mapper.remove(vo);
		
		return true;
	}

	@Override
	public boolean insert(MemberVO vo) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	
}
