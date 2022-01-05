package com.fitper.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fitper.mapper.PageMapper;

import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@AllArgsConstructor
@ToString
public class PageServiceImpl implements PageService{
	
	@Autowired
	private PageMapper mapper;

	@Override
	public Map<String,Object> getBodyType(String TYPE) {
		return mapper.getBodyType(TYPE);
	}

	
	
	
	

	

	
}




