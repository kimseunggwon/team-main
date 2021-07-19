package org.zerock.domain;

import lombok.Data;

@Data
public class StoreVO {

	private String userid;
	private String storeName;
	private String storeUserAddress;
	private String storeAddress;
	private String storePhonenum;
	private String businessNum;
	private Double storelat;
	private Double storelag;
}
