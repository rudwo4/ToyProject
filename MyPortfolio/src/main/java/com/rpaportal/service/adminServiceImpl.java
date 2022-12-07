package com.rpaportal.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.rpaportal.mapper.rpaMapper;
import com.rpaportal.model.BoardVO;
import com.rpaportal.model.UserVO;
import com.rpaportal.model.pageHandler;

@Service
public class adminServiceImpl implements adminService{
	
	@Autowired
	private rpaMapper mapper;
	
	@Autowired
	private JavaMailSenderImpl mailSender;

	@Override
	public List<BoardVO> getCheckList(pageHandler ph, HttpServletRequest req) {
		int CurrentPage;
		
		String pageNum= req.getParameter("pageNum");
		
		if(pageNum ==null || pageNum == "0") {pageNum = "1";}
		
		CurrentPage = Integer.parseInt(pageNum);
		
		int endBno = CurrentPage*ph.getPageSize();
		int startBno= endBno-(ph.getPageSize()-1);
		
		ph.setPageNum(CurrentPage);
		ph.setStartPage(startBno);
		ph.setEndPage(endBno);
		
		return mapper.getCheckList(ph);
	}

	@Override
	public List<UserVO> getUserInfo(pageHandler ph, HttpServletRequest req) {
		int CurrentPage;
		
		String pageNum= req.getParameter("pageNum");
		String keyword = req.getParameter("keyword");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		if(pageNum ==null || pageNum == "0") {pageNum = "1";}
		if(keyword =="") {keyword = null;}
		
		try {
			if(startDate.isBlank()){startDate = null;}
		}catch(Exception e) {
			//e.printStackTrace();
		}
		
		CurrentPage = Integer.parseInt(pageNum);
		
		int endBno = CurrentPage*ph.getPageSize();
		int startBno= endBno-(ph.getPageSize()-1);
		
		ph.setPageNum(CurrentPage);
		ph.setStartPage(startBno);
		ph.setEndPage(endBno);
		ph.setKeyword(keyword);
		ph.setStartDate(startDate);
		ph.setEndDate(endDate);
		
		return mapper.getUserList(ph);
	}

	@Override
	public Map<String, Object> pageMaker(int total, pageHandler ph) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		int totalPage;
		int beginPage;
		int endPage;
		
		boolean showNext = false;
		boolean showPrev = false;
		
		totalPage = total/ph.getPageSize() + (total%ph.getPageSize()==0?0:1);
		beginPage = (ph.getPageNum()-1)/ph.getNAV_SZIE()*ph.getNAV_SZIE()+1;
		endPage = Math.min(beginPage+ph.getNAV_SZIE(),totalPage);
		
		showPrev = 1!=ph.getPageNum();
		showNext = endPage!=ph.getPageNum();
		
		map.put("currentPage",ph.getPageNum());
		map.put("totalPage",totalPage);
		map.put("beginPage", beginPage);
		map.put("endPage", endPage);
		map.put("showNext", showNext);
		map.put("showPrev", showPrev);
		map.put("ph",ph);
		return map;
	}

	@Override
	public int getTotal(pageHandler ph) {
		return mapper.getTotal(ph);
	}

	@Override
	public UserVO userInfo(String id) {
		return mapper.userInfo(id);
	}

	@Override
	public int userDelete(String id) {
		return mapper.userDelete(id);
	}

	@Override
	public void workResultSendMail(HttpServletRequest req) {
		
		String bno = req.getParameter("bno");
		String result = req.getParameter("result");
		String writer = req.getParameter("writer");
		String title = req.getParameter("title");
		
		UserVO user = mapper.userInfo(writer);
		String fullName = user.getUsername();
		String email = user.getEmail();
		
		String subject = "["+result+"] RPA Task Test Result(KJ_RPA)";
		String status;
		String text;
		
		if(result.equals("complete")) {
			status="golive";
			mapper.workReusltUpdate(bno,status); //status change
			text = "[Name : "+fullName+"]\n [TaskName : " +title+"]\n 업무가 완료되었습니다";
		}else {
			status="develop";
			mapper.workReusltUpdate(bno,status); //status change
			text = "[Name : "+fullName+"]\n [TaskName : " +title+"]\n 업무가 통과하지 못했습니다 \n 관리자를 통해 문의 부탁드립니다";
		}
		
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
	public void answerChk(String bno) {
		mapper.answerChk(bno);
	}
}
