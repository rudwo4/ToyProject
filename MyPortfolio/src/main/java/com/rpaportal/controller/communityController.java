package com.rpaportal.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rpaportal.model.BoardVO;
import com.rpaportal.model.pageHandler;
import com.rpaportal.service.communityService;

@Controller
@RequestMapping("/community/*")
public class communityController {
	
	private static final Logger log = LoggerFactory.getLogger(communityController.class);
	
	final private String crURL="";
	final private String usernmae="";
	final private String password="";
	
	@Autowired
	private communityService cservice;
	
	//@RequestMapping("/list")
	String tableName="";
	
	@GetMapping("/notice")
	public void boardListGet(Model model, pageHandler ph, HttpServletRequest req) {
		tableName = "community";
		ph.setTableName(tableName);
		log.info("/GET : notice");
		model.addAttribute("list",cservice.getList(ph,req));
		int total = cservice.getTotal(ph);
		model.addAttribute("map",cservice.pageMaker(total, ph));
		model.addAttribute("total",total);
		model.addAttribute("title",1);
	}
	
	@GetMapping("/download")
	public void downloadListGet(Model model, pageHandler ph, HttpServletRequest req) {
		tableName="download";
		ph.setTableName(tableName);
		log.info("/GET : download");
		model.addAttribute("list",cservice.getList(ph,req));
		int total = cservice.getTotal(ph);
		model.addAttribute("map",cservice.pageMaker(total, ph));
		model.addAttribute("total",total);
		model.addAttribute("title",1);
	}
	
	@GetMapping("/noticeEnroll")
	public void boardEnrollGet(Model model,HttpServletRequest req) {
		tableName = req.getParameter("tbn");
		model.addAttribute("tbn",tableName);
		log.info("/GET : noticeEnroll");
	}
	
	@PostMapping("/noticeEnroll")
	public String boardEnrollPost(BoardVO board, String tbn, RedirectAttributes rttr) {
		log.info("/enroll POST" + board);
		tableName = tbn;
		
		board.setTableType(tableName);
		cservice.enroll(board);
		if(tableName.equals("community")) {tableName ="notice";} //Table Name Match Error
		rttr.addFlashAttribute("result","enroll Success");
		
		return "redirect:/community/"+tableName;
	}
	@GetMapping("/noticePage")
	public void boardPageGet(BoardVO board,int bno, Model model, String tbn) {
		board.setBno(bno);
		board.setTableType(tbn);
		model.addAttribute("pageInfo",cservice.getPage(board));
		model.addAttribute("tbn",tbn);
		model.addAttribute("title",1);
	}
	@PostMapping("/noticeUpdatePage")
	public void updateBoardPageGet(BoardVO board,Model model) {
		model.addAttribute("pageInfo",cservice.getPage(board));
		model.addAttribute("tbn",board.getTableType());
	}
	@PostMapping("/updatePage")
	public void updatePage(BoardVO board, Model model) {
		//System.out.println("updatePage  : " + board.getTableType());
		tableName = board.getTableType();
		
		//System.out.println("value check : " +board);
		if(tableName.equals("community")) {tableName ="notice";}
		model.addAttribute("updateInfo",cservice.updatePage(board));
		model.addAttribute("tbn",tableName);
	}
	@PostMapping("/deletePage")
	public String deletePage(BoardVO board,RedirectAttributes rttr) {
		tableName = board.getTableType();
		rttr.addFlashAttribute("result",cservice.deletePage(board));
		if(tableName.equals("community")) {tableName ="notice";} //Table Name Match Error
		return "redirect:/community/"+tableName;
	}
	@PostMapping("/imageUpload")
	public void imageUpload(HttpServletRequest req,HttpServletResponse res, MultipartHttpServletRequest multiFile
			,@RequestParam MultipartFile upload) throws Exception {
		//Random String create
		UUID uid = UUID.randomUUID();
		
		OutputStream out = null;
		PrintWriter printwriter = null;
		
		//encodeing
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");	
		try {
			//file name
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			//image path
			String uploadimgPath = req.getSession().getServletContext().getRealPath("/resources/uploadimg/");
			String path = req.getSession().getServletContext().getRealPath("/resources/uploadimg/community/");
			
			System.out.println();
			String ckUploadPath = path+uid+"_"+fileName;
			File dirFolder = new File(uploadimgPath);
			File folder = new File(path);
			
			//System.out.println("upload Path : " + path);
			//path check
			if(!folder.exists()) {
				try {
					folder.mkdir();
				}catch(Exception e) {
					e.getStackTrace();
				}
			}else if(!dirFolder.exists()) {
				try {
					dirFolder.mkdir();	
				}catch(Exception e) {
					e.getStackTrace();
				}
			}
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // Send to stored data in outputStream and clear

			printwriter = res.getWriter();
			String fileUrl =req.getContextPath()+"/resources/uploadimg/community/"+uid+"_"+fileName;
			
			//System.out.println("uploaded file Path : " + fileUrl);
			//JSON parameter value
			JSONObject json = new JSONObject();
			json.put("uploaded", 1);
			json.put("fileName", fileName);
			json.put("url", fileUrl);
			
			printwriter.println(json);
			printwriter.flush();
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(out!=null) {out.close();}
				if(printwriter!=null) {printwriter.close();}
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		return;
	}
	@GetMapping("/userApply")
	public void userApply(Model model) {
		log.info("GET : UserApply");
		model.addAttribute("title",1);
	}
	
	@GetMapping("/CRid")
	@ResponseBody
	public void registeToCrId(HttpServletRequest req) {
		String id = req.getSession().getId();
		
		//create token;
		//String token = cservice.authToken(crURL, usernmae, password);
		//cservice.createAccount(token, crURL, id);
		System.out.println("Create Account Complete");
	}
}