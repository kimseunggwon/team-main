package org.zerock.domain;

import java.sql.Timestamp;

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
	
	// file
	private String fileName;
	
}
