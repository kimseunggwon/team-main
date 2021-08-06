package org.zerock.service;

import java.util.List;

import org.zerock.domain.MemberVO;
import org.zerock.domain.StoreInfoVO;
import org.zerock.domain.SubscribeDate;

public interface SubscribeInfoService {
	List<String> getSubDateList(SubscribeDate dateData);
	
	StoreInfoVO getSubInfo(MemberVO mvo);
}
