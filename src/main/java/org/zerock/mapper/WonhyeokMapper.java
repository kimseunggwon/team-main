package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AddressVO;
import org.zerock.domain.B2bIntroduceVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.SubscribeVO;

public interface WonhyeokMapper {

	public List<AddressVO> getsearchbystorename(String storename);
	
	public List<AddressVO> getSearchArroundPlaces(AddressVO vo);

	public void B2bIntroduceRegister(B2bIntroduceVO introduce);

	public Integer getid(B2bIntroduceVO introduce);

	public B2bIntroduceVO read(Integer id);

	public void deleteById(Integer id);

	public List<SubscribeVO> getNearStoreInfo(MemberVO vo);




}
