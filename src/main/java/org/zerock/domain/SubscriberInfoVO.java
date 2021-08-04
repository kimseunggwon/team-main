package org.zerock.domain;

import java.sql.Timestamp;

import lombok.Data;



@Data
public class SubscriberInfoVO {

	private String subsId;
	private String subsName;
	private String subsAddress;
	private Integer storeid;
	private String subsOptions;
	private String subsAmount;

	// 구독 날짜 관련
	private Timestamp subsStartDate; // 구독 시작 날짜
	private String serviceStartDate;
	
	
}
