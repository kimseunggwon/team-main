package org.zerock.controller.wonhyeok;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.MemberVO;
import org.zerock.domain.SubsFinalInfoVO;
import org.zerock.domain.SubscribeDate;
import org.zerock.domain.SubscribeViewVO;
import org.zerock.domain.SubscriberInfoVO;
import org.zerock.service.SubscribeInfoService;
import org.zerock.service.WonhyeokRestService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/subscribe/*")
@AllArgsConstructor
@Log4j
public class SubscribeController {

	@Setter(onMethod_ = @Autowired)
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
			SubscribeDate dateData,String userid) {

		
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

		
		log.info(userid);
		SubsFinalInfoVO vo = service.ABCD(userid);

		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		model.addAttribute("subDateList", realSubDateList);
		model.addAttribute("subsInfo", vo);

		
		
		// 구독 세탁소 정보

		return "/subscribe/finalinfo";
	}
	
	

}
