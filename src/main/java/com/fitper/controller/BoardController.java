package com.fitper.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fitper.domain.BoardVO;
import com.fitper.domain.Criteria;
import com.fitper.domain.MemberVO;
import com.fitper.domain.PageDTO;
import com.fitper.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@RequestMapping("/community")
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
	
	@GetMapping()
	public String main(Criteria cri, Model model) {

		log.info(cri);
		log.info("list.............");
		
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
		
		log.info("=======");
		log.info(model.getAttribute("list"));
		log.info(model.getAttribute("pageMaker"));
		
		return "/community/main";
	}
	
	@GetMapping("/get")
	public void get(Long POST_SQ, 
			@ModelAttribute("cri")Criteria cri, 
			Model model,
			HttpServletRequest req
			/*HttpServletResponse resp*/) {
		
		log.info("/get");
		
		// 쿠키이용 새로고침 조회수조작 방지
//		Cookie[] clist = req.getCookies();
//		
//		boolean view_chk = false;
//		for (Cookie cookie : clist) {
//			if (cookie.getName().equals(POST_SQ)) {
//				view_chk = true;
//				break;
//			}
//		}
		
//		BoardVO vo = service.get(POST_SQ, view_chk);
		BoardVO vo = service.get(POST_SQ);
		
//		Cookie cookie = new Cookie("viewsCookie", POST_SQ + ""); //쿠키 생성
//		cookie.setPath("/"); //쿠키를 조회 가능한 위치
//		cookie.setMaxAge(60); //초단위로 쿠키유지기간 설정 (60초)
//		resp.addCookie(cookie); //response에 쿠키를담아 클라이언트에게 보낸다
		
		List<BoardVO> cmtvo = service.comment_get(POST_SQ);
		
//		log.info("iililli");
//		log.info(cmtvo);
		
		model.addAttribute("vo",vo);
		model.addAttribute("cmtvo",cmtvo);
	}
	
	@GetMapping("/modify")
	public String modify(Long POST_SQ, @ModelAttribute("cri")Criteria cri, Model model, HttpServletRequest req) {
		log.info("/modify.......");
		
		HttpSession session = req.getSession();
				
		BoardVO vo = service.get(POST_SQ);
		
		String id = ((MemberVO)session.getAttribute("loginInfo")).getID();
		
		// 로그인한 회원과 글쓴 회원이 같지 않으면 뒤로보내기
		log.info(id);
		log.info(vo.getWRITER());
		log.info("iiliiillil");
		if(!(id.equals(vo.getWRITER()))) {
			String referer = req.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
			return "redirect:" + referer;
		}
		
		List<BoardVO> cmtvo = service.comment_get(POST_SQ);
		
		model.addAttribute("vo",vo);
		model.addAttribute("cmtvo",cmtvo);
		
		return null;
	}
	
	@GetMapping("/register")
	public String registerGET(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		// 로그아웃상태라면 로그인페이지로 이동
		if(session.getAttribute("loginInfo") == null) {
			return "/member/login";
		}
		
		
		return null;
	}
	
	@PostMapping("/register_ok")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		
		Long POST_SQ = service.registerKey(vo);
		
		log.info("POST_SQ: " + POST_SQ);
		
		rttr.addFlashAttribute("result", POST_SQ);
		
		return "redirect:/community";
		
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO vo, Criteria cri, RedirectAttributes rttr) {
		
		log.info("/modify..........");
		log.info(vo);
		
		int result = service.modify(vo);
		
		if (result == 1) {
			rttr.addFlashAttribute("result", vo.getPOST_SQ());
			rttr.addFlashAttribute("modType", "m");
		}
		
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/community";
		
	}
	
	@PostMapping("/remove")
	public String remove(Long POST_SQ, Criteria cri, RedirectAttributes rttr) {
		
		int result = service.remove(POST_SQ);
		
		if (result == 1) {
			rttr.addFlashAttribute("result", POST_SQ);
			rttr.addFlashAttribute("modType", "r");
		}

//		rttr.addAttribute("pageNum",cri.getPageNum());
//		rttr.addAttribute("amount",cri.getAmount());
//		rttr.addAttribute("type",cri.getType());
//		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/community";
		
	}
	
	@GetMapping("/null")
	public void nullPage(Criteria cri, Model model) {
		model.addAttribute("cri",cri);
	}
	
	@PostMapping("/comment_write")
	@ResponseBody
	public int comment_write(@RequestBody Map<String, String> cmtMAP) {
		log.info("comment_write.......");
		log.info(cmtMAP);
		
		int result = service.comment_write(cmtMAP);
		
		return result;
	}
	
	
}














