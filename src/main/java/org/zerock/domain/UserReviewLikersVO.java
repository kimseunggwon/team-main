package org.zerock.domain;

import java.util.List;

import lombok.Data;

@Data
public class UserReviewLikersVO {
	private int id;
	private int reBno;
	private String userid;
	
	private List<MemberVO> likers;
}
