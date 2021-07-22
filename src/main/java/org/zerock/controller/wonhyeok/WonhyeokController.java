package org.zerock.controller.wonhyeok;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/searchstore/*")
@AllArgsConstructor
@Log4j
public class WonhyeokController {
	@RequestMapping("/searchMap")
	public void searchstore() {
		
	}
	
	@RequestMapping("/b2bIntroduceBoard")
	public void b2bIntroduce() {
		
	}
}
