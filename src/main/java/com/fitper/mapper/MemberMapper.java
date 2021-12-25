package com.fitper.mapper;

import java.util.List;
import java.util.Map;

import com.fitper.domain.Criteria;
import com.fitper.domain.MemberVO;

public interface MemberMapper {

	List<Map<String, String>> getPWQuestion();

	List<MemberVO> getList();
	
	MemberVO read(Long MEMBER_SQ);
	
	MemberVO login(MemberVO vo);
	
	int login_pw_fail(MemberVO vo);
	
	int readById(String id);
	
	int setSessionKey(MemberVO vo);
	
	MemberVO autoLogin(String SESSION_ID);
	
	int insert(MemberVO vo);
	
	int insertSelectKey(MemberVO vo);
	
	int update(MemberVO vo);
	
	int delete(Long MEMBER_SQ);
	
	List<MemberVO> getListWithPaging(Criteria cri);
	
	int getTotalCount(Criteria cri);
	
}







