package com.fitper.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fitper.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@RequestMapping("/place")
@RequiredArgsConstructor
@Controller
public class PlaceController {
	
	private final MemberService service;
	
	@GetMapping("/")
	public void main() {
		
	}
	
	

	
}















