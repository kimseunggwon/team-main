package org.zerock.domain.cancelSubs;

import java.sql.Timestamp;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
public class SubsCancelVO {
	private Long bno;
	private String subsid;
	private String title;
	private String content;
	private Timestamp updatedate;

}
