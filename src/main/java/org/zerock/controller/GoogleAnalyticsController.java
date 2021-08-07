package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.ga.HelloAnalyticsReporting;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/get")
@AllArgsConstructor
@Log4j
public class GoogleAnalyticsController {
	
	@GetMapping("/ga")
	public void ga() {
		log.info("여기 들렸다!!!!!!!!!!!!!!!");
		HelloAnalyticsReporting.main();
	}
}
