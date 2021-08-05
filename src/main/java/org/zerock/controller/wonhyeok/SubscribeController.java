package org.zerock.controller.wonhyeok;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.MemberVO;
import org.zerock.domain.SubscribeDate;
import org.zerock.domain.SubscribeViewVO;
import org.zerock.domain.SubscriberInfoVO;
import org.zerock.domain.smsDomain.Coolsms;
import org.zerock.domain.smsDomain.smsVO;
import org.zerock.service.WonhyeokRestService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/subscribe/*")
@AllArgsConstructor
@Log4j
public class SubscribeController {
	
	private WonhyeokRestService service;


	@RequestMapping("/subsregister")
	@PreAuthorize("hasRole('ROLE_USER') || hasRole('ROLE_ADMIN')")
	public void main() {
		
	}
	
	@PostMapping("/getNearStoreInfo")
	@PreAuthorize("hasRole('ROLE_USER') || hasRole('ROLE_ADMIN')")
	@ResponseBody
	public List<SubscribeViewVO> getNearStoreInfo(MemberVO vo) {
		List<SubscribeViewVO> subsvo =service.getNearStireInfo(vo);


		return subsvo;
	}
	
	@RequestMapping("/sms")
	public void sms() {
		
	}
	
	@PostMapping(value = "/sms.do", produces = { "application/json; charset=utf-8" })
	@ResponseBody
	public String sendSms(smsVO vo) throws Exception {
		String api_key = "NCSMBWEGADMZITWJ";
		String api_secret = "9MDPLWJRA5UJBHFOKDR9HJB022B35Z5Q";

		Coolsms coolsms = new Coolsms(api_key, api_secret);

		HashMap<String, String> set = new HashMap<String, String>();

		set.put("to", vo.getTo()); // 받는 사람
		set.put("from", "01037278235"); // 발신번호
		set.put("text", "안녕하세요 인증번호는 [" + vo.getText() + "]입니다"); // 문자내용
		set.put("type", "sms"); // 문자 타입
		

		JSONObject result = coolsms.send(set); // 보내기&전송결과받기

		if ((boolean) result.get("status") == true) {
			// 메시지 보내기 성공 및 전송결과 출력
			System.out.println("성공");
			System.out.println(result.get("group_id")); // 그룹아이디
			System.out.println(result.get("result_code")); // 결과코드
			System.out.println(result.get("result_message")); // 결과 메시지
			System.out.println(result.get("success_count")); // 메시지아이디
			System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
		} else {
			// 메시지 보내기 실패
			System.out.println("실패");
			System.out.println(result.get("code")); // REST API 에러코드
			System.out.println(result.get("message")); // 에러메시지

		}
		return "suc";

	}
	
	@PostMapping(value = "/saveSubsInfo", produces = { "application/json; charset=utf-8" })
	@PreAuthorize("hasRole('ROLE_USER') || hasRole('ROLE_ADMIN')")
	@ResponseBody
	public void subscriberInfo(@RequestBody SubscriberInfoVO info) {
		service.SaveSubscriberInfo(info);
	}
	
	@GetMapping("/getStoreList")
	@PreAuthorize("hasRole('ROLE_USER') || hasRole('ROLE_ADMIN')")
	@ResponseBody
	public List<SubscribeViewVO> getStoreList() {
		List<SubscribeViewVO> list = service.getStoreList();

		return list;
		
	}
	
	@PostMapping("/getStoreListBySearch")
	@PreAuthorize("hasRole('ROLE_USER') || hasRole('ROLE_ADMIN')")
	@ResponseBody
	public List<SubscribeViewVO> getStoreListBySearch(SubscribeViewVO vo) {
		List<SubscribeViewVO> list = service.getStoreListBySearch(vo);
		return list;
	}
	
	// 구독 최종 결과 확인
	@PostMapping("/finalinfo")
	public void getFinalinfo() {
		
	}
	
}
