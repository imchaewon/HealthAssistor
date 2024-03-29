package com.fitper.mapper;

import java.util.List;
import java.util.Map;

import com.fitper.domain.CalendarVO;
import com.fitper.domain.Criteria;
import com.fitper.domain.ExrVO;
import com.fitper.domain.MemberVO;

public interface MemberMapper {

	List<Map<String, String>> getPWQuestion();

	List<MemberVO> getList();
	
	List<Map<String, String>> findID(String BIRTH);
	
	String findPW(MemberVO vo);
	
	int changePW(MemberVO vo);
	
	MemberVO login(MemberVO vo);
	
	int login_pw_fail(MemberVO vo);
	
	int readById(String id);
	
	int setSessionKey(MemberVO vo);
	
	MemberVO autoLogin(String SESSION_ID);
	
	int insert(MemberVO vo);
	
	int insertSelectKey(MemberVO vo);
	
	int delete(Long MEMBER_SQ);
	
	List<MemberVO> getListWithPaging(Criteria cri);
	
	int getTotalCount(Criteria cri);

	MemberVO getMoreInfo(String ID);
	
	void EDIT_MEMBER_INFO_PROCEDURE(Map<String,Object> map);
	
	void DEL_MEMBER_INFO_PROCEDURE(Map<String, String> map);
	
	List<Map<String,String>> getExrPartList();
	
	List<ExrVO> getExrList();
	
	List<CalendarVO> getCalendarList(Long MEMBER_SQ);
	
	int setCalendarList(List<CalendarVO> list);
	
	int clearCalendarList(Long MEMBER_SQ);
	
}







