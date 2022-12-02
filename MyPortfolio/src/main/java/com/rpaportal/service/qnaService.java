package com.rpaportal.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.rpaportal.model.BoardVO;
import com.rpaportal.model.pageHandler;
import com.rpaportal.model.replyVO;

public interface qnaService {
public void enroll(BoardVO board);
	
	public List<BoardVO> getList(pageHandler ph,HttpServletRequest req);
	
	public BoardVO getPage(BoardVO board);
	
	public int updatePage(BoardVO board);
	
	public int deletePage(BoardVO board);
	
	public int getTotal(pageHandler Ph);
	
	public Map<String,Object> pageMaker(int total, pageHandler ph);
	
	public List<replyVO> viewReply(String bno);
	
	public int saveReply(HttpServletRequest req);
	
	public int deleteReply(HttpServletRequest req);
}
