package com.fitper.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fitper.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/my")
@RequiredArgsConstructor
@Controller
public class MyController {
	
	private final MemberService service;

	@GetMapping("/main")
	public String main(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		//로그아웃상태라면 로그인페이지로 이동
		if(session.getAttribute("loginInfo") == null) {
			return "/member/login";
		}
		return null;
		
	}
	
	@GetMapping("/post")
	public String post(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		//로그아웃상태라면 로그인페이지로 이동
		if(session.getAttribute("loginInfo") == null) {
			return "/member/login";
		}
		return null;
	}
	
	@GetMapping("/comment")
	public String comment(HttpServletRequest req, RedirectAttributes rttr) {
		HttpSession session = req.getSession();
		
		//로그아웃상태라면 로그인페이지로 이동
		if(session.getAttribute("loginInfo") == null) {
			return "redirect:/member/login";
		}
		return null;
	}
	
	@GetMapping("/message")
	public String message(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		//로그아웃상태라면 로그인페이지로 이동
		if(session.getAttribute("loginInfo") == null) {
			return "/member/login";
		}
		return null;
	}
	
	@GetMapping("/change_pw")
	public String change_pw(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		//로그아웃상태라면 로그인페이지로 이동
		if(session.getAttribute("loginInfo") == null) {
			return "/member/login";
		}
		return null;
	}
	
	@GetMapping("/secession")
	public String secession(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		//로그아웃상태라면 로그인페이지로 이동
		if(session.getAttribute("loginInfo") == null) {
			return "/member/login";
		}
		return null;
	}




}