package org.zerock.service;

import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.zerock.domain.SubscribeDate;

@Service
public class SubscribeCalendarServiceImpl implements SubscribeCalendarService {

	@Override
	public List<Integer> getSubscribeDate(SubscribeDate sdates) {
		
		// 캘린더 데이터 
		Calendar cal = Calendar.getInstance();
		
		SubscribeDate calendarData;
		
		// 검색 날짜
		if(sdates.getDate().equals("") && sdates.getMonth().equals("")){
			
			sdates = new SubscribeDate(String.valueOf(cal.get(Calendar.YEAR)),
										 String.valueOf(cal.get(Calendar.MONTH)),
										 String.valueOf(cal.get(Calendar.DATE)),
										 null);
		}
		
		// 검색 날짜 end
		Map<String, Integer> today_info =  sdates.today_info(sdates);
		
		List<SubscribeDate> dateList = new ArrayList<SubscribeDate>();
		
		for(int i = 1; i < today_info.get("start"); i++){
			
			calendarData = new SubscribeDate(null, null, null, null);
			
			dateList.add(calendarData);
		}
		
		// 구독 날짜 데이터 *************************
		List<Integer> subDateList = new ArrayList<Integer>();

		// 오늘, 해당 달 최대 일 수(30, 31)
		Calendar subcal = Calendar.getInstance();
		subcal.set(Integer.parseInt(sdates.getYear()), 
				Integer.parseInt(sdates.getMonth()), 
				1);

		int startDay = subcal.getMinimum(java.util.Calendar.DATE);
		int endDay = subcal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
		int start = subcal.get(java.util.Calendar.DAY_OF_WEEK);
		int index = 7 - dateList.size() % 7;

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd");
		LocalDate today = LocalDate.now();

		String formatedToday = today.format(formatter);
		int realToday = Integer.parseInt(formatedToday);

		System.out.println("**** 여기는 service *** ");
		System.out.println("startDay : " + startDay);
		System.out.println("endDay : " + endDay);
		System.out.println("start : " + start);
		System.out.println("today : " + formatedToday);
		System.out.println("realToday : " + realToday); // 오늘

		
		// 요일 구하기
		LocalDate date = LocalDate.ofEpochDay(realToday);
		DayOfWeek dayOfWeek = date.getDayOfWeek();
		
		int dayOfWeekNumber = dayOfWeek.getValue();
		
		System.out.println("dayOfWeekNumber : " + dayOfWeekNumber);
		
		// List에 넣기
		subDateList.add(realToday);
		
		
		
		return subDateList;
	}
}
