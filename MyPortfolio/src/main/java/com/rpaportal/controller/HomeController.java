package com.rpaportal.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rpaportal.model.pageHandler;
import com.rpaportal.service.communityService;
import com.rpaportal.service.qnaService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private communityService service;
	@Autowired
	private qnaService fservice;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, pageHandler ph, HttpServletRequest req) {
		logger.info("Welcome home! The client locale is {}.", locale);
		//String path = req.getSession().getServletContext().getRealPath("/resources/uploadimg/community/");
		
		//System.out.println(req.getSession().getServletContext());
		//System.out.println("path value = " + path);
			
		ph.setTableName("community");
		model.addAttribute("list",service.getList(ph,req));
		
		ph.setTableName("qna");
		model.addAttribute("faqlist",fservice.getList(ph,req));
		return "common/portalMain"; 
	}
	@GetMapping("/all")
	public String doAll() {
		System.out.println("do all can access!");
		return "common/all";
	}
	@GetMapping("/Tlogin")
	public void tlogin() {
		System.out.println("tlogin!");
	}@GetMapping("/Tlogin_chk")
	public void tloginChk() {
		System.out.println("tlogin_chk");
	}
}
