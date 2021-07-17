package org.zerock.controller.YoungGon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main/*")
@AllArgsConstructor
@Log4j
public class MainController {
	
	@RequestMapping("/realmain")
	public String main() {
		log.info("메인 페이지 접속");
		
		return "main/realmain";
	}
	
	
	@RequestMapping("mainLogin")
	public String login() {
		log.info("로그인 페이지 접속");
		
		return "member/login";
	}
	
	@RequestMapping("mainLogout")
	public String logout() {
		log.info("로그아웃 후 메인화면으로 이동");
		
		return "main/realmain";
	}
	
	
	@RequestMapping("mainMypage")
	public String myPage() {
		log.info("마이페이지 접속");
		
		return "member/main";
	}
	
	@RequestMapping("mainSignup")
	public String signUp() {
		log.info("회원가입 페이지로 이동");
		
		return "member/signup";
	}
	
	@RequestMapping("mainHelpdesk")
	public String helpdesk() {
		log.info("고객센터 페이지로 이동");
		
		return "help/helpdesk";
	}
}