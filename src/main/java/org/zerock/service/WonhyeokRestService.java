package org.zerock.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.AddressVO;
import org.zerock.domain.B2bIntroduceVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.SubscribeVO;

public interface WonhyeokRestService {

	public List<AddressVO> getsearchbystorename(String storename);

	public List<AddressVO> getlatlag(AddressVO vo);

	public Integer getid(B2bIntroduceVO introduce);

	public void B2bIntroduceRegister(B2bIntroduceVO introduce, MultipartFile file);

	public void B2bIntroduceModify(B2bIntroduceVO introduce, MultipartFile file);

	public List<SubscribeVO> getNearStireInfo(MemberVO vo);


	
}
