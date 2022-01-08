package com.fitper.domain;

import java.util.List;

import lombok.Data;

@Data
public class ExrVO {

	private Long EXERCISE_SQ, EXR_PART_SQ;
	private String KIND, NAME, EXP, CODE, PART;
	private List<String> PART_LIST;
	
}
