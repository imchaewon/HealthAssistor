package com.fitper.mapper;

import java.util.List;

import com.fitper.domain.Criteria;
import com.fitper.domain.MemberVO;

public interface MemberMapper {

	List<MemberVO> getList();
	
	MemberVO read(Long MEMBER_SQ);
	
	int insert(MemberVO vo);
	
	int insertSelectKey(MemberVO vo);
	
	int update(MemberVO vo);
	
	int delete(Long MEMBER_SQ);
	
	List<MemberVO> getListWithPaging(Criteria cri);
	
	int getTotalCount(Criteria cri);
	
}







