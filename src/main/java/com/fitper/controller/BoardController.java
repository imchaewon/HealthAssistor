package com.fitper.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fitper.domain.BoardVO;
import com.fitper.domain.Criteria;
import com.fitper.domain.PageDTO;
import com.fitper.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@RequestMapping("/board")
@RequiredArgsConstructor
@Controller
public class BoardController {
	
	private final BoardService service;

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
	public String register(BoardVO vo, RedirectAttributes rttr) {
		
		
		log.info("vo: " + vo);
		
		log.info(vo.getContent());
		
		Long bno = service.registerKey(vo);
		
		log.info("BNO: " + bno);
		
		rttr.addFlashAttribute("result", bno);
		
		return "redirect:/board/list";
		
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO vo, Criteria cri, RedirectAttributes rttr) {
		
		int result = service.modify(vo);
		
		if (result == 1) {
			rttr.addFlashAttribute("result", vo.getBno());
			rttr.addFlashAttribute("modType", "m");
		}
		
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/board/list";
		
	}
	
	@PostMapping("/remove")
	public String remove(Long bno, Criteria cri, RedirectAttributes rttr) {
		
		int result = service.remove(bno);
		
		if (result == 1) {
			rttr.addFlashAttribute("result", bno);
			rttr.addFlashAttribute("modType", "r");
		}

//		rttr.addAttribute("pageNum",cri.getPageNum());
//		rttr.addAttribute("amount",cri.getAmount());
//		rttr.addAttribute("type",cri.getType());
//		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/board/list";
		
	}
	
	@GetMapping("/null")
	public void nullPage(Criteria cri, Model model) {
		model.addAttribute("cri",cri);
	}
	
	
}














