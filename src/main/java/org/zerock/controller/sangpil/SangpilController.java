package org.zerock.controller.sangpil;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.SendEmail;
import org.zerock.domain.B2BmemberVO;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class SangpilController {
	
	/*
	 * @Setter(onMethod_ = @Autowired) private MemberService service;
	 */
	
	@Setter(onMethod_ = @Autowired)
	private MemberService service;

	@RequestMapping("/login")
	public void login() {
		log.info("login 들어왔습니당");
	}
	
	@RequestMapping("/b2blogin")
	public void b2blogin() {
		log.info("b2blogin 들어왔습니당");
	}
	
	@GetMapping("/findid")
	public void findid() {
		log.info("findid 들어왔다");
	}
	
	@GetMapping("/findpw")
	public void findpw() {
		log.info("findpw 들어왔다");
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
		
		boolean ok = service.insert(vo);
		
		if(ok) {
			return "redirect:/member/login";
		}else {
			return "redirect:/member/signup?error";
		}
//		return "redirect:/member/login";
	}
	
	@PostMapping("/b2bsignup")
	public String B2BsignUp(B2BmemberVO vo, RedirectAttributes rttr) {
		log.info("Post b2b회원가입 들어왔습니당.");
		log.info(vo);
		
		boolean ok = service.b2binsert(vo);
		
		if(ok) {
			return "redirect:/member/login";
		}else {
			return "redirect:/member/signup?error";
		}
//		return "redirect:/member/login";
	}
	
	@PostMapping("/empsignup")
	public String EmpsignUp(B2BmemberVO vo, RedirectAttributes rttr) {
		log.info("Post emp회원가입 들어왔습니당.");
		log.info(vo);
		
		boolean ok = service.empinsert(vo);
		
		if(ok) {
			return "redirect:/member/login";
		}else {
			return "redirect:/member/signup?error";
		}
//		return "redirect:/member/login";
	}
	
	@GetMapping("/dup")
	@ResponseBody
	public ResponseEntity<String> duplicate(String id) {
		log.info("duplicate method");
		log.info(id);
		
		// 서비스 일 시키고
		MemberVO vo = service.read(id);
		
		if (vo == null) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<> ("exist", HttpStatus.OK);
		}
		
	}
	
	@PostMapping("/findid")
	@ResponseBody
	public /*ResponseEntity<String>*/ String findid(@RequestBody MemberVO vo) {
		log.info("아이디 찾는중....");
		
		// 서비스 일 시키고
		MemberVO vo2 = service.read(vo.getUserid());
		String useremail = vo2.getUserEmail();
		
		String email = vo.getUserEmail();
		String userid = vo.getUserid();
		/*
		if (email.equals(useremail)) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<> ("exist", HttpStatus.OK);
		}
		*/
		
		if(email.equals(useremail)) {
			return userid;
		}else {
			return null;
		}
		
	}
	
	@InitBinder 
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }
	
}
