package org.zerock.controller.YoungGon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/help/*")
@AllArgsConstructor
@Log4j
public class HelpController {
	
	@RequestMapping("/helpdesk")
	public String go() {
		log.info("고객센터 접속");
		
		return "help/helpdesk";
	}
	
	@RequestMapping("/ask")
	public String goAsk() {
		log.info("1:1 문의 글 작성창");
		
		return "help/ask";
	}
	
	@RequestMapping("/register")
	public String register()
	
	
	@RequestMapping("/askList")
	public String checkAsk() {
		log.info("1:1 문의글 리스트 확인");
		
		return "help/askList";
	}
	
}
