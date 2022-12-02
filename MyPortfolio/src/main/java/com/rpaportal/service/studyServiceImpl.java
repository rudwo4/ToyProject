package com.rpaportal.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rpaportal.mapper.rpaMapper;
import com.rpaportal.model.BoardVO;
import com.rpaportal.model.UserVO;
import com.rpaportal.model.pageHandler;

@Service
public class studyServiceImpl implements studyService{

	@Autowired
	private rpaMapper mapper;
	
	@Override
	public void enroll(BoardVO board) {
		System.out.println("study " + board);
		mapper.boardEnroll(board);
	}

	@Override
	public List<BoardVO> getList(pageHandler ph, HttpServletRequest req){
		int CurrentPage;
		
		String pageNum= req.getParameter("pageNum");
		String category = req.getParameter("category");
		String keyword = req.getParameter("keyword");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		if(pageNum ==null || pageNum == "0") {pageNum = "1";}
		if(category =="") {category = null;}
		if(keyword =="") {keyword = null;}
		
		try {
			if(startDate.isBlank()){startDate = null;}
		}catch(Exception e) {
			//e.printStackTrace();
		}
		//System.out.println("This is Current boardnity Page date is " + startDate + " ~ "+ endDate);
		
		CurrentPage = Integer.parseInt(pageNum);
		
		int endBno = CurrentPage*ph.getPageSize();
		int startBno= endBno-(ph.getPageSize()-1);
		
		ph.setPageNum(CurrentPage);
		ph.setStartPage(startBno);
		ph.setEndPage(endBno);
		ph.setKeyword(keyword);
		ph.setCategory(category);
		ph.setStartDate(startDate);
		ph.setEndDate(endDate);
		/*
		System.out.println("============================================================");
		System.out.println("This is Current boardnity Page Number is " + pageNum);
		System.out.println("This is Current boardnity Page keyword is " + keyword);
		System.out.println("This is Current boardnity Page category is " + category);
		*/
		return mapper.boardGetList(ph);
	}

	@Override
	public BoardVO getPage(BoardVO board) {
		return mapper.boardGetPage(board);
	}

	@Override
	public int updatePage(BoardVO board) {
		return mapper.boardUpdatePage(board);
	}

	@Override
	public int deletePage(BoardVO board) {
		return mapper.boardDeletePage(board);
	}

	@Override
	public int getTotal(pageHandler ph) {
		return mapper.boardGetTotal(ph);
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
		/*
		System.out.println("start page" + beginPage);
		System.out.println("end page" + endPage);
		System.out.println("total page" + totalPage);
		System.out.println("total cnt " + total);
		System.out.println("Next" + beginPage + "!=1 result : " + showNext);
		System.out.println("Next" + endPage + "!="+ ph.getPageNum() + "result : " + showPrev);
		*/
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
	public int eduApply(HttpServletRequest req) {
		
		int bno = Integer.parseInt(req.getParameter("bno"));
		String tbn = req.getParameter("tbn");
		String loginId = req.getParameter("loginId");
		String code =tbn + Integer.toString(bno);
		
		BoardVO board = new BoardVO();
		board.setBno(bno);
		board.setTableType(tbn);
		
		BoardVO boardInfo = getPage(board);
		UserVO userInfo = mapper.userInfo(loginId);
		
		String title = boardInfo.getTitle();
		String eduMaster = boardInfo.getWriter();
		String username = userInfo.getUsername();
		
		
		int chkResult = eduApplychk(code, loginId);
		
		if(chkResult==1) {
			return 0;
		}else {
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("code", code);
		map.put("loginId", loginId);
		map.put("username", username);
		map.put("title", title);
		map.put("eduMaster", eduMaster);
		
		return mapper.registeToEdu(map);
		}
	}

	@Override
	public int eduApplychk(String code,String loginId) {
		return mapper.eduDuplicateChk(code, loginId);
	}

	@Override
	public int eduCancel(HttpServletRequest req) {
		int bno = Integer.parseInt(req.getParameter("bno"));
		String tbn = req.getParameter("tbn");
		String loginId = req.getParameter("loginId");
		String code =tbn + Integer.toString(bno);
		
		int result = mapper.eduCancel(code, loginId);
		return result;
	}
}
