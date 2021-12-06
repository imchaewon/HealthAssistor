package com.fitper.service;

import java.util.List;

import com.fitper.domain.BoardVO;
import com.fitper.domain.Criteria;

public interface BoardService {

	List<BoardVO> getList();
	List<BoardVO> getList(Criteria cri);
	BoardVO get(Long bno);
	int register(BoardVO vo);
	Long registerKey(BoardVO vo);
	int modify(BoardVO vo);
	int remove(Long bno);
	int getTotal(Criteria cri);
	
}
