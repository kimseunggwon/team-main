package org.zerock.controller.wonhyeok;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.cancelSubs.SubsCancelPageDTO;
import org.zerock.domain.cancelSubs.SubsCancelVO;
import org.zerock.domain.cancelSubs.SubsCriteria;
import org.zerock.service.WonhyeokRestService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cancelSubs/*")
@AllArgsConstructor
@Log4j
public class SubscribeCancelController {

	private WonhyeokRestService service;
	
// 구독취소 게시판 리스트
	@GetMapping("/cancelSubsBoard")
	public void cancelSubsBoard(@ModelAttribute("cri") SubsCriteria cri,Model model) {
		
		int total = service.getTotalCount(cri);
		
		List<SubsCancelVO> list = service.getReviewList(cri);
		
		model.addAttribute("list", list);
		model.addAttribute("PageMaker", new SubsCancelPageDTO(cri, total));

	}
	
// 구독취소 등록
	@RequestMapping("/cancelSubsRegister")
	public void cancelSubsRegister() {

	}
	
	@PostMapping("/cancelSubsRegister")
	@ResponseBody
	public void cancelSubsRegister(SubsCancelVO vo) {
		service.cancelSubsRegister(vo);
	}
	
// 구독 게시판 수정	
	  @PostMapping("/cancelSubsModify1")
	  @ResponseBody
	  public String cancelSubsModify(SubsCancelVO vo) {
		  
	  boolean success = service.cancelSubsModify(vo);
	  if(success) {
		return "success"; 
		  } else { 
		return "error"; 
		} 
	  
	 }
	 
	
// 구독등록 보기
	@GetMapping({"/cancelSubsGet","/cancelSubsModify"})
	public void cancelSubsGet(@RequestParam("bno") Long bno, @ModelAttribute("cri") SubsCriteria cri, 
			Model model) {
		SubsCancelVO vo = service.getContentByBno(bno);
		model.addAttribute("board",vo);
	}
	
	@PostMapping("/cancelSubsRemove")
	@ResponseBody
	public void cancelSubsRemove(Long bno) {
		
		service.cancelSubsRemove(bno);
	}
	
	@PostMapping("/cancelSubsRefund")
	@ResponseBody
	public void cancelSubsRefund(String subsid) {
		
		service.cancelSubsRemove(subsid);
	}
}

