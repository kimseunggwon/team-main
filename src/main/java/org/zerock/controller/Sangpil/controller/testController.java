package org.zerock.controller.Sangpil.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class testController {
	
	/*
	 * @Setter(onMethod_ = @Autowired) private MemberService service;
	 */

	@RequestMapping("/login")
	public void login() {
		log.info("login 들어왔습니당");
	}
	
	@PostMapping("/signup")
	public void signUp() {
		log.info("회원가입 들어왔습니당");
	}
	
	@PostMapping("/findid")
	public void findid() {
		log.info("아이디 찾기 들어왔습니당");
	}
	
	@PostMapping("/findpw")
	public void findpw() {
		log.info("비밀번호 찾기 들어왔습니당");
	}
	
}
