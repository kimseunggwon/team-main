package org.zerock.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.AddressVO;
import org.zerock.domain.B2bIntroduceVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.StoreVO;
import org.zerock.domain.SubscribeViewVO;
import org.zerock.domain.SubscriberInfoVO;
import org.zerock.domain.cancelSubs.SubsCancelVO;
import org.zerock.domain.cancelSubs.SubsCriteria;

public interface WonhyeokRestService {

	public List<AddressVO> getsearchbystorename(String storename);

	public List<AddressVO> getlatlag(AddressVO vo);

	public Integer getid(B2bIntroduceVO introduce);

	public void B2bIntroduceRegister(B2bIntroduceVO introduce, MultipartFile file);

	public void B2bIntroduceModify(B2bIntroduceVO introduce, MultipartFile file);

	public List<SubscribeViewVO> getNearStireInfo(MemberVO vo);

	public void SaveSubscriberInfo(SubscriberInfoVO info);

	public List<SubscribeViewVO> getStoreList();

	public List<SubscribeViewVO> getStoreListBySearch(SubscribeViewVO vo);

	public B2bIntroduceVO getStoreInroducePageInfo(Long id);

	public StoreVO getStoreInfo(String id);

	public void cancelSubsRegister(SubsCancelVO vo);

	public List<SubsCancelVO> getReviewList(SubsCriteria cri);

	public int getTotalCount(SubsCriteria cri);

	public SubsCancelVO getContentByBno(Long bno);

	public boolean cancelSubsModify(SubsCancelVO vo);

	public void cancelSubsRemove(Long bno);

	
}
