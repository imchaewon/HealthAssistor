package com.fitper.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fitper.domain.MemberVO;
import com.fitper.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/my")
@RequiredArgsConstructor
@Controller
public class MyController {
	
	private final MemberService service;

	@GetMapping()
	public String main(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		
		// 로그아웃상태라면 로그인페이지로 이동
		if(session.getAttribute("loginInfo") == null) {
			return "/member/login";
		}
		
		String id = ((MemberVO) session.getAttribute("loginInfo")).getID();
		
		MemberVO mem = service.getMoreInfo(id);
		
		model.addAttribute("myInfo", mem);
		
		return "/my/main";
	}
	
	@PostMapping("/main")
	@ResponseBody
	public boolean main_ok(MemberVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		String pw = ((MemberVO) session.getAttribute("loginInfo")).getPW();
		
		// 비밀번호 일치 여부 확인
		if(pw.equals(vo.getPW())) {
			return true;
		}
		
		return false;
	}
	
	@PostMapping(value="/main_ok", produces="application/text; charset=UTF-8")
	@ResponseBody
	public String main_edit_ok(MemberVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String ID = ((MemberVO) session.getAttribute("loginInfo")).getID();
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("ID",ID);
		map.put("GNDR",vo.getGNDR());
		map.put("AMR",vo.getAMR());
		map.put("WAY",vo.getWAY());
		map.put("BMR",vo.getBMR());
		map.put("HGHT",vo.getHGHT());
		map.put("WGHT",vo.getWGHT());
		
		// 추가정보 추가 또는 모든정보 수정
		service.updateInfo(map);
		
		if(map.get("RESULT").equals("success")) {
			return "수정이 완료되었습니다.";
		};
		
		return "정보 수정 실패";
		
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
	
	@PostMapping("/secession")
	@ResponseBody
	public String secession_ok(HttpServletRequest req) {
		Map<String,String> map = new HashMap<String,String>();
		
		HttpSession session = req.getSession();
		
		map.put("ID",((MemberVO) session.getAttribute("loginInfo")).getID());
		
		service.deleteInfo(map);
		
		String result = map.get("RESULT");
		
		if (result.equals("success")) {
			session.invalidate();
		}
		
		return result;
	}
	
	@GetMapping("/daily_info")
	public void daily_info() {
		
	}
	
	@GetMapping("/statistics")
	public void statistics() {
		
	}
	
	


}