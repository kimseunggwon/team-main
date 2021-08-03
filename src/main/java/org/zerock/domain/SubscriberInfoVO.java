package org.zerock.domain;

import lombok.Data;



@Data
public class SubscriberInfoVO {

	private String subsId;
	private String subsName;
	private String subsAddress;
	private Integer storeid;
	private String subsOptions;
	private String subsAmount;
	private String serviceStartDate;
	
	
}
