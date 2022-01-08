package com.fitper.mapper;

import java.util.List;
import java.util.Map;

import com.fitper.domain.Criteria;
import com.fitper.domain.ExrVO;

public interface ExerciseMapper {

	List<Map<String,String>> getPartList();
	
	List<ExrVO> getList();
	
	List<ExrVO> getListWithPaging(Criteria cri);
	
	List<ExrVO> getExrNPart();
	
	int getCount(Criteria cri);
	
}







