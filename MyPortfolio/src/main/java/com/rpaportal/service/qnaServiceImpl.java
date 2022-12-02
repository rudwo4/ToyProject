package com.rpaportal.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rpaportal.mapper.rpaMapper;
import com.rpaportal.model.BoardVO;
import com.rpaportal.model.pageHandler;
import com.rpaportal.model.replyVO;

@Service
public class qnaServiceImpl implements qnaService{

	@Autowired
	private rpaMapper mapper;
	
	@Override
	public void enroll(BoardVO board) {
		
		String title = board.getTitle();
		String category = board.getCategory();
		if(category!="") {
			String newTitle = ("["+category+"] " + title);
			board.setTitle(newTitle);
		}
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
		
		//update + view count
		mapper.countView(board);
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
	public List<replyVO> viewReply(String bno) {
		return mapper.veiwReply(bno);
	}
	
	@Override
	public int saveReply(HttpServletRequest req) {
		String bno = req.getParameter("bno");
		String reply = req.getParameter("reply");
		String writer = req.getParameter("writer");
		return mapper.saveReply(bno, reply, writer);
	}

	@Override
	public int deleteReply(HttpServletRequest req) {
		String bno = req.getParameter("bno");
		String replybno = req.getParameter("replybno");
		String writer = req.getParameter("writer");
		return mapper.deleteReply(bno, replybno, writer);
	}
}
