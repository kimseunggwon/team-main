package org.zerock.controller.jinah;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.HotReviewVO1;
import org.zerock.domain.MemberVO;
import org.zerock.domain.ReviewCriteria;
import org.zerock.domain.ReviewPageDTO;
import org.zerock.domain.StoreInfoVO;
import org.zerock.domain.UserReviewLikersVO;
import org.zerock.domain.UserReviewVO;
import org.zerock.service.UserReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/review")
@AllArgsConstructor
@Log4j
public class UserReviewController {
	
	private UserReviewService service;
	
	// 리뷰 목록 얻어오기 - userReviewList
	@GetMapping("/list")
	@PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_USER')")
	public void reviewList(@ModelAttribute("recri") ReviewCriteria recri, 
							UserReviewVO review,
							Model model) {
		log.info("userReviewList is working");
		
		// 총 게시물 개수 얻고,
		int reviewTotal = service.getReviewTotal(recri);
		
		// 리뷰 전체목록 얻어오고
		List<UserReviewVO> reList = service.getReviewList(recri);
		
		// 공지사항 얻어오기
		List<UserReviewVO> announceList = service.getAnnounceList(recri);
		
		// 정렬 방식 구분
		List<UserReviewVO> popularlist = service.getPopularList(recri);
		List<UserReviewVO> latestlist = service.getLatestList(recri);
		List<UserReviewVO> viewcountlist = service.getviewCountList(recri);
		
		model.addAttribute("popularlist", popularlist);
		model.addAttribute("latestlist", latestlist);
		model.addAttribute("viewcountlist", viewcountlist);
		
		model.addAttribute("reList2", announceList);
		model.addAttribute("reList", reList);
		model.addAttribute("reviewPageMaker", new ReviewPageDTO(recri, reviewTotal));
		model.addAttribute("totalCount", reviewTotal);
		
	}
	
	// ************ 나의 리뷰 목록 얻어오기 - getMyReviewList + view
	
	// 리뷰 작성하기 (이미지 파일 포함) - userReviewWrite
	@PostMapping("/write")
	@PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_USER')")
	public String reviewWrite(UserReviewVO review,
								@RequestParam("file") MultipartFile[] file,
								ReviewCriteria recri,
								RedirectAttributes rttr) {
		
		// review.setFileName(file.length); // getOriginalFileName()
		
		// 리뷰 글 작성하고
		service.reviewWrite(review, file);
		
		// 빨래방 위치 정보 얻어오고
		//service.getSubscribeStore()
		
		log.info(review);
		
		// 평점 얻어오기
		int stars = service.getReviewStar(review.getReBno());
		rttr.addFlashAttribute("reviewStars", stars);
		
		rttr.addFlashAttribute("result", review.getReBno());
		rttr.addFlashAttribute("messageTitle", "리뷰 등록 완료-!");
		rttr.addFlashAttribute("messageBody", review.getReBno() + "번 리뷰가 등록되었습니다.");
		
		 return "redirect:/review/list";
	}
	
	// 리뷰 작성하기 - 이미지 파일 없이
	@GetMapping("/write")
	@PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_USER')")
	public void reviewWrite(@ModelAttribute("recri") ReviewCriteria recri) {
	
		// + 위치 정보
		
		// Forwarding to /WEB-INF/views/review/write.jsp
	}
	
	// 리뷰 상세 얻어오기 - userReviewGet
	@GetMapping("/get")
	@PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_USER')")
	public void reviewGet(@RequestParam("reBno") int reBno,
						  @ModelAttribute("recri") ReviewCriteria recri,
						  UserReviewVO review,
						  @ModelAttribute("likers") UserReviewLikersVO likers,
						  Model model) {
		
		log.info("userReviewGet is working");
		
		UserReviewVO revo = service.reviewGet(reBno);
		
		// 평점 얻어오기
		int stars = service.getReviewStar(review.getReBno());
		
		model.addAttribute("reviewStars", stars);
		model.addAttribute("review", revo);
		model.addAttribute("likers", likers);
		
		
	}
	
	
	// 리뷰 파일 수정하기 (이미지 파일 없이) - userReviewModify
	@GetMapping("/modify")
	@PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_USER')")
	public void reviewModify(@RequestParam("reBno") int reBno,
						  @ModelAttribute("recri") ReviewCriteria recri,
						  UserReviewVO review,
						  UserReviewLikersVO likers,
						  Model model) {
		
		reviewGet(reBno, recri, review, likers, model);
		
		

	}
	
	// 리뷰 파일 수정하기 (이미지 파일 포함) - userReviewModify
	@PostMapping("/modify")
	@PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_USER')")
	public String reviewModify(UserReviewVO review,
							   ReviewCriteria recri,
							   MultipartFile[] file,
							   RedirectAttributes rttr) {
		
		log.info("userReviewModify is working");
		
		boolean success = service.reviewModify(review, file);
		
		// 평점 얻어오기
		
		if (success) {
			
			int stars = service.getReviewStar(review.getReBno());
			rttr.addFlashAttribute("reviewStars", stars);
			
			rttr.addFlashAttribute("result", success);
			rttr.addFlashAttribute("messageTitle", "수정 완료-!");
			rttr.addFlashAttribute("messageBody", "리뷰가 정상적으로 수정되었습니다.");
		}
		
		rttr.addAttribute("pageNum", recri.getPageNum());
		rttr.addAttribute("amount", recri.getAmount());
		rttr.addAttribute("type", recri.getType());
		rttr.addAttribute("keyword", recri.getKeyword());
		rttr.addAttribute("sort", recri.getSort());
		
		return "redirect:/review/list";
	}
	
	// 리뷰 삭제하기 - userReviewRemove
	@PostMapping("/remove")
	@PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_USER')")
	public String reviewRemove(@RequestParam("reBno") int reBno,
							   ReviewCriteria recri,
							   RedirectAttributes rttr,
							   String reWriterName
							   ) {
		
		log.info("userReviewRemove is working");
		
		boolean success = service.reviewRemove(reBno);
		
		if (success) {
		rttr.addFlashAttribute("result", success);
		rttr.addFlashAttribute("messageTitle", "삭제 완료-!");
		rttr.addFlashAttribute("messageBody", "리뷰가 정상적으로 삭제되었습니다.");
		
		}
	
		rttr.addAttribute("pageNum", recri.getPageNum());
		rttr.addAttribute("amount", recri.getAmount());
		rttr.addAttribute("type", recri.getType());
		rttr.addAttribute("keyword", recri.getKeyword());
		rttr.addAttribute("sort", recri.getSort());

		
		return "redirect:/review/list";
	}
	
	// 리뷰 좋아요 - userReviewLikeCount
	@PostMapping("/get")
	@PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_USER')")
	@ResponseBody
	public int reviewLikeCount(@RequestParam("reBno") int reBno,
							   @RequestParam("userid") String userid) {
		
		log.info("userReviewLikeCount is working");
		
		int likecnt = service.reviewLikecount(reBno, userid);

		return likecnt;
	}
	
	// 세탁소 이름 주소 불러오기
	@GetMapping("/getaddress2")
	@PreAuthorize("isAuthenticated()")
	@ResponseBody
	public StoreInfoVO getaddress2(MemberVO vo) {
		log.info("주소 불러오는중");
		log.info(vo);
		
		StoreInfoVO vo2 = service.readsubs(vo);
		log.info(vo2);
		
		if (vo2 == null) {
			return null;
		} else {
			return vo2;
		}
		
	}
	
	@GetMapping("/getgetget1")
	@ResponseBody
	public HotReviewVO1 getgetget1() {
		
		log.info("Hot Review1 불러오는중");
		HotReviewVO1 vo1 = service.getHot1();
		
		log.info(vo1);
		
		
		if (vo1 == null) {
			return null;
		} else {
			return vo1;
		}
	}
	
	@GetMapping("/getgetget2")
	@ResponseBody 
	public HotReviewVO1 getgetget2() {
		
		log.info("Hot Review2 불러오는중"); 
		HotReviewVO1 vo2 = service.getHot2();
		
		log.info(vo2);
	
	
		if (vo2 == null) {
			return null;
		} else {
			return vo2;
		}
	}
	
}
