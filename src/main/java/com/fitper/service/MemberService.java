package com.fitper.service;

import java.util.List;
import java.util.Map;

import com.fitper.domain.CalendarVO;
import com.fitper.domain.Criteria;
import com.fitper.domain.MemberVO;

public interface MemberService {

	List<Map<String, String>> getPWQuestion(); // 비밀번호찾기 질문/답
	List<MemberVO> getList(); // 회원리스트
	List<MemberVO> getList(Criteria cri);  // 회원리스트(페이징)
	
	MemberVO login(MemberVO vo); // 단일 회원 반환(로그인)
	List<Map<String, String>> findID(String BIRTH); // 아이디찾기
	String findPW(MemberVO vo); // 비밀번호 찾기
	int changePW(MemberVO vo); // 비밀번호 변경
	int login_pw_fail(MemberVO vo); // 로그인 비밀번호 틀림체크
	int setSessionKey(MemberVO vo); // 세션아이디 저장
	MemberVO autoLogin(String SESSION_ID); // 쿠키,세션 이용한 자동로그인
	int idDuplChk(String id); // 아이디 중복체크
	int register(MemberVO vo); // 회원가입
	Long registerKey(MemberVO vo); //회원가입후 회원번호 반환
	
	MemberVO getMoreInfo(String ID); //회원 추가정보
	void updateInfo(Map<String, Object> map); // 내 정보 추가/수정
	void deleteInfo(Map<String, String> map); // 내 정보 추가/수정
	int remove(Long MEMBER_SQ); // 회원탈퇴
	int getTotal(Criteria cri); // 등록된 회원수
	
	List<CalendarVO> getCalendarList(Long MEMBER_SQ); // 캘린더 로드
	int clearCalendarList(Long MEMBER_SQ); // 캘린더 삭제
	int setCalendarList(List<CalendarVO> list); // 캘린더 저장
	
}








