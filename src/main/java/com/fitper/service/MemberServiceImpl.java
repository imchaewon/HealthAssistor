package com.fitper.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fitper.domain.Criteria;
import com.fitper.domain.MemberVO;
import com.fitper.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@AllArgsConstructor
@ToString
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public List<Map<String, String>> getPWQuestion() {
		return mapper.getPWQuestion();
	}

	@Override
	public List<MemberVO> getList() {
		return mapper.getList();
	}
	
	@Override
	public List<MemberVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public MemberVO get(Long bno) {
		return mapper.read(bno);
	}
	
	@Override
	public MemberVO login(MemberVO vo) {
		return mapper.read_login(vo);
	}
	
	@Override
	public int idDuplChk(String id) {
		return mapper.readById(id);
	}
	
	@Override
	public int register(MemberVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public Long registerKey(MemberVO vo) {
		mapper.insertSelectKey(vo);
		return vo.getMEMBER_SQ();
	}

	@Override
	public int modify(MemberVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int remove(Long bno) {
		return mapper.delete(bno);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	

	
}




