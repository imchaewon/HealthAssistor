package com.fitper.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fitper.domain.CalendarVO;
import com.fitper.domain.Criteria;
import com.fitper.domain.ExrVO;
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
	public List<Map<String, String>> findID(String BIRTH) {
		return mapper.findID(BIRTH);
	}
	
	@Override
	public String findPW(MemberVO vo) {
		return mapper.findPW(vo);
	}
	
	@Override
	public int changePW(MemberVO vo) {
		return mapper.changePW(vo);
	}
	
	@Override
	public MemberVO login(MemberVO vo) {
		return mapper.login(vo);
	}
	
	@Override
	public int login_pw_fail(MemberVO vo) {
		return mapper.login_pw_fail(vo);
	}
	
	@Override
	public int setSessionKey(MemberVO vo) {
		return mapper.setSessionKey(vo);
	}
	
	@Override
	public MemberVO autoLogin(String SESSION_ID) {
		return mapper.autoLogin(SESSION_ID);
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
	public int remove(Long MEMBER_SQ) {
		return mapper.delete(MEMBER_SQ);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public MemberVO getMoreInfo(String ID) {
		return mapper.getMoreInfo(ID);
	}
	
	@Override
	public void updateInfo(Map<String,Object> map) {
//		log.info("=======");
//		log.info(map);
		mapper.EDIT_MEMBER_INFO_PROCEDURE(map);
	}
	
	@Override
	public void deleteInfo(Map<String,String> map) {
//		log.info("=======");
//		log.info(map);
		mapper.DEL_MEMBER_INFO_PROCEDURE(map);
	}
	
	@Override
	public List<Map<String,String>> getExrPartList() {
		return mapper.getExrPartList();
	}

	@Override
	public List<ExrVO> getExrList() {
		return mapper.getExrList();
	}
	
	@Override
	public List<CalendarVO> getCalendarList(Long MEMBER_SQ) {
		return mapper.getCalendarList(MEMBER_SQ);
	}
	
	@Override
	@Transactional
	public int setCalendarList(List<CalendarVO> list) {
		mapper.clearCalendarList(list.get(0).getMEMBER_SQ());
		return mapper.setCalendarList(list);
	}
	
	@Override
	public int clearCalendarList(Long MEMBER_SQ) {
		return mapper.clearCalendarList(MEMBER_SQ);
	}
	
	
	
	

	

	
}




