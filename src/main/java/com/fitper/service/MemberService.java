package com.fitper.service;

import java.util.List;
import java.util.Map;

import com.fitper.domain.Criteria;
import com.fitper.domain.MemberVO;

public interface MemberService {

	List<Map<String, String>> getPWQuestion();
	List<MemberVO> getList();
	List<MemberVO> getList(Criteria cri);
	MemberVO get(Long MEMBER_SQ);
	MemberVO login(MemberVO vo);
	int login_pw_fail(MemberVO vo);
	int idDuplChk(String id);
	int register(MemberVO vo);
	Long registerKey(MemberVO vo);
	int modify(MemberVO vo);
	int remove(Long MEMBER_SQ);
	int getTotal(Criteria cri);
	
}
