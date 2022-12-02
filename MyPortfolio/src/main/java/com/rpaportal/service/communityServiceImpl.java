package com.rpaportal.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.rpaportal.mapper.rpaMapper;
import com.rpaportal.model.BoardVO;
import com.rpaportal.model.pageHandler;

@Service
public class communityServiceImpl implements communityService{

	@Autowired
	private rpaMapper mapper;
	
	@Override
	public void enroll(BoardVO board) {
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
	public String authToken(String crURL,String username,String password){
		try {
			String apiURL = "http://"+crURL+"/v1/authentication"; 
			//URL Object 
			URL url = new URL(apiURL);
			//http URL Connection Object Create
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			//Request Method 
			conn.setRequestMethod("POST");
			//Content-type SET
			conn.setRequestProperty("Content-type", "application/json");
			conn.setDoInput(true);//Send to Server
			conn.setDoOutput(true);//Get to server
			
			//JSon Object Send(Body)
			JSONObject obj =new JSONObject();
			obj.put("username", username);
			obj.put("password", password);
			obj.put("multipleLogin", true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(obj.toString());	// into Buffer
			bw.flush();	// Send to Data in Buffer
			bw.close();
			//response Code Check
			
			// Read Data to Server
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line = null;
			
			while((line=br.readLine())!=null) {
				sb.append(line);
			}
			
			return sb.toString();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public void createAccount(String token,String crURL, String loginId) {
		try {
			String apiURL = "http://"+crURL+"/v1/usermanagement/user"; 
			//URL Object 
			URL url = new URL(apiURL);
			//http URL Connection Object Create
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			//Request Method 
			conn.setRequestMethod("POST");
			//Content-type SET
			conn.setRequestProperty("Content-type", "application/json");
			conn.setRequestProperty("X-Authorization", token);

			conn.setDoInput(true);//Send to Server
			conn.setDoOutput(false);//Get to server
			
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdf.format(date);
			
			//JSon Object Send(Body)
			JSONObject obj =new JSONObject();
			JSONObject roleobj =new JSONObject();
			JSONArray rolearr = new JSONArray();
			JSONArray licensearr = new JSONArray();
			
			roleobj.put("id", 185);
			rolearr.add(roleobj);
			obj.put("roles", rolearr);
			obj.put("username", loginId);
			obj.put("password", "kjrpa123");
			obj.put("description", today+"created");
			licensearr.add("DEVELOPMENT");
			obj.put("licenseFeatures", licensearr);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(obj.toString());	// into Buffer
			bw.flush();	// Send to Data in Buffer
			bw.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
}
