package org.zerock.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.ReviewCriteria;
import org.zerock.domain.UserReviewVO;

public interface UserReviewService {

	int getReviewTotal(ReviewCriteria recri);

	List<UserReviewVO> getReviewList(ReviewCriteria recri);

	void reviewWrite(UserReviewVO review, MultipartFile file);
	
	void reviewWrite(UserReviewVO review);

	UserReviewVO reviewGet(int reBno);
	
	boolean reviewModify(UserReviewVO review);

	boolean reviewModify(UserReviewVO review, MultipartFile file);

	boolean reviewRemove(int reBno);

	 
	
	
	
}
