package org.zerock.controller.YoungGon;

import java.security.Principal;
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
	
	/* 고객센터 접속 */
	@RequestMapping("/helpdesk")
	@PreAuthorize("isAuthenticated()")
	public String go() {

		
		return "help/helpdesk";
	}
	
	/* 1:1 문의글 작성 창으로 접속 */
	@RequestMapping("/ask")
	@PreAuthorize("isAuthenticated()")
	public String goAsk() {

		
		return "help/ask";
	}
	
	/* 1:1 문의글 작성 등록 */
	@RequestMapping("register")
	@PreAuthorize("isAuthenticated()")
	public String register(HelpVO help, @RequestParam("file") MultipartFile[] file, RedirectAttributes rttr) {
		
		// service에게 등록 업무 시키고
		service.register(help, file);
		
		// redirect 목적지로 정보 전달
		rttr.addFlashAttribute("result", help.getBno());
		rttr.addFlashAttribute("messageTitle", "등록 성공");
		rttr.addFlashAttribute("messageBody", help.getBno() + "번 게시물 등록 되었습니다.");
		
		// help/askList로 redirect
		return "redirect:/help/askList";
	}
	
	/* 유저들이 자신이 작성한 1:1 문의글 내역을 확인할 수 있도록 함.(자신이 작성한 것만) */
	@GetMapping("/askList")
	@PreAuthorize("isAuthenticated()")
	public void userList(@ModelAttribute("pag") Pagenation pag, Model model, Principal principal) {
		
		pag.setWriter(principal.getName());
		
		int total = service.getTotalUser(pag);
		
		List<HelpVO> list = service.getListUser(pag);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(pag, total));

	}
	
	/* 관리자가 유저들이 작성한 1:1 문의글 내역을 확인할 수 있도록 함.(모든 1:1 문의글) */
	@GetMapping("/askListAdmin")
	@PreAuthorize("isAuthenticated()")
	public void adminList(@ModelAttribute("pag") Pagenation pag, Model model) {
		
		int total = service.getTotalAdmin(pag);
		
		List<HelpVO> list = service.getListAdmin(pag);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(pag, total));

	}
	
	/* 유저가 자신이 작성한 1:1 문의글을 확인할 수 있도록 함. */
	@GetMapping({"/askGetContent", "/askModifyContent"})
	@PreAuthorize("isAuthenticated()")
	public void askGetContent(@RequestParam("bno") Long bno, @ModelAttribute("pag") Pagenation pag, Model model) {

		
		askGet(bno, pag, model);
	}
	
	/* 유저가 자신이 작성한 1:1 문의글을 확인할 수 있도록 함. */
	@GetMapping("/get")
	   public void askGet(@RequestParam("bno") long bno, @ModelAttribute("pag") Pagenation pag, Model model) {
	      
	      
	      HelpVO vo = service.askGet(bno);
	      
	      model.addAttribute("help", vo);
	      
	   }

	/* 유저가 자신이 작성한 1:1 문의글만 수정할 수 있도록 함. */
	@PostMapping("/askModifyContent")
	@PreAuthorize("principal.username == #help.writer")
	public String askModifyContent(HelpVO help, Pagenation pag, @RequestParam("file") MultipartFile[] file, RedirectAttributes rttr) {
		
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
	
	/* 유저가 자신이 작성한 1:1 문의글만 삭제할 수 있도록 함. */
	@PostMapping("/askRemove")
	@PreAuthorize("principal.username == #writer") // 720 쪽
	public String askRemove(@RequestParam("bno") Long bno, 
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
	
	/* 1:1 문의글 등록 */
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()") // 교재 673~674p
	public void register(@ModelAttribute("pag") Pagenation pag) {
		// forward /WEB-INF/views/board/register.jsp
	}
	
	/*관리자가 1:1 문의글에 대한 삭제 권한을 가지도록 함*/
	@PostMapping("/askAdminRemove")
	@PreAuthorize("hasRole('ROLE_ADMIN')") // 720 쪽
	public String askAdminRemove(@RequestParam("bno") Long bno, 
			Pagenation pag, RedirectAttributes rttr, String writer) {
		//parameter 수집
		
		//service 일 시킴
		boolean success = service.AdminRemove(bno);
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
		return "redirect:/help/askListAdmin";
	}
	
	/*관리자가 1:1 문의글에 대한 수정을 진행할 때 작성자의 기존 정보를 가져오도록 함*/
	@GetMapping("/askAdminModifyContent")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void askAdminModifyContent(Long bno, Model model) {
		HelpVO vo = service.askGet(bno);
			      
		model.addAttribute("help", vo);
	}
	
	/*관리자가 1:1 문의글에 대한 수정 권한을 가지도록 함*/
	@PostMapping("/askAdminModifyContent")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String askAdminModifyContent(HelpVO help, MultipartFile[] file, Pagenation pag, RedirectAttributes rttr) {
		
		boolean success = service.AdminModify(help);
		
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
		return "redirect:/help/askListAdmin";
		
	}
	
}
