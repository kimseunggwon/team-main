package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	
	private String userid;
	private String userpw;
	private String userName;
	
	private String userAddress;
	private String address;
	private Double lat; //경도
	private Double lag; //위도
	
	private Date birthDate;
	private String userPhonenum;
	private String userEmail;
	private Integer userSex;
	private String userNickname;
	
	
	private Boolean enabled;
	
	private List<AuthVO> authList;
}
