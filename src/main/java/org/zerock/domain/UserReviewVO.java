package org.zerock.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class UserReviewVO {
	
	private int reBno;
	   private String reTitle;
	   private String reContent;
	   private String reWriter;
	   private String reWriterName;
	   private Timestamp reRegdate;
	   private Timestamp reUpdatedate;
	   private int viewCount;
	   private int likeCount;
	   private int reStars;
	   private int newReStars;
	   private String storeName;
	   private String storeAddress;
	   private Long storelat;
	   private Long storelag;
	// file
	// private String fileName;
	private List<String> fileName;
	private List<UserReviewLikersVO> likers;
	
}
