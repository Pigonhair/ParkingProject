package com.parking.main.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping("/project/main.do")
	public String getMain(HttpServletRequest request,Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		 model.addAttribute("logOK",0); //로그인안됬을 때
		return "main/main";
	}
	
	@RequestMapping(value = "/project/signUp.do")
	public String signUp() {
		//회원가입 호출
		return "member/SignUp";
	}
	
}
