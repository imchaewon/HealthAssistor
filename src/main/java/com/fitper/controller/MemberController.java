package com.fitper.controller;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fitper.domain.Criteria;
import com.fitper.domain.MemberVO;
import com.fitper.domain.PageDTO;
import com.fitper.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@RequestMapping("/member")
@RequiredArgsConstructor
@Controller
public class MemberController {
	
	private final MemberService service;
	
//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("list.............");
//		
//		model.addAttribute("list", service.getList());
//	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		log.info("------------------------");
		log.info(cri);
		log.info("list.............");
		
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(Long bno, @ModelAttribute("cri")Criteria cri, Model model) {
		
		log.info("/get");
		model.addAttribute("vo",service.get(bno));
		
	}
	
	@GetMapping("/register")
	public void registerGET() {
		
	}
	
	@PostMapping("/register_ok")
	public String register(MemberVO vo, RedirectAttributes rttr) {
		
		
		log.info("vo: " + vo);
		
		log.info(vo.getID());
		
		Long bno = service.registerKey(vo);
		
		log.info("BNO: " + bno);
		
		rttr.addFlashAttribute("result", bno);
		
		return "redirect:/Member/list";
		
	}
	
	@PostMapping("/modify")
	public String modify(MemberVO vo, Criteria cri, RedirectAttributes rttr) {
		
		int result = service.modify(vo);
		
		if (result == 1) {
			rttr.addFlashAttribute("result", vo.getMEMBER_SQ());
			rttr.addFlashAttribute("modType", "m");
		}
		
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/Member/list";
		
	}
	
	@PostMapping("/remove")
	public String remove(Long MEMBER_SQ, Criteria cri, RedirectAttributes rttr) {
		
		int result = service.remove(MEMBER_SQ);
		
		if (result == 1) {
			rttr.addFlashAttribute("result", MEMBER_SQ);
			rttr.addFlashAttribute("modType", "r");
		}

//		rttr.addAttribute("pageNum",cri.getPageNum());
//		rttr.addAttribute("amount",cri.getAmount());
//		rttr.addAttribute("type",cri.getType());
//		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/Member/list";
		
	}
	
	@GetMapping("null")
	public void nullPage(Criteria cri, Model model) {
		model.addAttribute("cri",cri);
	}
	
	@GetMapping("/join")
	public String join(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		// 로그인상태일때 메인으로 이동
		if(session.getAttribute("loginInfo") != null) {
			return "redirect:/";
		}
		model.addAttribute("pwq", service.getPWQuestion());
		model.addAttribute("nowYear",Calendar.getInstance().get(Calendar.YEAR));
		return null;
	}
	
	@PostMapping("/join")
	public String join_ok(MemberVO vo, RedirectAttributes rttr, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		Long seq = service.registerKey(vo);
		vo.setMEMBER_SQ(seq);
		
		// 로그인 성공시
		if(seq > 0) {
			rttr.addFlashAttribute("join_result", 1);
			session.setAttribute("loginInfo", vo);
			return "redirect:/";
		}
		rttr.addFlashAttribute("join_result", 0);
		return "redirect:/member/join";
	}
	
	@RequestMapping(value="/getByID", method=RequestMethod.POST)
	@ResponseBody
	public int getByID(@RequestBody String id){
		
		String $id = id.replace("=",""); //ajax에서 value만 보낼때 =가 자동으로 붙는거 제거
		
		if(service.idDuplChk($id) == 0) {
			return 0;
		}else {
			return 1;
		}
	}
	
	@GetMapping("/login")
	public void login() {
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest req) {
		log.info("logout");
		HttpSession session = req.getSession();
		session.removeAttribute("loginInfo");
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String login_ok(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr){
		HttpSession session = req.getSession();
		MemberVO mem = service.login(vo);
		
		if(mem == null) {
			rttr.addFlashAttribute("result","fail");
			rttr.addFlashAttribute("id",vo.getID());
			return "redirect:/member/login";
		} else {
			session.setAttribute("loginInfo", mem);
			return "redirect:/";
		}
		

		//model.addAttribute("member", session.getAttribute("member"));

	}
	
	

	
}















