package org.zerock.controller.wonhyeok;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.B2bIntroduceVO;
import org.zerock.service.WonhyeokRestService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/searchstore/*")
@AllArgsConstructor
@Log4j
public class WonhyeokController {

	private WonhyeokRestService service;

	@RequestMapping("/searchMap")
	@PreAuthorize("isAuthenticated()")
	public void searchstore() {

	}
//	사장님 홍보 게시판 컨트롤러

	@RequestMapping("/b2bIntroduceBoard")
	public void b2bIntroduce() {

	}

	@PostMapping("/b2bIntroduceBoard")
	public void b2bIntroduce(B2bIntroduceVO Introduce, @RequestParam("file") MultipartFile file) {

		Integer id = service.getid(Introduce);
		log.info(id);
		if (id == null) {

			Introduce.setFileName((file).getOriginalFilename());
			service.B2bIntroduceRegister(Introduce, file);
		} else if (id != null) {

			Introduce.setFileName((file).getOriginalFilename());
			service.B2bIntroduceModify(Introduce, file);
		}

	}

	@GetMapping("/b2bIntroduce")
	public void b2bIntroducepage() {

	}
	
	@RequestMapping("/b2bIntroduce/{id}")
	public String b2bIntroducepage(@PathVariable("id") Long id,RedirectAttributes rttr) {
		
		B2bIntroduceVO vo = service.getStoreInroducePageInfo(id);
		log.info(vo);
		
		if ( vo.getFileName() == null) {
			rttr.addFlashAttribute("id", vo.getId());
			rttr.addFlashAttribute("storeaddress", vo.getStoreaddress());
			rttr.addFlashAttribute("storename", vo.getStorename());
			rttr.addFlashAttribute("storePhonenum", vo.getStorePhonenum());
			rttr.addFlashAttribute("storeinfo", "준비중");
			rttr.addFlashAttribute("introduce", "준비중");
			rttr.addFlashAttribute("fileName", "readyimg");
			
			return  "redirect:/searchstore/b2bIntroduce";
			
		} else {
					
		rttr.addFlashAttribute("id", vo.getId());
		rttr.addFlashAttribute("storeaddress", vo.getStoreaddress());
		rttr.addFlashAttribute("storename", vo.getStorename());
		rttr.addFlashAttribute("storePhonenum", vo.getStorePhonenum());
		rttr.addFlashAttribute("storeinfo", vo.getStoreinfo());
		rttr.addFlashAttribute("introduce", vo.getIntroduce());
		rttr.addFlashAttribute("fileName", vo.getFileName());
	
			return  "redirect:/searchstore/b2bIntroduce";
		}

	}

}
