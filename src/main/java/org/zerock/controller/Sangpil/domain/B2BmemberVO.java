package org.zerock.controller.Sangpil.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class B2BmemberVO {

	private String userid;
	private String userpw;
	private String userName;
	private String useraddress;
	private Date birthDate;
	private String userphonenum;
	private String useremail;
	private int usersex;
	private String storeaddress;
	private String storename;
	private String storephonenum;
	private int businessnum;
	
	private Date regdate;
	private boolean enabled;
	
	private List<AuthVO> authList;
}
