package com.fitper.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fitper.domain.Criteria;
import com.fitper.domain.ExrVO;
import com.fitper.mapper.ExerciseMapper;

import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@AllArgsConstructor
@ToString
public class ExerciseServiceImpl implements ExerciseService{
	
	@Autowired
	private ExerciseMapper mapper;
	
	@Override
	public List<Map<String,String>> getPartList() {
		return mapper.getPartList();
	}

	@Override
	public List<ExrVO> getList() {
		return mapper.getList();
	}

	@Override
	public List<ExrVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public List<ExrVO> getExrNPart() {
		return mapper.getExrNPart();
	}

	@Override
	public int getCount(Criteria cri) {
		return mapper.getCount(cri);
	}
	
	
	
	

	

	
}




