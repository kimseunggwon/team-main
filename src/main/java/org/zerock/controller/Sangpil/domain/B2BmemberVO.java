package org.zerock.controller.Sangpil.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class B2BmemberVO {

	private String userid;
	private String userpw;
	private String userName;
	private String userAddress;
	private Date birthDate;
	private String userPhonenum;
	private String userEmail;
	private int userSex;
	private String userNickname;
	
	private boolean enabled;
	
	private List<AuthVO> authList;
}
