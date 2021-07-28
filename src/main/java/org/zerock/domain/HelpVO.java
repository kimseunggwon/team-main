package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class HelpVO {
	
	private long bno;
	private String title;
	private String content;
	private String writer;
	private String writerName;
	private String userNickName;
	private Date regdate;
	private Date updateDate;
	
	private int replyCnt;
	
	private List<String> fileName;
	
	
}
