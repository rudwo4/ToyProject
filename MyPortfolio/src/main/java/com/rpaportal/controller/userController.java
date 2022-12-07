package com.rpaportal.controller;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rpaportal.model.UserVO;
import com.rpaportal.service.rpaService;

@Controller
@RequestMapping("/user/*")
public class userController {
	
	private static final Logger log = LoggerFactory.getLogger(userController.class);
	
	@Autowired
	private rpaService rpaservice; 
	
	@GetMapping("/login")
	public String userLoginPage(HttpSession session) {
		log.info("GET : /user/login");
		//System.out.println(session.getAttribute("id"));
		return "user/LoginForm";
	}
	
	@GetMapping("/signUp")
	public String signupPage(HttpSession session) {
		log.info("GET : /user/signup");
		//session.
		//System.out.println(session.getAttribute("id"));
		return "user/signupForm";
	}
	
	@GetMapping("/logout")
	public String userLoginOut(HttpSession session, RedirectAttributes rttr) {
		log.info("GET : /user/logout");
		//rttr.addFlashAttribute("msg","logout");
		System.out.println("logout");
		session.invalidate();
		
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String userLogin(String id,String pwd,String toURL,boolean rememberId,HttpSession session, 
			HttpServletRequest req,HttpServletResponse res) throws Exception {
		
		//System.out.println("id : " + id +" / " + "pw : " + pwd);
		
		//login Chk 	
		if(rpaservice.loginChk(id, pwd)==0) {
			String msg = URLEncoder.encode("id or Password is not Correct","UTF-8");
			return "redirect:/user/login?msg="+msg;
		}
		UserVO user = rpaservice.userInfo(id);
		String auth = user.getRole();
		
		
		session = req.getSession();
		
		session.setMaxInactiveInterval(60*60*12);
		//session.setMaxInactiveInterval(1*10);
		session.setAttribute("id", id);
		session.setAttribute("auth", auth);
		
		Cookie cookie = new Cookie("id",id);
		//Cookie 
		if(!rememberId) {
			cookie.setMaxAge(0);//cookie delete
			res.addCookie(cookie);
		}	
		
		res.addCookie(cookie);
		
		toURL = toURL ==null || toURL.equals("") ? "/" : toURL;
		
		System.out.println("toURL : " + toURL);
		
		log.info("POST : /user/login");
		return "redirect:"+toURL;
	}
	@GetMapping("/findPw")
	public String GetfindUserPw() {
		log.info("GET : /user/findPw");
		return "/user/findPw";
	}
	
	@PostMapping("/findPw")
	public void PostfindUserPw(HttpServletRequest req, HttpServletResponse res) throws Exception{
		log.info("Post : /user/findPw");
		PrintWriter out = res.getWriter();
		
		int result = rpaservice.findPw(req);
		
		if(result !=1) {
			out.print("등록되지 않은 계정/메일입니다.");
			out.close();
		}else {
			out.print("이메일로 임시 비밀번호를 보냈습니다");
			out.close();
			rpaservice.tempPw(req);
		}
	}
	
	@PostMapping("/signUp")
	public String uesrSignUp(HttpServletRequest req, RedirectAttributes rttr) {
		log.info("POST : /user/userSignUp");
		
		System.out.println("Post : signUp");

		int result = rpaservice.signUp(req);
		//System.out.println("result : " + result);
		if(result==0) {
			rttr.addFlashAttribute("result","Fail");
			return "redirect:/user/signUp";
		}
		rttr.addFlashAttribute("result","Success");
		return "redirect:/user/login";
	}
	@GetMapping("/duplicateIdChk")
	@ResponseBody
	public String confirmId(HttpServletRequest req) {
		log.info("GET : /user/confirmId");
		int result = rpaservice.confirmId(req);
		
		return Integer.toString(result);
	}
	@GetMapping("/phoneChk")
	@ResponseBody
	public String phoneChk(HttpServletRequest req) {
		log.info("GET : /user/phoneChk");
		
		String userPhoneNumber = req.getParameter("phone");
		int randomNumber = (int)((Math.random()*(9999-1000+1))+1000);
		
		//rpaservice.certifiedPhoeNumber(userPhoneNumber, randomNumber);
		
		System.out.println("random Num is " + randomNumber);
		return Integer.toString(randomNumber);
	}
	
	@GetMapping("/myInfo")
	public void myinfoPage(Model model,HttpSession session) {
		String loginId = (String)session.getAttribute("id");
		model.addAttribute("info",rpaservice.userInfo(loginId));
		model.addAttribute("booking",rpaservice.bookingList(loginId));
		//Q&A List
		model.addAttribute("qna",rpaservice.QnaList(loginId));
		model.addAttribute("title",5);
		
	}
	@GetMapping("/renewalPw")
	public void renewalPw(Model model,HttpSession session) {
		String loginId = (String)session.getAttribute("id");
		//System.out.println(loginId);
		model.addAttribute("info",rpaservice.userInfo(loginId));
		
		//booking List
		model.addAttribute("eduList",rpaservice.bookingList(loginId));
		model.addAttribute("title",5);
		
	}
	@PostMapping("/renewalPw")
	public String postRenewalPw(HttpServletRequest req,RedirectAttributes rttr,HttpSession session) {
		String id = (String)session.getAttribute("id");
		String recentPw = req.getParameter("recentPw");
		String password = req.getParameter("renewalPw");
		String message = rpaservice.pwCheck(id,recentPw,password);
		
		System.out.println("cr Message : " + message);
		rttr.addFlashAttribute("message",message);
		return "redirect:/user/renewalPw";
	}
}
