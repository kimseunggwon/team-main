package org.zerock.domain.cancelSubs;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SubsCriteria {
	
	private int pageNum;
	private int amount;
	

	public SubsCriteria() {
		this(1, 10);
	}
	
	public SubsCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public int getFrom() {
		return amount * (pageNum - 1);
	}

}
	





