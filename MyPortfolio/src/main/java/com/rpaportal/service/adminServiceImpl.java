package com.rpaportal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rpaportal.mapper.rpaMapper;
import com.rpaportal.model.BoardVO;

@Service
public class adminServiceImpl implements adminService{
	
	@Autowired
	private rpaMapper mapper;

	@Override
	public List<BoardVO> getCheckList() {
		return mapper.getCheckList();
	}
	
}
