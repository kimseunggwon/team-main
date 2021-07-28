package org.zerock.controller.wonhyeok;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.AddressVO;
import org.zerock.service.WonhyeokRestService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/won/*")
@AllArgsConstructor
public class WonhyeokRestController {
	
	private WonhyeokRestService service;
	
	@PostMapping("/searchstore")
	public List<AddressVO> find(String storename, Model model) {
		log.info(storename);
		List<AddressVO> vo = service.getsearchbystorename(storename);
		model.addAttribute("store", vo);
		

		return vo;

	}
	
	@PostMapping(value = "/searchaddress", produces = {"application/json; charset=utf-8"})
	public List<AddressVO> findarround(@RequestBody AddressVO vo) {
		List<AddressVO> list = service.getlatlag(vo);
		
		return list;
		
	}

	@PostMapping(value = "/tagGetB2bStoreInfo", produces = {"application/json; charset=utf-8"})
	@ResponseBody
	public List<AddressVO> tagGetB2bStoreInfo(@RequestBody AddressVO vo) {
		List<AddressVO> list = service.getlatlag(vo);
		return list;

	}
}
