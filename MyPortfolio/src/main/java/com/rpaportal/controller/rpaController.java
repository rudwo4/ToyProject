package com.rpaportal.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rpaportal.model.pageHandler;
import com.rpaportal.service.rpaService;

@Controller
@RequestMapping("/board/*")
public class rpaController {
	
	private static final Logger log = LoggerFactory.getLogger(rpaController.class);
	
	@Autowired
	private rpaService rpaservice; 
	
	
	@GetMapping("/contact")
	public void boardListGet(Model model, pageHandler ph, HttpServletRequest req) {
		log.info("/contact");
	}

	/*
	@PostMapping("/AuthsendMail")
	public String AuthSendMail() {
		log.info("/sendMail");
		int randomNumber = (int)((Math.random()*(9999-1000+1))+1000);
		String email = "kjlee@rbrain.co.kr";
		rpaservice.mailAuthCheck(email);
		System.out.println("send Email complete");
		
		return "/";
	}
	*/
	@PostMapping("/sendMail")
	public String sendMail(HttpServletRequest req,RedirectAttributes rttr) {
		
		log.info("/sendMail");
		
		//System.out.println("send Email complete");
		rpaservice.sendMail(req);
		rttr.addFlashAttribute("message","success");
		
		return "redirect:/board/contact";
	}
}
