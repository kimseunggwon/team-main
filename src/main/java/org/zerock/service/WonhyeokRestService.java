package org.zerock.service;

import java.util.List;

import org.zerock.domain.AddressVO;

public interface WonhyeokRestService {

	public List<AddressVO> getsearchbystorename(String storename);

	public List<AddressVO> getlatlag(AddressVO vo);
	
}
