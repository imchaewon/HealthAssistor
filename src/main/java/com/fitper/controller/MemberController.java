package com.fitper.controller;

import java.util.Calendar;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
//		log.info("------------------------");
//		log.info(cri);
//		log.info("list.............");
		
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
	public String login(HttpServletRequest req) {
		
		// 로그인상태일때 메인으로 이동
		HttpSession session = req.getSession();
		if(session.getAttribute("loginInfo") != null) {
			return "redirect:/";
		}
		return null;
	}
	
	@PostMapping(value="/login", produces="application/text; charset=UTF-8")
	@ResponseBody
	public String login_ok(MemberVO vo, HttpServletRequest req, HttpServletResponse resp){
		HttpSession session = req.getSession(); //세션 불러오기
		MemberVO mem = service.login(vo);
		int fail = service.login_pw_fail(vo);
		
		if(mem != null && fail == 0) { // 로그인 성공
			
//			log.info("------------------------");
//			log.info(vo.isAutoLogin());
			
			//	세션에 회원정보 저장
			session.setAttribute("loginInfo", mem);
			
			// 자동로그인 체크시 처리
			if(vo.isAutoLogin()) {
				Cookie loginCookie = new Cookie("loginCookie", session.getId()); //쿠키 생성. 세션id를 담음
				loginCookie.setPath("/"); //쿠키를 조회 가능한 위치
				loginCookie.setMaxAge(60 * 60 * 24 * 90); //초단위로 쿠키유지기간 설정 (90일)
				resp.addCookie(loginCookie); //response에 쿠키를담아 클라이언트에게 보낸다
				
//				log.info("-----------------------------------------------------------------------------------");
//				log.info(vo);
				vo.setSESSION_ID(session.getId()); //세션id를 vo에 담는다
				int test = service.setSessionKey(vo); //세션id를 db에 update한다
//				log.info("----------------------------");
//				log.info(test);
			}
			return "success";
		}else if(fail == 1) { // 비밀번호 틀림
			return "아이디/비밀번호를 확인해주세요.";
		}else{ // 아이디 틀림
			return "등록된 정보가 없습니다.";
		}
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest req,HttpServletResponse resp) {
		HttpSession session = req.getSession();
		session.removeAttribute("loginInfo"); // 로그인세션 삭제
		
		Cookie cookic = new Cookie("loginCookie", null); // choiceCookieName(쿠키 이름)에 대한 값을 null로 지정
		cookic.setPath("/");
		cookic.setMaxAge(0); // 유효시간을 0으로 설정
		resp.addCookie(cookic); // 응답 헤더에 추가해서 없어지도록 함
		
		return "redirect:/";
	}

	
}















