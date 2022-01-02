package com.fitper.service;

import java.util.List;
import java.util.Map;

import com.fitper.domain.BoardVO;
import com.fitper.domain.Criteria;

public interface BoardService {

	List<BoardVO> getList(); // 게시글 리스트
	List<BoardVO> getList(Criteria cri); // 게시글 리스트(페이징처리)
	BoardVO get(Long POST_SQ); // 게시글 한개
	int register(BoardVO vo); // 게시글 등록
	Long registerKey(BoardVO vo); // 게시글 등록(키반환)
	int modify(BoardVO vo); // 게시글 수정
	int remove(Long POST_SQ); // 게시글 삭제
	int getTotal(Criteria cri); // 총 게시글 수
	List<BoardVO> comment_get(Long POST_SQ); // 게시글의 댓글
	int comment_write(Map<String,String> cmtMAP); // 게시글에 댓글쓰기
}
