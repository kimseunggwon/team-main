package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AddressVO;
import org.zerock.domain.B2bIntroduceVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.StoreVO;
import org.zerock.domain.SubsFinalInfoVO;
import org.zerock.domain.SubscribeViewVO;
import org.zerock.domain.SubscriberInfoVO;
import org.zerock.domain.cancelSubs.SubsCancelVO;
import org.zerock.domain.cancelSubs.SubsCriteria;

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

	public B2bIntroduceVO getStoreInroducePageInfo(Long id);

	public StoreVO getStoreInfo(String id);

	public void cancelSubsRegister(SubsCancelVO vo);

	public List<SubsCancelVO> getReviewList(SubsCriteria cri);

	public int getTotalCount(SubsCriteria cri);

	public SubsCancelVO getContentByBno(Long bno);

	public int cancelSubsModify(SubsCancelVO vo);

	public void cancelSubsRemove(Long bno);

	public SubsFinalInfoVO ABCD(String subsUserId);

	public String checkSubsUser(String userid);

	public SubscriberInfoVO getCancelSubsUserRemove(String subsid);

	public void insertCancelSubsUser(SubscriberInfoVO vo2);

	public int cancelSubsUserRemove(String subsid);


}
