package com.fitper.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fitper.domain.BoardVO;
import com.fitper.domain.Criteria;
import com.fitper.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@AllArgsConstructor
@ToString
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;

	@Override
	public List<BoardVO> getList() {
		return mapper.getList();
	}
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public BoardVO get(Long bno) {
		return mapper.read(bno);
	}
	
	@Override
	public int register(BoardVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public Long registerKey(BoardVO vo) {
		mapper.insertSelectKey(vo);
		return vo.getBno();
	}

	@Override
	public int modify(BoardVO vo) {
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




