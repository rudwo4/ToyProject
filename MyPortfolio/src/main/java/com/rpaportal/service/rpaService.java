package com.rpaportal.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.rpaportal.model.BoardVO;
import com.rpaportal.model.UserVO;
import com.rpaportal.model.pageHandler;

public interface rpaService {
	
	
	public int loginChk(String id, String pwd);
	
	public int signUp(HttpServletRequest req);
	
	public int confirmId(HttpServletRequest req);
	
	public void certifiedPhoeNumber(String PhoneNumber, int randomNumber);
	
	public void sendMail(HttpServletRequest req);
	//public void mailAuthCheck(String email);
	
	public int findPw(HttpServletRequest req);
	
	public void tempPw(HttpServletRequest req);
	
	public UserVO userInfo(String loginId);
	
	public String pwCheck(String id,String recentPw,String password);
	
	public List<BoardVO> bookingList(String loginId);
	
	public List<BoardVO> QnaList(String loginId);
}
