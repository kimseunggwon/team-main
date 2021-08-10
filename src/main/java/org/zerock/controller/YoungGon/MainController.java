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
	
	/* 메인 페이지 접속 */
	@RequestMapping("/main")
	public String main() {
		
		return "member/main";
	}
	
	/* 로그인 페이지 접속 */
	@RequestMapping("mainLogin")
	public String login() {
		
		return "member/login";
	}
	
	/* 로그아웃 */
	@RequestMapping("mainLogout")
	public String logout() {

		return "member/main";
	}
	
	/* 마이페이지 접속 */
	@RequestMapping("mainMypage")
	public String myPage() {
		
		return "member/mypage";
	}
	
	/* 회원가입 페이지 접속 */
	@RequestMapping("mainSignup")
	public String signUp() {
		
		return "member/signup";
	}
	
	/* 고객센터 페이지 접속 */
	@RequestMapping("mainHelpdesk")
	public String helpdesk() {
		
		return "help/helpdesk";
	}
	
	/* 로그인 유저 정보 확인 */
	@PostMapping("/getLoginInfo")
	@ResponseBody
	public String getLoginInfo(String userid) {
		
		String loginID = service.subscribe(userid);
		return loginID;
		
	}
	
	/* 로그인 한 유저의 권한 확인 */
	@GetMapping("/getMemberAuth")
	@ResponseBody
	public String getMemberAuth(String userid) {
		String auth = service.getAuthByuserid(userid);
		return auth;
		
		
	}

	
}