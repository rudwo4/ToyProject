package com.rpaportal.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.rpaportal.mapper.rpaMapper;
import com.rpaportal.model.BoardVO;
import com.rpaportal.model.UserVO;
import com.rpaportal.model.pageHandler;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class rpaServiceImpl implements rpaService{
	@Autowired
	private rpaMapper mapper;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	

	@Override
	public int loginChk(String id, String pwd) {
		return mapper.loginChk(id,pwd);
	}

	@Override
	public int signUp(HttpServletRequest req) {
		
		UserVO user = new UserVO();
		user.setId(req.getParameter("userid"));
		user.setPassword(req.getParameter("passwd"));
		user.setUsername(req.getParameter("userName"));
		user.setEmail(req.getParameter("userEmail"));
		user.setPhoneNumber(req.getParameter("userPhone"));
		user.setBirth(req.getParameter("userBirth"));
		try {
			return mapper.signUp(user);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int confirmId(HttpServletRequest req) {
		String id = req.getParameter("userid");
		return mapper.confirmId(id);
	}

	@Override
	public void certifiedPhoeNumber(String PhoneNumber, int randomNumber) {
		String api_key="NCSHNKQIEFKIDM9E";
		String api_secret="KIIEQ1IZHKDPEQUNGXXGYOX1XLNKB4RO";
		
		Message coolsms = new Message(api_key,api_secret);
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("to", PhoneNumber);
		map.put("from", "01043889370");
		map.put("type", "SMS");
		map.put("text", "Auth Number" + "[" +randomNumber +"]");
		map.put("app_version", "test app 1.2");
		try {
			JSONObject obj = (JSONObject)coolsms.send(map);
			System.out.println(obj.toString());
		}catch(CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
	/*
	@Override
	public void mailAuthCheck(String email) {
		String setSubject = "mail Test";
		String SetText = "mail text Test";
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(new InternetAddress("kyeongjae@naver.com"));
			helper.setSubject(setSubject);
			helper.setText(SetText);
			helper.setTo(email);
			
			mailSender.send(message);
		}catch(MessagingException e) {
			e.printStackTrace();
		}
	}
	*/

	@Override
	public void sendMail(HttpServletRequest req) {
		String fullName = req.getParameter("name");
		String email = req.getParameter("email");
		String subject = "[KJ_RPA]Contact Request";
		String phoneNumber = req.getParameter("phoneNumber");
		String content = req.getParameter("message");
		
		String text = "[Name : "+fullName+"]\n[phoneNumber : "+phoneNumber+"]\n["+content+"]";
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(new InternetAddress("kyeongjae@naver.com"));
			helper.setSubject(subject);
			helper.setText(text);
			helper.setTo(email);
			
			mailSender.send(message);
		}catch(MessagingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int findPw(HttpServletRequest req) {
		
		UserVO user = new UserVO();
		
		user.setId(req.getParameter("id"));
		user.setEmail(req.getParameter("email"));
		user.setPhoneNumber(req.getParameter("phoneNumber"));
		
		
		return mapper.findPw(user);
	}

	@Override
	public void tempPw(HttpServletRequest req) {
		UserVO user = new UserVO();
		
		Random rnd = new Random();
		StringBuffer buf = new StringBuffer();
		for(int i=0;i<=7;i++) {
			if(rnd.nextBoolean()) {
				buf.append((char)((int)(rnd.nextInt(26))+65));
			}else {
				buf.append(rnd.nextInt(10));
			}
			
		}
		System.out.println("temp Pw : " + buf.toString());
		
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		String phoneNumber = req.getParameter("phoneNumber");
		//send Mail
		String subject = "[KJ_RPA]임시 비밀번호입니다.";
		String text = id+"님의 임시 비밀번호입니다.\n 임시 비밀번호 : " + buf.toString();
		
		user.setId(id);
		user.setEmail(email);
		user.setPhoneNumber(phoneNumber);
		user.setPassword(buf.toString());
		
		//update password
		mapper.updatePw(user);
		
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(new InternetAddress("kyeongjae@naver.com"));
			helper.setSubject(subject);
			helper.setText(text);
			helper.setTo(email);
			
			mailSender.send(message);
		}catch(MessagingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public UserVO userInfo(String loginId) {
		return mapper.userInfo(loginId);
	}

	@Override
	public String pwCheck(String id,String recentPw, String password) {
		int SelectResult = mapper.pwCheck(id,recentPw);
		
		if(SelectResult !=1) {
			return"fail";
		}
		//change password
		
		UserVO user = new UserVO();
		user.setId(id);
		user.setPassword(password);
		
		//System.out.println(id + password);
		mapper.updatePw(user);
		return "success";
	}

	@Override
	public List<BoardVO> bookingList(String loginId) {
		return mapper.eduList(loginId);
	}

	@Override
	public List<BoardVO> QnaList(String loginId) {
		return mapper.qnaList(loginId);
	}
}