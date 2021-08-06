package org.zerock.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.domain.StoreInfoVO;
import org.zerock.domain.SubscribeDate;
import org.zerock.mapper.MemberMapper;
import org.zerock.mapper.UserReviewMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class SubscribeInfoServiceImpl implements SubscribeInfoService {
	
	@Setter(onMethod_ = @Autowired)
	private UserReviewMapper mapper;
	
	// ********************구독 날짜 데이터 *************************
	@Override
	public List<String> getSubDateList(SubscribeDate dateData) {
		
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

		return realSubDateList;
	}
	
	
	@Override
	public StoreInfoVO getSubInfo(MemberVO mvo) {
		return mapper.readSubInfo(mvo);
	}
}
