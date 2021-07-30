
package org.zerock.controller.gwon;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.security.domain.CustomUser;
import org.zerock.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/member")
@Controller
public class testController {
 
    @Setter(onMethod_ =@Autowired )
    private MemberService service;


	@RequestMapping("/mypage")
	public void info() {
		log.info("메인페이지");
	}
	
	@RequestMapping("/subinfo")
	public void subinfo() {
		log.info("구독정보 확인");
	} 
	 
	
	
	@RequestMapping("/myinfo")
	public void info( Model model, Principal principal) {
		
		log.info("내정보 확인 : " + principal.getName());
		
		MemberVO member = service.read(principal.getName());
		
		model.addAttribute("member", member);
	} 
	
	@GetMapping("/exp")
	public String logout() {
		log.info("실험");
		   
		return "";
	}  
	
	
	
	@PostMapping("/modify")
	public String modify(MemberVO vo,RedirectAttributes rttr) {
		log.info(vo);
		log.info("아이디:" + vo.getUserpw() + "비번:"+ vo.getUserpw());

		 service.modify(vo);
		
		return "redirect:/member/myinfo";
	} 
	 
	@PostMapping("/remove")
	public String remove(MemberVO vo) {
		log.info(vo.getUserid());
		
		service.remove(vo);
		
		return "redirect:/member/myinfo";
	}

 
	
	/*
	 * @RequestMapping("/myget") 
	 * public void myget( Model model, Principal
	 * principal) {
	 * 
	 * log.info("get : " + principal.getName());
	 * 
	 * MemberVO member = service.read(principal.getName());
	 * 
	 * model.addAttribute("member", member); }
	 */
	

	@RequestMapping("/myget")
	public void myget(Model model, Principal principal) {
		log.info("get");
		
		MemberVO member =service.read(principal.getName());
		
		model.addAttribute("member", member);
	}
	
}












