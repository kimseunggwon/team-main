package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AuthVO;
import org.zerock.domain.B2BmemberVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.StoreVO;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder encoder;
	
//	@Setter(onMethod_ = @Autowired)
//	private ReplyMapper replyMapper;
//	
//	@Setter(onMethod_ = @Autowired)
//	private BoardMapper boardMapper;
//	
//	@Setter(onMethod_ = @Autowired)
//	private FileMapper fileMapper;

	@Override
	@Transactional
	public boolean insert(MemberVO vo) {

		// 패스워드 암호화
		vo.setUserpw(encoder.encode(vo.getUserpw()));
		int cnt = mapper.insert(vo);
		
		// 권한 입력
		AuthVO avo = new AuthVO();
		avo.setUserid(vo.getUserid());
		avo.setAuth("ROLE_USER");
		mapper.insertAuth(avo);
		
		return cnt == 1;
	}
	
	@Override
	@Transactional
	public boolean b2binsert(B2BmemberVO vo) {
		
		// 패스워드 암호화
		vo.setUserpw(encoder.encode(vo.getUserpw()));
		int cnt = mapper.insertb2b(vo);
				
		// 권한 입력
		AuthVO avo = new AuthVO();
		avo.setUserid(vo.getUserid());
		avo.setAuth("ROLE_B2BUSER");
		mapper.insertAuth(avo);
		
		// store정보 입력
		StoreVO svo = new StoreVO();
		svo.setUserid(vo.getUserid());
		svo.setStoreName(vo.getStoreName());
		svo.setStoreUserAddress(vo.getStoreUserAddress());
		svo.setStoreAddress(vo.getStoreAddress());
		svo.setStorePhonenum(vo.getStorePhonenum());
		svo.setBusinessNum(vo.getBusinessNum());
		svo.setStorelat(vo.getStorelat());
		svo.setStorelag(vo.getStorelag());
		mapper.insertstoreinfo(svo);
				
		return cnt == 1;
	}
	
	@Override
	@Transactional
	public boolean empinsert(B2BmemberVO vo) {
		
		// 패스워드 암호화
		vo.setUserpw(encoder.encode(vo.getUserpw()));
		int cnt = mapper.insertemp(vo);
				
		// 권한 입력
		AuthVO avo = new AuthVO();
		avo.setUserid(vo.getUserid());
		avo.setAuth("ROLE_EMPUSER");
		mapper.insertAuth(avo);
		
		// store정보 입력
		StoreVO svo = new StoreVO();
		svo.setUserid(vo.getUserid());
		svo.setStoreName(vo.getStoreName());
		svo.setStoreUserAddress(vo.getStoreUserAddress());
		svo.setStoreAddress(vo.getStoreAddress());
		svo.setStorePhonenum(vo.getStorePhonenum());
		svo.setBusinessNum(vo.getBusinessNum());
		svo.setStorelat(vo.getStorelat());
		svo.setStorelag(vo.getStorelag());
		mapper.insertstoreinfo(svo);
				
		return cnt == 1;
	}
	
	
	
	
	
	
	
	
	
	
	@Override
	public MemberVO read(String name) {
		
		return mapper.read(name);
	}
	
	@Override
	public List<MemberVO> read4(String userid) {
		
		return mapper.read4(userid);
	}
	
	
	@Override
	public List<MemberVO> read2(MemberVO vo) {
		
		return mapper.read2(vo);
	}
	
	@Override
	public List<MemberVO> read3(MemberVO vo) {
		
		return mapper.read3(vo);
	}
	 
	@Override
	public boolean modify(MemberVO vo, String oldPassword) {
		MemberVO old = mapper.read(vo.getUserid());
		
		if(encoder.matches(oldPassword, old.getUserpw())) {
			return modify(vo);
		}
		
		return false;
	}

	
	@Override
	public boolean modify(MemberVO vo) {
		
		vo.setUserpw(encoder.encode(vo.getUserpw()));
		
		int cnt = mapper.update(vo);
		
		return cnt == 1;
	}
	
	@Override
	public boolean remove(MemberVO vo, String oldPassword) {
		MemberVO old = mapper.read(vo.getUserid());
		if(encoder.matches(oldPassword, old.getUserpw())) {
			return remove(vo);
		}
		
		return false;
	}
	
	@Override
	public boolean remove(MemberVO vo) {
//		// tbl_reply 삭제
//		replyMapper.removeByUserid(vo);
//		
//		// 본인 게시물의 다른 사람 댓글 삭제
//		replyMapper.removeByBnoByUserid(vo);
//		
//		// tbl_board_file 삭제
//		fileMapper.removeByUserid(vo);
//		
//		// tbl_board 삭제
//		boardMapper.removeByUserid(vo);
		
		// tbl_member_auth 삭제한거
		mapper.removeAuth(vo);
		
		// tbl_member 삭제한거
		int cnt = mapper.remove(vo);
		return cnt == 1;
	}

	@Override
	public boolean updateauth(String id) {
		
		int cnt = mapper.updateauth(id);
		
		return cnt == 1;
	}
}




