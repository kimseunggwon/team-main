package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class HelpVO {
	
	private long bno;
	private String title;
	private String content;
	private String writer;
	private String wirterName;
	private Date regdate;
	private Date updateDate;
	
	private int replyCnt;
	
	private String fileName;
	
	
}
