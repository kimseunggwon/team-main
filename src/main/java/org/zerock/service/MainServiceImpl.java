package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.mapper.MainMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MainServiceImpl implements MainService{

	@Setter(onMethod_ = @Autowired)
	private MainMapper mapper;
	
	@Override
	public String subscribe(String loginID) {
	
		return mapper.subscribe(loginID);
	}
	
}
