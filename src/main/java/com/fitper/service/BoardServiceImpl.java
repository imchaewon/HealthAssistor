package com.fitper.service;

import java.util.List;
import java.util.Map;

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
	public BoardVO get(Long POST_SQ) {
		mapper.viewCntUp(POST_SQ);
		return mapper.read(POST_SQ);
	}
	
	@Override
	public int register(BoardVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public Long registerKey(BoardVO vo) {
		mapper.insertSelectKey(vo);
		return vo.getPOST_SQ();
	}

	@Override
	public int modify(BoardVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int remove(Long POST_SQ) {
		return mapper.delete(POST_SQ);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardVO> comment_get(Long POST_SQ) {
		return mapper.comment_get(POST_SQ);
	}

	@Override
	public int comment_write(Map<String, String> cmtMAP) {
		return mapper.comment_write(cmtMAP);
	}

	

	
}




