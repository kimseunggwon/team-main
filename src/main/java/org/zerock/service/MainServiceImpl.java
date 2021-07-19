package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.AuthVO;
import org.zerock.domain.MainVO;
import org.zerock.mapper.MainMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MainServiceImpl implements MainService {

	@Setter(onMethod_ = @Autowired)
	private MainMapper mapper;
	
	@Override
	public boolean checkLogin(MainVO main) {
		int cnt =  main.getUserid();
		
		return cnt == 1;
	}
}
