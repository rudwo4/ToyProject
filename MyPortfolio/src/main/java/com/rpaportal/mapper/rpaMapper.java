package com.rpaportal.mapper;

import java.util.HashMap;
import java.util.List;

import com.rpaportal.model.BoardVO;
import com.rpaportal.model.UserVO;
import com.rpaportal.model.pageHandler;
import com.rpaportal.model.replyVO;

public interface rpaMapper {
	public void enroll(BoardVO board);
	public List<BoardVO> getList(pageHandler ph);
	///another method
	//public List<BoardVO> getList(String pageNum,String amount);
	public BoardVO getPage(int bno);
	public int updatePage(BoardVO board);
	public int deletePage(int bno);
	public int paging();
	public int getTotal();

	//user
	public int loginChk(String id,String pwd);
	public int signUp(UserVO user);
	public int confirmId(String id);
	public int findPw(UserVO user);
	public void updatePw(UserVO user);
	public UserVO userInfo(String loginId);
	public int pwCheck(String id,String recentPw);
	public List<BoardVO> eduList(String loginId);
	public List<BoardVO> qnaList(String loginId);
	//user
	
	//board Start
	public void boardEnroll(BoardVO board);
	public List<BoardVO> boardGetList(pageHandler ph);
	public int boardGetTotal(pageHandler ph);
	public BoardVO boardGetPage(BoardVO board);
	public int boardUpdatePage(BoardVO board);
	public int boardDeletePage(BoardVO board);
	public int boardPaging();
	public int countView(BoardVO board);

	//board End
	
	//edu
	public int registeToEdu(HashMap<String, Object> map);
	public int eduDuplicateChk(String code,String loginId);
	public int eduCancel(String code,String loginId);
	//edu
	
	//QnA
	public List<replyVO> veiwReply(String bno);
	public int saveReply(String bno,String reply, String writer);
	public int deleteReply(String bno,String replybno, String writer);
	
	//admin
	public List<BoardVO> getCheckList();
}
