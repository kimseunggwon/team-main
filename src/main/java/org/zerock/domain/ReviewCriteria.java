package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewCriteria {
	// 리뷰의 페이지네이션(Pagination)을 적용하기 위한 Model입니다.
	
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	// Constructor
	public ReviewCriteria() {
		this(1, 10);
	}

	public ReviewCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// 
	public int getFrom() {
		return amount * (pageNum - 1);
	}
	
	// "TypeArr" property
	public String[] getReviewTypeArr() {
		if (type == null) {
			return new String[] {};
		} else {
			String[] types = type.split("");
			return types;
 		}
	}
}
