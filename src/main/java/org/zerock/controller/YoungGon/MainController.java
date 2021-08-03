package org.zerock.controller.YoungGon;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.service.MainService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@AllArgsConstructor
@Log4j
public class MainController {
	
	private MainService service;
	
	@RequestMapping("/main")
	public String main() {

		
		return "member/main";
	}
	
	
	@RequestMapping("mainLogin")
	public String login() {

		
		return "member/login";
	}
	
	@RequestMapping("mainLogout")
	public String logout() {

		
		return "member/main";
	}
	
	
	@RequestMapping("mainMypage")
	public String myPage() {

		
		return "member/mypage";
	}
	
	@RequestMapping("mainSignup")
	public String signUp() {
		
		return "member/signup";
	}
	
	@RequestMapping("mainHelpdesk")
	public String helpdesk() {
		
		return "help/helpdesk";
	}
	
	@PostMapping("/getLoginInfo")
	@ResponseBody
	public String getLoginInfo(String userid) {
		
		String loginID = service.subscribe(userid);
		return loginID;
		
	}
	
	@GetMapping("/getMemberAuth")
	@ResponseBody
	public String getMemberAuth(String userid) {
		String auth = service.getAuthByuserid(userid);
		return auth;
		
		
	}

	
}