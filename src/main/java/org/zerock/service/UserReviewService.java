package org.zerock.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.ReviewCriteria;
import org.zerock.domain.UserReviewVO;

public interface UserReviewService {

	int getReviewTotal(ReviewCriteria recri);

	List<UserReviewVO> getReviewList(ReviewCriteria recri);

	UserReviewVO reviewGet(int reBno);
	
	boolean reviewModify(UserReviewVO review);

	boolean reviewModify(UserReviewVO review, MultipartFile file);

	boolean reviewRemove(int reBno);

	void reviewWrite(UserReviewVO review);

	void reviewWrite(UserReviewVO review, MultipartFile[] file);
	
	int reviewLikecount(int reBno);

	
	
}
