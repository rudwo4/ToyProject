package com.rpaportal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rpaportal.model.UserVO;
import com.rpaportal.model.pageHandler;
import com.rpaportal.service.adminService;
import com.rpaportal.service.communityService;

@Controller
@RequestMapping("/admin/*")
public class adminController {

	@Autowired
	adminService adservice;
	@Autowired
	communityService cservice;
	
	@GetMapping("/adminMain")
	public void adminMain() {
		
	}
	
	@GetMapping("/adminTask")
	public void amdinTask(Model model,pageHandler ph,HttpServletRequest req) {
		String tableName = "worklist";
		ph.setTableName(tableName);
		ph.setPageSize(10);
		
		model.addAttribute("list",adservice.getCheckList(ph,req));
		model.addAttribute("title",6);
		
		int total = adservice.getTotal(ph);
		model.addAttribute("total",total);
		model.addAttribute("map",adservice.pageMaker(total, ph));
	}
	@GetMapping("/golivechk")
	public String golivechk(HttpServletRequest req) {
		adservice.workResultSendMail(req);
		
		return "redirect:/admin/adminTask";
	}
	@GetMapping("/userManage")
	public void userManage(Model model,pageHandler ph,HttpServletRequest req) {
		String tableName = "user";
		ph.setTableName(tableName);
		ph.setPageSize(10);
		
		model.addAttribute("list",adservice.getUserInfo(ph,req));
		model.addAttribute("title",6);
		
		int total = adservice.getTotal(ph);
		model.addAttribute("total",total);
		model.addAttribute("map",cservice.pageMaker(total, ph));
	}
	@GetMapping("/userInfo")
	public void userInfo(HttpServletRequest req,Model model) {
		String id = req.getParameter("id");
		model.addAttribute("user",adservice.userInfo(id));
	}
	@GetMapping("/userDelete")
	public String userDelete(HttpServletRequest req) {
		String id = req.getParameter("id");
		adservice.userDelete(id);
	
		return "redirect:/admin/userManage";
	}
	@GetMapping("/adminQnA")
	public void adminQnA(Model model,pageHandler ph,HttpServletRequest req) {
		String tableName = "qna";
		ph.setTableName(tableName);
		ph.setPageSize(10);
		
		model.addAttribute("list",adservice.getCheckList(ph,req));
		model.addAttribute("title",6);
		
		int total = adservice.getTotal(ph);
		model.addAttribute("total",total);
		model.addAttribute("map",cservice.pageMaker(total, ph));
	}
	@GetMapping("/answerChk")
	public String answerChk(String bno) {
		
		adservice.answerChk(bno);
		return "redirect:/admin/adminQnA";
	}
}
