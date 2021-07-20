package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class B2BmemberVO {

	private String userid;
	private String userpw;
	private String userName;
	
	private String userDetailAddress;
	private String userAddress;
	private Double lat; //경도
	private Double lag; //위도
	
	private Date birthDate;
	private String userPhonenum;
	private String userEmail;
	private int userSex;
	private String userNickname;
	
	private String storeName;
	private String storeUserAddress;
	private String storeAddress;
	private String storePhonenum;
	private String businessNum;
	private Double storelat;
	private Double storelag;
	
	private boolean enabled;
	
	private List<AuthVO> authList;
}
