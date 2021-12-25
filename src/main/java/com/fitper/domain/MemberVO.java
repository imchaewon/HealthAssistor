package com.fitper.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private Long MEMBER_SQ, PW_QUESTION_SQ;
	private String ID, PW, PW_FIND_A, BIRTH, GNDR, SESSION_ID;
	private Date JOIN_DATE;
	private Float AMR;
	private boolean autoLogin;
	
}
