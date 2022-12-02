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
import com.rpaportal.service.studyService;

@Controller
@RequestMapping("/study/*")
public class studyController {
	
	private static final Logger log = LoggerFactory.getLogger(studyController.class);
	
	@Autowired
	private studyService stuservice;
	
	String tableName="";
	
	@GetMapping("/basic")
	public void basicListGet(Model model, pageHandler ph, HttpServletRequest req) {
		tableName = "basic";
		ph.setTableName(tableName);
		log.info("/GET : basic");
		model.addAttribute("list",stuservice.getList(ph,req));
		int total = stuservice.getTotal(ph);
		model.addAttribute("map",stuservice.pageMaker(total, ph));
		model.addAttribute("total",total);
		model.addAttribute("title",2);
	}
	
	@GetMapping("/advanced")
	public void advancedListGet(Model model, pageHandler ph, HttpServletRequest req) {
		tableName="advanced";
		ph.setTableName(tableName);
		log.info("/GET : advanced");
		model.addAttribute("list",stuservice.getList(ph,req));
		int total = stuservice.getTotal(ph);
		model.addAttribute("map",stuservice.pageMaker(total, ph));
		model.addAttribute("total",total);
		model.addAttribute("title",2);
	}
	@GetMapping("/edu")
	public void eduListGet(Model model, pageHandler ph, HttpServletRequest req) {
		tableName="edu";
		ph.setTableName(tableName);
		log.info("/GET : advanced");
		model.addAttribute("list",stuservice.getList(ph,req));
		int total = stuservice.getTotal(ph);
		model.addAttribute("map",stuservice.pageMaker(total, ph));
		model.addAttribute("total",total);
		model.addAttribute("title",2);
	}
	
	@GetMapping("/studyEnroll")
	public void boardEnrollGet(Model model,HttpServletRequest req) {
		tableName = req.getParameter("tbn");
		model.addAttribute("tbn",tableName);
		log.info("/GET : studyEnroll");
	}
	
	@PostMapping("/studyEnroll")
	public String boardEnrollPost(BoardVO board, String tbn, RedirectAttributes rttr) {
		log.info("/enroll POST" + board);
		tableName = tbn;
		
		board.setTableType(tableName);
		stuservice.enroll(board);
		rttr.addFlashAttribute("result","enroll Success");
		
		return "redirect:/study/"+tableName;
	}
	@GetMapping("/studyPage")
	public void boardPageGet(BoardVO board,int bno, Model model, String tbn) {
		board.setBno(bno);
		board.setTableType(tbn);
		model.addAttribute("pageInfo",stuservice.getPage(board));
		model.addAttribute("tbn",tbn);
		model.addAttribute("title",2);
	}
	@PostMapping("/studyUpdatePage")
	public void updateBoardPageGet(BoardVO board,Model model) {
		model.addAttribute("pageInfo",stuservice.getPage(board));
		model.addAttribute("tbn",board.getTableType());
	}
	
	@PostMapping("/updatePage")
	public void updatePage(BoardVO board, Model model) {
		//System.out.println("value check : " +board);
		tableName = board.getTableType();
		model.addAttribute("updateInfo",stuservice.updatePage(board));
		model.addAttribute("tbn",tableName);
	}
	@PostMapping("/deletePage")
	public String deletePage(BoardVO board,RedirectAttributes rttr) {
		tableName = board.getTableType();
		rttr.addFlashAttribute("result",stuservice.deletePage(board));
		return "redirect:/study/"+tableName;
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
			String path = req.getSession().getServletContext().getRealPath("/resources/uploadimg/study/");
			
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
			String fileUrl =req.getContextPath()+"/resources/uploadimg/study/"+uid+"_"+fileName;
			
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
	@PostMapping("eduApply")
	@ResponseBody //'very important' Ajax return value
	public String eduApply(HttpServletRequest req) {
		
		int result = stuservice.eduApply(req);
		
		return Integer.toString(result);
	}
	@PostMapping("eduCancel")
	@ResponseBody //'very important' Ajax return value
	public String eduCancel(HttpServletRequest req) {
		
		int result=	stuservice.eduCancel(req);
		
		return Integer.toString(result);
	}
}
