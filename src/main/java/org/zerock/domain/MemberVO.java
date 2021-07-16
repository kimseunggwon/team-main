package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String userid;
	private String userpw;
	private String username;
	private String useradderss;
	private String userbirth;
	private String usertel;
	private String useremail; 
	private String usersex;
	private String usernickname;
	
	private Date regdate;
	private Date updateDate;
	
	private List<AuthVO> authList;
}
