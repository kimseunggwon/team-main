package org.zerock.controller.Sangpil.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	
	private String userid;
	private String userpw;
	private String userName;
	private String useraddress;
	private Date birthDate;
	private String userphonenum;
	private String useremail;
	private int usersex;
	private Date regdate;
	private boolean enabled;
	
	private List<AuthVO> authList;
}
