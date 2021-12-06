package com.fitper.mapper;

import java.util.List;
import java.util.Map;

import com.fitper.domain.BoardVO;
import com.fitper.domain.Criteria;

public interface BoardMapper {

	List<BoardVO> getList();
	
	BoardVO read(Long bno);
	
	int insert(BoardVO vo);
	
	int insertSelectKey(BoardVO vo);
	
	int update(BoardVO vo);
	
	int delete(Long bno);
	
	List<BoardVO> getListWithPaging(Criteria cri);
	
	int getTotalCount(Criteria cri);
	
	List<BoardVO> searchTest(Map<String, Map<String,String>> map);
	
}







