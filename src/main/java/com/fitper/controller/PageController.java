package com.fitper.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fitper.domain.Criteria;
import com.fitper.domain.ExrVO;
import com.fitper.domain.PageDTO;
import com.fitper.service.ExerciseService;
import com.fitper.service.PageService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequiredArgsConstructor
@Controller
public class PageController {
	
	private final PageService serviceP;
	private final ExerciseService serviceE;
	
	@GetMapping("/place")
	public String place() {
		
		return "/page/place";
	}
	
	@GetMapping("/exercise")
	public String exercise(Criteria cri, Model model) {
		
		cri.setAmount(6);
		
		List<Map<String, String>> allPartList = serviceE.getPartList(); // 운동 (조건 & 페이징)

		List<ExrVO> exrList = serviceE.getList(cri); // 운동 (조건 & 페이징)
		List<ExrVO> ENPList = serviceE.getExrNPart(); // 운동 * 부위
		
		List<ExrVO> finalExrList = new ArrayList<ExrVO>();
		for(ExrVO exr:exrList){
			List<String> partList = new ArrayList<String>();			
			for(ExrVO enp:ENPList){
				if (exr.getEXERCISE_SQ().equals(enp.getEXERCISE_SQ())) {
					partList.add(enp.getNAME());
				}
			}
			exr.setPART_LIST(partList); // 파트속성을 새롭게 추가하고, 루프를 돌며 각각 다른 객체들에 파트속성만 계속 바꿈
			finalExrList.add(exr); // 바꾼값을 List에 넣음
		}
		
		log.info("finalExrList.....");
		log.info(finalExrList);
		
		model.addAttribute("partList", allPartList);
		model.addAttribute("list", exrList);
		model.addAttribute("pageMaker", new PageDTO(cri, serviceE.getCount(cri)));
		
		return "/page/exercise";
	}
	
	@GetMapping("/body_type")
	public String body_type(HttpServletRequest req) {
		log.info("body_type.....");
		
		HttpSession session = req.getSession();
		
		log.info(session.getAttribute("loginInfo"));
		
		//로그아웃상태라면 로그인페이지로 이동
		if(session.getAttribute("loginInfo") == null) {
			return "/member/login";
		}
		
		
		
		return "/page/body_type";
	}
	
	@PostMapping("/body_type")
	@ResponseBody
	public Map<String,Object> body_type_ok(@RequestBody Map<String,Object> type) {
		log.info("body_type_ok,,,,,,,,,");
		log.info(type);
		
		String GNDR = (String) type.get("GNDR");
		float HGHT = Float.parseFloat((String) type.get("HGHT")); //키
		float WGHT = Float.parseFloat((String) type.get("WGHT")); //체중
		float BF = Float.parseFloat((String) type.get("BF")); //체지방률
		float SMM = Float.parseFloat((String) type.get("SMM")); //골격근량
		
		float BMI; //비만도
		float stdWGHT; //표준체중
		float stdBF; //표준체지방률
		float stdSMM; //표준골격근량
		
		float stdRangeWGHT; //표준체중절대값
		float stdRangeBF; //표준체지방률절대값
		float stdRangeSMM; //표준골격근량절대값
		
		String R_BMI;
		String R_WGHT; //결과체중
		String R_BF; //결과체지방률
		String R_SMM; //결과골격근량
		String TYPE; //유형
		
		BMI = WGHT / (HGHT * HGHT);
		
		if(BMI >= 35) {
			R_BMI = "고도 비만";
		}else if(BMI >= 30) {
			R_BMI = "중등도 비만";
		}else if(BMI >= 25) {
			R_BMI = "경도 비만";
		}else if(BMI >= 23) {
			R_BMI = "과체중";
		}else if(BMI >= 18.5) {
			R_BMI = "정상체중";
		}else {
			R_BMI = "저체중";
		}
		
		if (GNDR.equals("M")) { //남자
			stdWGHT = HGHT * HGHT / 10000 * 22;
			stdBF = (float) ((1.10 * WGHT) - (128 * WGHT / HGHT));
			stdSMM = (float) (WGHT * 0.45);
		}else { //여자
			stdWGHT = HGHT * HGHT / 10000 * 21;
			stdBF = (float) ((1.07 * WGHT) - (128 * WGHT / HGHT));
			stdSMM = (float) (WGHT * 0.38);
		}
		
		stdRangeWGHT = (float) (stdWGHT * .1); //표준체중절대값
		stdRangeBF = (float) (stdBF *.05); //표준체지방률절대값
		stdRangeSMM = (float) 1.12; //표준골격근량절대값
		
		if (Math.abs(WGHT - stdWGHT) <= stdRangeWGHT) { // 표준체중범위
			R_WGHT = "S";
		}else {
			if (WGHT > stdWGHT) { // 정상 초과
				R_WGHT = "U";
			}else { // 정상 이하
				R_WGHT = "D";
			}
		}
		if (Math.abs(BF - stdBF) <= stdRangeBF) { // 표준체지방률범위
			R_BF = "S";
		}else {
			if (BF > stdBF) { // 정상 초과
				R_BF = "U";
			}else { // 정상 이하
				R_BF = "D";
			}
		}
		if (Math.abs(SMM - stdSMM) <= stdRangeSMM) { // 표준골격근량범위
			R_SMM = "S";
		}else {
			if (SMM > stdSMM) { // 정상 초과
				R_SMM = "U";
			}else { // 정상 이하
				R_SMM = "D";
			}
		}
		
		if(R_WGHT.equals("D") && R_BF.equals("D") && (R_SMM.equals("S") || R_SMM.equals("U"))) {
			TYPE = "US";
		}else if(R_WGHT.equals("D") && R_BF.equals("D") && R_SMM.equals("D")) {
			TYPE = "UW";
		}else if(R_WGHT.equals("D") && (R_BF.equals("S") || R_SMM.equals("U")) && R_SMM.equals("D")) {
			TYPE = "UO";
		}else if(R_WGHT.equals("S") && (R_BF.equals("S") || R_BF.equals("D")) && R_SMM.equals("U")) {
			TYPE = "SS";
		}else if(R_WGHT.equals("S") && R_BF.equals("S") && R_SMM.equals("S")) {
			TYPE = "SH";
		}else if(R_WGHT.equals("S") && R_BF.equals("U") && R_SMM.equals("D")) {
			TYPE = "SW";
		}else if(R_WGHT.equals("S") && R_BF.equals("U") && (R_SMM.equals("S") || R_SMM.equals("U"))) {
			TYPE = "SO";
		}else if(R_WGHT.equals("U") && R_BF.equals("U") && (R_SMM.equals("S") || R_SMM.equals("D"))) {
			TYPE = "OS";
		}else if(R_WGHT.equals("U") && R_BF.equals("S") || R_BF.equals("D") && R_SMM.equals("U")) {
			TYPE = "OW";
		}else if(R_WGHT.equals("U") && R_BF.equals("U") && R_SMM.equals("U")) {
			TYPE = "OO";
		}else {
			TYPE = "XX";
		}
		
		Map<String, Object> map = serviceP.getBodyType(TYPE);
		
		map.put("stdWGHT", stdWGHT);
		map.put("R_BMI", R_BMI);
		
		log.info("map,,,,,,,,,,,,,,");
		log.info(map);
		
		return map;
	}
	
}










