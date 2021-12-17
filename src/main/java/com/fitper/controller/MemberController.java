package com.fitper.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@GetMapping("/null")
	public void nullPage(Criteria cri, Model model) {
		model.addAttribute("cri",cri);
	}
	
	
}













