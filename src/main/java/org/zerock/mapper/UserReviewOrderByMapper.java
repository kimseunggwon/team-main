package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ReviewCriteria;
import org.zerock.domain.UserReviewVO;

public interface UserReviewOrderByMapper {
	
	// 인기도 순 정렬 - getPopularReviewList
	public List<UserReviewVO> getPopularReviewList(ReviewCriteria recri);
	
	// 최신날짜 순 정렬 - getLatestReviewList
	public List<UserReviewVO> getLatestReviewList(ReviewCriteria recri);

	// 조회수 순 정렬 - getViewCountReveiwList
	public List<UserReviewVO> getViewCountReviewList(ReviewCriteria recri);

}
