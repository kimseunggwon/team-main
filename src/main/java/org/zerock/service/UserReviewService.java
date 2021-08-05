package org.zerock.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.MemberVO;
import org.zerock.domain.ReviewCriteria;
import org.zerock.domain.StoreInfoVO;
import org.zerock.domain.UserReviewLikersVO;
import org.zerock.domain.UserReviewVO;

public interface UserReviewService {

	int getReviewTotal(ReviewCriteria recri);

	List<UserReviewVO> getReviewList(ReviewCriteria recri);

	List<UserReviewVO> getAnnounceList(ReviewCriteria recri);
	
	UserReviewVO reviewGet(int reBno);
	
	boolean reviewModify(UserReviewVO review);

	boolean reviewModify(UserReviewVO review, MultipartFile[] file);

	boolean reviewRemove(int reBno);

	void reviewWrite(UserReviewVO review);

	void reviewWrite(UserReviewVO review, MultipartFile[] file);
	
	int reviewLikecount(int reBno, String userid);

	List<UserReviewLikersVO> getLikersList(int reBno, String userid);
	
	// Order By

	List<UserReviewVO> getPopularList(ReviewCriteria recri);

	List<UserReviewVO> getLatestList(ReviewCriteria recri);

	List<UserReviewVO> getviewCountList(ReviewCriteria recri);

	int getReviewStar(int reBno);

	// 가게 주소 불러오기
	StoreInfoVO readsubs(MemberVO vo);
	
	
}





