package org.zerock.controller.Sangpil.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.controller.Sangpil.SendEmail;
import org.zerock.controller.Sangpil.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class testController {
	
	/*
	 * @Setter(onMethod_ = @Autowired) private MemberService service;
	 */

	@RequestMapping("/login")
	public void login() {
		log.info("login 들어왔습니당");
	}
	
	
	@PostMapping("/findid")
	public void findid() {
		log.info("아이디 찾기 들어왔습니당");
	}
	
	@PostMapping("/findpw")
	public void findpw() {
		log.info("비밀번호 찾기 들어왔습니당");
	}
	
	@RequestMapping("/main")
	public void main() {
		log.info("메인입니다!");
	}
	
	@PostMapping("/authNumber")
	public void authNumber(MemberVO member, RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response)throws IOException {
		
		HttpSession session = request.getSession();
		
		String idI = request.getParameter("idI");
		String idE = request.getParameter("idE");
		String idP = request.getParameter("idB");
		
		log.info(idE);
		
		if(idI == null) {
			
		
			int num = (int) (Math.random()*999999);
			
			SendEmail.sendEmail(num, idE);
//			SendSms.sendSms(idP);
			session.setAttribute("authRandomNumber", num);
			System.out.println(num);
			
			response.getWriter().append("ok1");
			
			
		} else {
			int num = (Integer) session.getAttribute("authRandomNumber");
			int num1 = Integer.parseInt(idI);
			if (num == num1) {
				response.getWriter().append("ok2");
			} else {
				response.getWriter().append("not ok");
			}

		}
		
	}
	
	@GetMapping("/signup")
	public void signUp() {
		log.info("Get 회원가입 들어왔습니당.");
	}
	
	@PostMapping("/signup")
	public String signUpPost(MemberVO vo, RedirectAttributes rttr) {
		log.info("Post 회원가입 들어왔습니당.");
		log.info(vo);
		
//		boolean ok = service.insert(vo);
//		
//		if(ok) {
		return "redirect:/member/login";
//		}else {
//			return "redirect:/member/signup?error";
//		}
	}
	
	@PostMapping("/b2bsignup")
	public void B2BsignUp() {
		log.info("Post b2b회원가입 들어왔습니당.");
	}
	
	/*
	@GetMapping("/dup")
	@ResponseBody
	public ResponseEntity<String> duplicate(String id) {
		log.info("duplicate method");
		
		// 서비스 일 시키고
		MemberVO vo = service.read(id);
		
		if (vo == null) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<> ("exist", HttpStatus.OK);
		}
		
	}
	*/
	
}
