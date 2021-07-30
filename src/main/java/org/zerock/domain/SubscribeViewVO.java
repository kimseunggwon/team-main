package org.zerock.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
public class SubscribeViewVO {

	private Integer id;
	private String storename;
	private String storeaddress;
	private String storePhonenum;
	private Double storelat;
	private Double storelag;
	private String fileName;
	private String auth;

	
	private String type;
	private String keyword;
	
	
	public String[] getTypeArr() {
		if (type == null) {
			return new String[] {};
		} else {
			String[] types = type.split(""); 
			return types;
		}
		
	}
}
