package com.rpaportal.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.rpaportal.model.BoardVO;
import com.rpaportal.model.UserVO;
import com.rpaportal.model.pageHandler;

public interface communityService {
public void enroll(BoardVO board);
	
	public List<BoardVO> getList(pageHandler ph,HttpServletRequest req);
	
	public BoardVO getPage(BoardVO board);
	
	public int updatePage(BoardVO board);
	
	public int deletePage(BoardVO board);
	
	public int getTotal(pageHandler Ph);
	
	public Map<String,Object> pageMaker(int total, pageHandler ph);
	
	public String authToken(String crURL,String username,String password);
	
	public void createAccount(String token,String crURL,String loginId);
}
