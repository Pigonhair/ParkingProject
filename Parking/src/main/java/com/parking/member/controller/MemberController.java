package com.parking.member.controller;


import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.parking.member.service.MemberService;
import com.parking.member.vo.MemberVO;




@Controller
public class MemberController {

	@Resource
	private MemberService memberService;
	
	private MemberVO memberVO;
	
	//로그 처리
	private Logger log = Logger.getLogger(this.getClass());
	
	//자바빈(VO) 초기화
	//서버 유효성 체크시 필수로 필요
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}
	
	
	@RequestMapping(value = "/project/insert.do", method=RequestMethod.POST)
	public String kakaoInsert(HttpServletRequest request, Model model) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int mem_dis=0;
		int mem_auth=0;
		
		MemberVO vo = new MemberVO();
		String mem_id = request.getParameter("mem_id");
		System.out.println("controller : mem_id : " + mem_id);
		String mem_name = request.getParameter("mem_name");
		System.out.println("controller : mem_name : " + mem_name);
		String mem_phone = request.getParameter("mem_phone");
		System.out.println("controller : mem_phone : " + mem_phone);
		String carid = request.getParameter("carid");
		System.out.println("controller : carnum : " + carid);
		String carmodel = request.getParameter("carmodel");
		System.out.println("controller : CARMODEL : " + carmodel);
		String category = request.getParameter("category");
		System.out.println("controller : category : " + category);
		String mem_dis_str = request.getParameter("mem_dis");
		System.out.println("controller : mem_dis_str : " + mem_dis_str);
		
		String mem_auth_str = request.getParameter("mem_auth");
		System.out.println("controller : mem_auth_str : " + mem_auth_str);
		String mem_token = request.getParameter("mem_token");
		System.out.println("controller : mem_token : " + mem_token);
		
		
		if(category.equals("big-sized")) {
			category="대형";
		} else if (category.equals("medium-sized")) {
			category="중형";
		} else if (category.equals("small-sized")) {
			category="소형";
		}
		
		if(mem_dis_str.equals("ordi")) {
			mem_dis=0;
		} else if (mem_dis_str.equals("dis")) {
			mem_dis=1;
		} 
		
		if(mem_auth_str.equals("user")) {
			mem_auth=1;
		} else if (mem_auth_str.equals("owner")) {
			mem_auth=2;
		} 
		
		vo.setMem_id(mem_id);
		vo.setName(mem_name);
		vo.setPhone(mem_phone);
		vo.setCarid(carid);
		vo.setCarmodel(carmodel);
		vo.setCategory(category);
		vo.setDis(mem_dis);
		vo.setMem_auth(mem_auth);
		vo.setMem_token(mem_token);
		
	 	memberService.insertMember(vo);
        HttpSession session = request.getSession();
        session.setAttribute("logOK", "로그인성공");
        session.setAttribute("mem_name", mem_name);
		
		ModelAndView mav = new ModelAndView();
		return "main/main";
	}
	
}