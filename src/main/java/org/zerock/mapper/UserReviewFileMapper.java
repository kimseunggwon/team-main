package org.zerock.mapper;

import org.zerock.domain.MemberVO;
import org.zerock.domain.UserReviewFileVO;

public interface UserReviewFileMapper {
	// reviewFileInsert - 파일 업로드 하기
	public int reviewFileInsert(UserReviewFileVO rfvo);
	
	// removeReviewByUserid - 해당 아이디 유저의 파일 삭제하기
	public void removeReviewByUserid(MemberVO member);
	
	// deleteReviewByBno - 파일 삭제 하기
	public void deleteReviewByBno(int reBno);
	
}
