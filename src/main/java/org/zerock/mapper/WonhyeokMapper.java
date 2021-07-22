package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AddressVO;

public interface WonhyeokMapper {

	public List<AddressVO> getsearchbystorename(String storename);
	
	public List<AddressVO> getSearchArroundPlaces(AddressVO vo);


}
