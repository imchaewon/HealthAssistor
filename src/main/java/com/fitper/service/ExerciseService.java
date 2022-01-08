package com.fitper.service;

import java.util.List;
import java.util.Map;

import com.fitper.domain.Criteria;
import com.fitper.domain.ExrVO;

public interface ExerciseService {

	List<Map<String,String>> getPartList(); // 운동 종류
	List<ExrVO> getList(); // 운동 리스트
	List<ExrVO> getList(Criteria cri); // 운동 리스트(페이징)
	List<ExrVO> getExrNPart(); // 운동 * 운동부위 join쿼리
	int getCount(Criteria cri); // 조건에 맞는 운동 개수
	
}
