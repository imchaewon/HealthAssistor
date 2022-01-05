package com.fitper.domain;

import java.util.List;

import lombok.Data;

@Data
public class CalendarVO {
	private Long id, MEMBER_SQ;
	private String groupId, title, content, start, end, textColor, backgroundColor, borderColor;
	private int allDay;
	
	private List<CalendarVO> list;
}








