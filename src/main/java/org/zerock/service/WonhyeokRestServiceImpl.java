package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.AddressVO;
import org.zerock.mapper.WonhyeokMapper;

import lombok.Setter;

@Service
public class WonhyeokRestServiceImpl implements WonhyeokRestService {
	
	@Setter(onMethod_ =@Autowired)
	private WonhyeokMapper mapper;


	@Override
	public List<AddressVO> getsearchbystorename(String storename) {

		return mapper.getsearchbystorename(storename);
	}


	@Override
	public List<AddressVO> getlatlag(AddressVO vo) {
		
		return mapper.getSearchArroundPlaces(vo);
	}


}
