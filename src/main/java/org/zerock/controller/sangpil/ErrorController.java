package org.zerock.controller.sangpil;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ErrorController {

	@RequestMapping("/accessDenied")
	public void accessDenied() {
		log.info("권한없음 페이지");
	}
	
	@RequestMapping("/accessfail")
	public void accessfail() {
		log.info("불러오기 실패");
	}
}
