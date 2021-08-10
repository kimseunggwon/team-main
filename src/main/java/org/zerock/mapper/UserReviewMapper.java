package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.MemberVO;
import org.zerock.domain.ReviewCriteria;
import org.zerock.domain.StoreInfoVO;
import org.zerock.domain.UserReviewVO;

public interface UserReviewMapper {
	// 게시물 List 얻어오기 - getReviewList
	public List<UserReviewVO> getReviewList();
	
	// 공지사항 List 얻어오기
	public List<UserReviewVO> getAnnounceListWithPaging(ReviewCriteria recri);
	
	// 페이지 표시(Pagination) - getReviewListWithPaging
	public List<UserReviewVO> getReviewListWithPaging(ReviewCriteria recri);
	
	// 리뷰 작성 및 등록하기 - insertReviewSelectKey
	public int insertReviewSelectkey(UserReviewVO review);
	
	// 리뷰 게시물 읽어내기 - readReview
	public UserReviewVO readReview(int reBno);
	
	// 리뷰 게시물 수정하기 - updateReview
	public int updateReview(UserReviewVO review);
	
	// 리뷰 게시물 삭제하기 - deleteReview
	public int deleteReview(int reBno);
	
	// 리뷰 (해당 유저) 게시물 삭제하기 - removeReviewByUserid *******
	public int removeReviewByUserid(MemberVO mvo);
	
	// 리뷰 게시물 총 개수 가져오기 - getReviewTotalCount
	public int getReviewTotalCount(ReviewCriteria recri);
	
	// 리뷰 조회수 설정하기 - setViewCount
	public void setViewCount(int reBno);

	// 리뷰 평점 설정하기 - setReviewStar
	public int setReviewStar(int reBno);

	// 리뷰 평점 얻어오기 - getReviewStar
	public int getReviewStar(int reBno);

	// 구독자 정보 불러오기 >>> SubscribeInfoServiceImpl.java에 사용
	public StoreInfoVO readSubInfo(MemberVO mvo);

	
}