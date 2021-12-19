package com.fitper.service;

import java.util.List;

import com.fitper.domain.MemberVO;
import com.fitper.domain.Criteria;

public interface MemberService {

	List<MemberVO> getList();
	List<MemberVO> getList(Criteria cri);
	MemberVO get(Long MEMBER_SQ);
	MemberVO login(MemberVO vo);
	int register(MemberVO vo);
	Long registerKey(MemberVO vo);
	int modify(MemberVO vo);
	int remove(Long MEMBER_SQ);
	int getTotal(Criteria cri);
	
}
