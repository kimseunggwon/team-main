package org.zerock.controller.wonhyeok;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.AddressVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.SubsFinalInfoVO;
import org.zerock.domain.SubscribeDate;
import org.zerock.domain.SubscribeViewVO;
import org.zerock.domain.SubscriberInfoVO;
import org.zerock.domain.smsDomain.Coolsms;
import org.zerock.domain.smsDomain.smsVO;
import org.zerock.service.SubscribeInfoService;
import org.zerock.service.WonhyeokRestService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/subscribe/*")
@AllArgsConstructor
@Log4j
public class SubscribeController {

	private WonhyeokRestService service;
	private SubscribeInfoService subinfoservice;


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


	// 구독 캘린더
	@GetMapping("/finalinfo")
	public String calendar(Model model, 
			HttpServletRequest request, 
			SubscribeDate dateData) {

		
//		List<SubscribeDate> dateList = subinfoservice.getDateList(dateData);
//		Map<String, Integer> today_info =  dateData.today_info(dateData);
		
		// 달력 구하기
			Calendar cal = Calendar.getInstance();

			SubscribeDate calendarData;

			// 검색 날짜
			if(dateData.getDate().equals("") && dateData.getMonth().equals("")){

				dateData = new SubscribeDate(String.valueOf(cal.get(Calendar.YEAR)),
						String.valueOf(cal.get(Calendar.MONTH)),
						String.valueOf(cal.get(Calendar.DATE)),
						null);
			}

			// 검색 날짜 end

			Map<String, Integer> today_info =  dateData.today_info(dateData);

			List<SubscribeDate> dateList = new ArrayList<SubscribeDate>();

			// 실질적인 달력 데이터 리스트에 데이터 삽입 시작.
			// 일단 시작 인덱스까지 아무것도 없는 데이터 삽입
			for(int i = 1; i < today_info.get("start"); i++){

				calendarData = new SubscribeDate(null, null, null, null);

				dateList.add(calendarData);
			}

			// 날짜 삽입
			for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {

				if (i == today_info.get("today")) {

					calendarData = new SubscribeDate(String.valueOf(dateData.getYear()), 
							String.valueOf(dateData.getMonth()), 
							String.valueOf(i), 
							"today");
				} else {
					calendarData = new SubscribeDate(String.valueOf(dateData.getYear()), 
							String.valueOf(dateData.getMonth()), 
							String.valueOf(i), 
							"normal_date");
				}
				dateList.add(calendarData);
			}

			// 달력 빈 곳 빈 데이터로 삽입 (index)
			int index = 7 - dateList.size() % 7;

			if(dateList.size() % 7 != 0){

				for (int i = 0; i < index; i++) {

					calendarData = new SubscribeDate(null, null, null, null);

					dateList.add(calendarData);
				}
			}

		List<String> realSubDateList = subinfoservice.getSubDateList(dateData);


		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		model.addAttribute("subDateList", realSubDateList);

		
		
		// 구독 세탁소 정보

		return "/subscribe/finalinfo";
	}
	
	@GetMapping("/subsFinalInfo")
	@ResponseBody
	private AddressVO subsFinalInfo(String subsUserId) {
		log.info(subsUserId);
		AddressVO vo = service.getSubsFinalInfo(subsUserId);
		log.info(vo);
		return vo;
	}
	

}
