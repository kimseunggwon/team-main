package org.zerock.controller.wonhyeok;

import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.SubscriberInfoVO;
import org.zerock.domain.cancelSubs.SubsCancelPageDTO;
import org.zerock.domain.cancelSubs.SubsCancelVO;
import org.zerock.domain.cancelSubs.SubsCriteria;
import org.zerock.domain.smsDomain.Coolsms;
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
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/cancelSubsBoard")
	public void cancelSubsBoard(@ModelAttribute("cri") SubsCriteria cri,Model model) {
		
		int total = service.getTotalCount(cri);
		
		List<SubsCancelVO> list = service.getReviewList(cri);
		
		model.addAttribute("list", list);
		model.addAttribute("PageMaker", new SubsCancelPageDTO(cri, total));

	}
	
	@PostMapping("/checkSubsUser")
	@PreAuthorize("isAuthenticated()")
	@ResponseBody
	public String checkSubsUser(String userid) {

		return service.checkSubsUser(userid);
	}
	
	@PostMapping("/checkSubsBoard")
	@PreAuthorize("isAuthenticated()")
	@ResponseBody
	public String checkSubsBoard(String userid) {
		return service.checkSubsBoard(userid);
		
	}
	
// 구독취소 등록
	@RequestMapping("/cancelSubsRegister")
	@PreAuthorize("hasRole('ROLE_USER') || hasRole('ROLE_BLACK')")
	public void cancelSubsRegister() {

	}
	
	@PostMapping("/cancelSubsRegister")
	@PreAuthorize("hasRole('ROLE_USER') || hasRole('ROLE_BLACK')")
	@ResponseBody
	public void cancelSubsRegister(SubsCancelVO vo) {
		service.cancelSubsRegister(vo);
	}
	
// 구독등록 보기
	@GetMapping({"/cancelSubsGet","/cancelSubsModify"})
	@PreAuthorize("isAuthenticated()")
	public void cancelSubsGet(@RequestParam("bno") Long bno, @ModelAttribute("cri") SubsCriteria cri, 
			Model model) {
		SubsCancelVO vo = service.getContentByBno(bno);
		model.addAttribute("board",vo);
	}
	
// 구독 게시판 수정	
	  @PostMapping("/cancelSubsModify1")
	  @PreAuthorize("principal.username == #vo.subsid")
	  @ResponseBody
	  public String cancelSubsModify(SubsCancelVO vo) {
		  
	  boolean success = service.cancelSubsModify(vo);
	  if(success) {
		return "success"; 
		  } else { 
		return "error"; 
		} 
	  
	 }
	 
	
// 구독취소 게시판 지우기	
	@PostMapping("/cancelSubsRemove")
	@PreAuthorize("principal.username == #subsid")
	@ResponseBody
	public void cancelSubsRemove(Long bno,String subsid) {
		
		service.cancelSubsRemove(bno);
	}
	
	@PostMapping("/cancelSubsRemoveADMIN")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody
	public void cancelSubsRemoveADMIN(Long bno,String subsid) {
		
		service.cancelSubsRemove(bno);
	}
	
	
	  @PostMapping("/cancelSubsRefund")
	  @PreAuthorize("hasRole('ROLE_ADMIN')")
	  @ResponseBody 
	  public Map<String, String> cancelSubsRefund(String subsid, Long bno) {
		  
		  // 구독자 데이터 갖고오기
		  SubscriberInfoVO vo1 = service.getCancelSubsUserRemove(subsid);
		  
		  Map<String,String> userInfo = new HashMap<>();
		  userInfo.put("userPhonenum", vo1.getUserPhonenum());
		  userInfo.put("SubsName", vo1.getSubsName());
		  

		  // 구독자 데이터 옮기기
		  SubscriberInfoVO vo2 = new SubscriberInfoVO();
		  vo2.setSubsId(vo1.getSubsId());
		  vo2.setSubsName(vo1.getSubsName());
		  vo2.setSubsAddress(vo1.getSubsAddress());
		  vo2.setStoreid(vo1.getStoreid());
		  vo2.setSubsOptions(vo1.getSubsOptions());
		  vo2.setSubsAmount(vo1.getSubsAmount());
		  vo2.setPayCount(vo1.getPayCount());
		  vo2.setServiceStartDate(vo1.getServiceStartDate());
		  

		  
		  //구독자 데이터 subsCancelList로 옮기기
		  service.insertCancelSubsUser(vo2);
		  
		  //게시굴 지우기
		  service.cancelSubsRemove(bno);
		  // 구독자 데이터 지우기		  
		  boolean success = service.cancelSubsUserRemove(subsid);
		  
		return userInfo; 

	  }
	  
	  	@PostMapping(value = "/sms.do", produces = { "application/json; charset=utf-8" })
	  	@PreAuthorize("hasRole('ROLE_ADMIN')")
		@ResponseBody
		public String sendSms(String userPhonenum, String SubsName) throws Exception {
			String api_key = "NCSMBWEGADMZITWJ";
			String api_secret = "9MDPLWJRA5UJBHFOKDR9HJB022B35Z5Q";

			Coolsms coolsms = new Coolsms(api_key, api_secret);

			HashMap<String, String> set = new HashMap<String, String>();
			
			LocalDate today = LocalDate.now();
			String S_todat = String.valueOf(today);
			
			
			set.put("to", userPhonenum); // 받는 사람
			set.put("from", "01037278235"); // 발신번호
			set.put("text", SubsName + "님의 빨래널자-구독서비스가" + S_todat + " 부로 취소되었습니다"); // 문자내용
			set.put("type", "sms"); // 문자 타입


			JSONObject result = coolsms.send(set); // 보내기&전송결과받기

			if ((boolean) result.get("status") == true) {
				// 메시지 보내기 성공 및 전송결과 출력
				System.out.println("성공");
				/*
				 * System.out.println(result.get("group_id")); // 그룹아이디
				 * System.out.println(result.get("result_code")); // 결과코드
				 * System.out.println(result.get("result_message")); // 결과 메시지
				 * System.out.println(result.get("success_count")); // 메시지아이디
				 * System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
				 */			
				} else {
				// 메시지 보내기 실패
				System.out.println("실패");
				System.out.println(result.get("code")); // REST API 에러코드
				System.out.println(result.get("message")); // 에러메시지

			}
			return "suc";

		}
}


