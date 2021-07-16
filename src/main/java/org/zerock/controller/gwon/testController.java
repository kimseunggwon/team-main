package org.zerock.controller.gwon;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/member")
@Controller
public class testController {
 
    @Setter(onMethod_ =@Autowired )
    private MemberService service;


	@RequestMapping("/main")
	public void info() {
		log.info("메인페이지");
	}
	
	@RequestMapping("/subinfo")
	public void subinfo() {
		log.info("구독정보 확인");
	} 
	 
	
	@GetMapping("/info")
	public void info( Model model) {
		log.info("내정보 확인");
	}
	
	@GetMapping("/logout")
	public void logout() {
		log.info("로그아웃");
	}
	
	
	
	@PostMapping("/kim")
	public String kim(MemberVO vo) {
		log.info(vo.getUsername());
		
		service.modify(vo);
		
		return "redirect:/member/info";
	}
	
	@PostMapping("/remove")
	public String remove(MemberVO vo) {
		log.info(vo.getUserid());
		
		service.remove(vo);
		
		return "redirect:/member/info";
	}
	
	
}












