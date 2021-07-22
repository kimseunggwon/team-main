package org.zerock.controller.YoungGon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.HelpVO;
import org.zerock.service.HelpService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/help/*")
@AllArgsConstructor
@Log4j
public class HelpController {
	
	private HelpService service;
	
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
	
	@RequestMapping("/askList")
	public String checkAsk() {
		log.info("1:1 문의글 리스트 확인");
		
		return "help/askList";
	}
	
	/* 글 작성 등록 */
	@RequestMapping("register")
	public String register(HelpVO help, @RequestParam("file") MultipartFile file, RedirectAttributes rttr) {
		help.setFileName(file.getOriginalFilename());
		
		// service에게 등록 업무 시키고
		service.register(help, file);
		
		// redirect 목적지로 정보 전달
		rttr.addFlashAttribute("result", help.getBno());
		rttr.addFlashAttribute("messageTitle", "등록 성공");
		rttr.addFlashAttribute("messageBody", help.getBno() + "번 게시물 등록 되었습니다.");
		
		// help/askList로 redirect
		return "redirect:/board/list";
	}
	
	
}
