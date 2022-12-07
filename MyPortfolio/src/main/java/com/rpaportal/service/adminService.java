package com.rpaportal.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.rpaportal.model.BoardVO;
import com.rpaportal.model.UserVO;
import com.rpaportal.model.pageHandler;

public interface adminService {
	public List<BoardVO> getCheckList(pageHandler ph, HttpServletRequest req);
	public int getTotal(pageHandler ph);
	public List<UserVO> getUserInfo(pageHandler ph, HttpServletRequest req);
	public Map<String, Object> pageMaker(int total, pageHandler ph);
	public UserVO userInfo(String id);
	public int userDelete(String id);
	public void workResultSendMail(HttpServletRequest req);
	public void answerChk(String bno);
}
