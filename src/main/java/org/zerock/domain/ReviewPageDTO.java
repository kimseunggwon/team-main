package org.zerock.domain;

import lombok.Getter;

@Getter
public class ReviewPageDTO {

	private ReviewCriteria recri;
	
	// 현재 페이지 기준으로 시작, 마지막 페이지
	private int startPage;
	private int endPage;
	
	// 이전, 다음 페이지 버튼 표시 유무
	private boolean prev;
	private boolean next;
	
	private int reviewTotal;
	
	public ReviewPageDTO(ReviewCriteria recri, int reviewTotal) {
		
		this.recri = recri;
		
		int currentPage = recri.getPageNum();
		int numPerPage = recri.getAmount();
		
		// 현재 페이지가 1~10이면 -> 시작은 = 1, 종료는 = 10
		this.endPage = ((currentPage - 1) / 10 + 1) * 10;
		this.startPage = endPage - 9;
		
		// 가장 마지막 페이지
		int realEndPage = reviewTotal / numPerPage;
		
		if (reviewTotal % numPerPage != 0) {
			realEndPage = realEndPage + 1;
		}
		
		// '마지막 페이지'와 '가장 마지막 페이지' 비교
		this.endPage = Math.min(endPage, realEndPage);
		
		// 이전, 다음 버튼 표시 여부
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEndPage;
		
	}
	
}
