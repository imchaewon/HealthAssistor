package com.fitper.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.fitper.service.PageService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequiredArgsConstructor
@Controller
public class PageController {
	
	private final PageService service;
	
	@GetMapping("/place")
	public String place() {
		
		return "/page/place";
	}
	
	@GetMapping("/exercise")
	public String exercise() {
		
		return "/page/exercise";
	}
	
	@GetMapping("/body_type")
	public String body_type() {
		
		return "/page/body_type";
	}
	
	

	
}