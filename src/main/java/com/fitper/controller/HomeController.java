package com.fitper.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.util.WebUtils;

import com.fitper.domain.MemberVO;
import com.fitper.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
@RequiredArgsConstructor
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private final MemberService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}*/
	
	@GetMapping({"/","/index"})
	public String home(MemberVO vo, HttpServletRequest req) {

		Cookie loginCookie = WebUtils.getCookie(req, "loginCookie");
		// 쿠키가 있을경우 자동로그인 구현
		if (loginCookie != null) {
			String sessionID = loginCookie.getValue();
//			log.info("--------------------------------------------------");
//			log.info(sessionID);
			
			MemberVO mem = service.autoLogin(sessionID); // 세션id로 로그인
//			log.info("=======");
//			log.info(mem);
			HttpSession session = req.getSession();
			session.setAttribute("loginInfo", mem);
		}
			
		return "home";
	}
	
}












