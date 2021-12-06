package com.fitper.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
public class BoardVO {

	private Long bno;
	private String title, content, writer;
	private Date regdate, updatedate;
	
}
