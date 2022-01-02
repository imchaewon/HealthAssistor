package com.fitper.mapper;

import java.util.List;
import java.util.Map;

import com.fitper.domain.BoardVO;
import com.fitper.domain.Criteria;

public interface BoardMapper {

	List<BoardVO> getList();
	
	BoardVO read(Long MEMBER_SQ);
	
	int insert(BoardVO vo);
	
	int insertSelectKey(BoardVO vo);
	
	int update(BoardVO vo);
	
	int delete(Long POST_SQ);
	
	List<BoardVO> getListWithPaging(Criteria cri);
	
	int getTotalCount(Criteria cri);
	
	List<BoardVO> searchTest(Map<String, Map<String,String>> map);

	void viewCntUp(Long POST_SQ);

	List<BoardVO> comment_get(Long POST_SQ);
	
	int comment_write(Map<String,String> cmtMAP);
	
}







