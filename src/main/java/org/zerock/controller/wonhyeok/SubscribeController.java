package org.zerock.controller.wonhyeok;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.MemberVO;
import org.zerock.domain.SubscribeDate;
import org.zerock.domain.SubscribeViewVO;
import org.zerock.domain.SubscriberInfoVO;
import org.zerock.domain.smsDomain.Coolsms;
import org.zerock.domain.smsDomain.smsVO;
import org.zerock.service.SubscribeCalendarService;
import org.zerock.service.WonhyeokRestService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/subscribe/*")
@AllArgsConstructor
@Log4j
public class SubscribeController {

	private WonhyeokRestService service;
	private SubscribeCalendarService calservice;

	@RequestMapping("/subsregister")
	public void main() {

	}

	@PostMapping("/getNearStoreInfo")
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
	@ResponseBody
	public void subscriberInfo(@RequestBody SubscriberInfoVO info) {
		service.SaveSubscriberInfo(info);
	}

	@GetMapping("/getStoreList")
	@ResponseBody
	public List<SubscribeViewVO> getStoreList() {
		List<SubscribeViewVO> list = service.getStoreList();

		return list;

	}

	@PostMapping("/getStoreListBySearch")
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
			SubscribeDate dateData){

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

		System.out.println(dateList);

		// 배열에 담음
		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		
		System.out.println("*** dateList *** : " + dateList);

		// ********************구독 날짜 데이터 *************************
		List<Integer> subDateList = new ArrayList<Integer>();

		// 오늘, 해당 달 최대 일 수(30, 31)
		Calendar subcal = Calendar.getInstance();
		subcal.set(Integer.parseInt(dateData.getYear()), 
				Integer.parseInt(dateData.getMonth()), 
				1);

		int startDay = subcal.getMinimum(java.util.Calendar.DATE);
		int endDay = subcal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
		int start = subcal.get(java.util.Calendar.DAY_OF_WEEK);

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd");
		LocalDate today = LocalDate.now();

		String formatedToday = today.format(formatter);
		int realToday = Integer.parseInt(formatedToday);

		System.out.println("**** 여기는 controller **** ");
		System.out.println("startDay : " + startDay); // 1
		System.out.println("endDay : " + endDay); // 31
		System.out.println("start : " + start); // 1
		System.out.println("today : " + formatedToday); // 04
		System.out.println("realToday : " + realToday); // 오늘 날짜 4 


		// 요일 구하기
		LocalDate subToday = LocalDate.now();
		DayOfWeek dayOfWeek = subToday.getDayOfWeek();
		int dayOfWeek2 = subToday.getDayOfMonth();
		int thisMonth = subToday.getMonthValue();

		int dayOfWeekNumber = dayOfWeek.getValue();

		System.out.println("date : " + subToday); // 2021-08-04
		System.out.println("dayOfWeek : " + dayOfWeek); // WEDNESDAY
		System.out.println("dayOfWeekNumber : " + dayOfWeekNumber); // 3 (수요일)
		System.out.println("dayOfWeekMonth : " + dayOfWeek2); // 4 (4주)
		System.out.println("thisMonth : " + thisMonth);  // 8(월)

		// list에 구독 날짜 넣기
		LocalDate first = subToday.minusDays(subToday.getDayOfWeek().getValue()).plusDays(8);
		
		List<String> realSubDateList = new ArrayList<String>();
		
		realSubDateList.add(first.toString());
		realSubDateList.add(first.plusDays(2).toString());
		realSubDateList.add(first.plusDays(4).toString());
		
		realSubDateList.add(first.plusDays(7).toString());
		realSubDateList.add(first.plusDays(9).toString());
		realSubDateList.add(first.plusDays(11).toString());
		
		realSubDateList.add(first.plusDays(14).toString());
		realSubDateList.add(first.plusDays(16).toString());
		realSubDateList.add(first.plusDays(18).toString());
		
		realSubDateList.add(first.plusDays(21).toString());
		realSubDateList.add(first.plusDays(23).toString());
		realSubDateList.add(first.plusDays(25).toString());
		
		System.out.println(realSubDateList);
		

		// model에 저장!
		model.addAttribute("subDateList", realSubDateList);

		return "/subscribe/finalinfo";
	}


}
