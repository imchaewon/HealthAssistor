package com.fitper.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private Long POST_SQ, MEMBER_SQ, CMT_SQ;
	private String TIT, CON, WRITER, VIEW_CNT, COMMENT_CNT;
//	private Integer ; /*V_CNT*/
	private Date WRT_DATE, EDIT_DATE;
	
}
