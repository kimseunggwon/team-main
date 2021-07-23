package org.zerock.controller.YoungGon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.HelpVO;
import org.zerock.domain.PageDTO;
import org.zerock.domain.Pagenation;
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
		return "redirect:/help/askList";
	}
	
	@GetMapping("/askList")
	public String list(@ModelAttribute("pag") Pagenation pag, Model model) {
		
		int total = service.getTotal(pag);
		
		List<HelpVO> list = service.getList(pag);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(pag, total));
		
		
		return "help/askList";
	}
	
	@GetMapping({"/askGet", "/modify"})
	public void askGet(@RequestParam("bno") Long bno, @ModelAttribute("pag") Pagenation pag, Model model) {
		log.info("1:1 문의글 들어감");
		
		HelpVO vo = service.get(bno);
		
		model.addAttribute("help", vo);
	}
	
	@PostMapping("/modify")
	@PreAuthorize("principal.userid == #help.writer")
	public String modify(HelpVO help, Pagenation pag, @RequestParam("file") MultipartFile file, RedirectAttributes rttr) {
		
		boolean success = service.modify(help, file);
		
		if(success) {
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("messageTitle", "수정 성공");
			rttr.addFlashAttribute("messageBody", "수정 되었습니다.");
		}
		
		rttr.addAttribute("pageNum", pag.getPageNum());
		rttr.addAttribute("amount", pag.getAmount());
		rttr.addAttribute("type", pag.getType());
		rttr.addAttribute("keyword", pag.getKeyword());
		
		// forward of redirect
		return "redirect:/help/askList";
		
	}
	
	@PostMapping("/remove")
	@PreAuthorize("principal.userName == #writer") // 720 쪽
	public String remove(@RequestParam("bno") Long bno, 
			Pagenation pag, RedirectAttributes rttr, String writer) {
		//parameter 수집
		
		//service 일 시킴
		boolean success = service.remove(bno);
		//결과 담고
		if (success) {
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("messageTitle", "삭제 성공");
			rttr.addFlashAttribute("messageBody", "삭제 되었습니다.");
		}
		
		rttr.addAttribute("pageNum", pag.getPageNum());
		rttr.addAttribute("amount", pag.getAmount());
		rttr.addAttribute("type", pag.getType());
		rttr.addAttribute("keyword", pag.getKeyword());
		
		//forward or redirect
		return "redirect:/help/askList";
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()") // 교재 673~674p
	public void register(@ModelAttribute("pag") Pagenation pag) {
		// forward /WEB-INF/views/board/register.jsp
	}
	
}
