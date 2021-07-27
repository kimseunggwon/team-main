package org.zerock.domain;

import lombok.Data;

@Data
public class SubscribeVO {

	private Integer id;
	private String storename;
	private String storeaddress;
	private String storePhonenum;
	private Double storelat;
	private Double storelag;
	private String fileName;
}
