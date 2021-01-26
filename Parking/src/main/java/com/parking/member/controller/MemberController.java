package com.parking.member.controller;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.parking.member.service.MemberService;
import com.parking.member.vo.MemberVO;




@Controller
public class MemberController {

	@Resource
	MemberService memberService;
	
	//로그 처리
	private Logger log = Logger.getLogger(this.getClass());
	
	//자바빈(VO) 초기화
	//서버 유효성 체크시 필수로 필요
	@ModelAttribute("memberVO")
	public MemberVO initCommand() {
		return new MemberVO();
	}
	
	@RequestMapping(value = "/project/insert.do", method=RequestMethod.POST)
	public String kakaoInsert(HttpServletRequest request, ModelMap model) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		MemberVO vo = new MemberVO();
		String id = request.getParameter("id");
		System.out.println("controller : id : " + id);
		String name = request.getParameter("name");
		System.out.println("controller : name : " + name);
		String phone = request.getParameter("phone");
		System.out.println("controller : phone : " + phone);
		String carid = request.getParameter("carnumber");
		System.out.println("controller : carnum : " + carid);
		String carmodel = request.getParameter("carmodel");
		System.out.println("controller : CARMODEL : " + carmodel);
		String category = request.getParameter("categories");
		System.out.println("controller : Categories : " + category);
		String dis = request.getParameter("dis");
		System.out.println("controller : dis : " + dis);
		String auth = request.getParameter("auth");
		System.out.println("controller : AUTH : " + auth);
		String token = request.getParameter("token");
		System.out.println("controller : Token : " + token);
		
		
		vo.setMem_id(id);
		vo.setName(name);
		vo.setPhone(phone);
		vo.setCarid(carid);
		vo.setCarmodel(carmodel);
		vo.setCategory(category);
		vo.setDis(dis);
		vo.setMem_auth(auth);
		vo.setMem_token(token);
		System.out.println("**********controller 들어옴******");
//		vo.set
//		vo.setMem_auth(Integer.parseInt(auth));
		
		//		vo.setMem_id(request.getParameter("mem_id"));
//		System.out.println("controller : " + vo.getMem_id());
//		vo.setName(request.getParameter("name"));
//		System.out.println("controller : " + vo.getName());
		
		memberService.insertMember(vo);
		
		
		ModelAndView mav = new ModelAndView();
		
		return "fucking";
	}
	
}