package com.rpaportal.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rpaportal.service.rpaService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTest {
	private static final Logger log = LoggerFactory.getLogger(BoardServiceTest.class);
	@Autowired
	public rpaMapper mapper;
	@Autowired
	public rpaService service;
	/*
	@Test
	public void testEnroll() {
		BoardVO vo = new BoardVO();
		
		vo.setTitle("mapper test3");
		vo.setContent("mapper test3");
		vo.setWriter("mapper test3");
		
		service.enroll(vo);
	}
	*/
	
	@Test
	public void testGetList() {
		
	}
}
