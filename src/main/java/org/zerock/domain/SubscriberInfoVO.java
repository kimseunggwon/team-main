package org.zerock.domain;

import java.util.Date;

import lombok.Data;



@Data
public class SubscriberInfoVO {

	private String subsId;
	private String subsName;
	private String subsAddress;
	private Integer storeid;
	private String subsOptions;
	private String subsAmount;
	private Long payCount;
	private String userPhonenum;

	// 구독 날짜 관련
	private Date serviceStartDate;
	
	
}
