package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.UserReviewLikersVO;

public interface UserReviewLikeMapper {
	
		// 리뷰 좋아요 수 설정하기 - setLikeCount
		public int setLikeCount(int reBno);
		
		// 리뷰 좋아요 수 얻어오기 - getLikeCount
		public int getLikeCount(int reBno);
		
		// 좋아요 사용자 목록 레코드 만들기 - insertLikers
		public int insertLikers(@Param("reBno") int reBno, @Param("userid") String userid);
		
		// 사용자가 좋아한 게시물 레코드 불러오기 - getLikersPicked
		public List<UserReviewLikersVO> getLikersPicked(int reBno);

		
}
