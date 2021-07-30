package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AddressVO;
import org.zerock.domain.B2bIntroduceVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.SubscribeViewVO;
import org.zerock.domain.SubscriberInfoVO;

public interface WonhyeokMapper {

	public List<AddressVO> getsearchbystorename(String storename);
	
	public List<AddressVO> getSearchArroundPlaces(AddressVO vo);

	public void B2bIntroduceRegister(B2bIntroduceVO introduce);

	public Integer getid(B2bIntroduceVO introduce);

	public B2bIntroduceVO read(Integer id);

	public void deleteById(Integer id);

	public List<SubscribeViewVO> getNearStoreInfo(MemberVO vo);

	public void SaveSubscriberInfo(SubscriberInfoVO info);

	public List<SubscribeViewVO> getStoreList();

	public List<SubscribeViewVO> getStoreListBySearch(SubscribeViewVO vo);




}
