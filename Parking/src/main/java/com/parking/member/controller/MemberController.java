package com.parking.member.controller;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.util.Random;

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
import com.parking.util.sha256;

@Controller
public class MemberController {

	@Resource
	private MemberService memberService;

	private MemberVO memberVO;

	// 로그 처리
//	private Logger log = Logger.getLogger(this.getClass());

	// 자바빈(VO) 초기화
	// 서버 유효성 체크시 필수로 필요
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}

	// 회원가입 컨트롤러
	@RequestMapping(value = "/member/signUpkakao.do", method = RequestMethod.POST)
	public String signUpkakao(HttpServletRequest request, Model model, HttpSession session) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int mem_dis = 0;
		int mem_auth = 0;

		MemberVO vo = new MemberVO();
		String mem_id = request.getParameter("mem_id");
		System.out.println("controller : mem_id : " + mem_id);
		String mem_pwd = request.getParameter("mem_pwd");
		System.out.println("controller : mem_pwd : " + mem_pwd);
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

		if (category.equals("big-sized")) {
			category = "대형";
		} else if (category.equals("medium-sized")) {
			category = "중형";
		} else if (category.equals("small-sized")) {
			category = "소형";
		}

		if (mem_dis_str.equals("ordi")) {
			mem_dis = 0;
		} else if (mem_dis_str.equals("dis")) {
			mem_dis = 1;
		}

		if (mem_auth_str.equals("user")) {
			mem_auth = 1;
		} else if (mem_auth_str.equals("owner")) {
			mem_auth = 2;
		}
		
		vo.setMem_id(mem_id);
		vo.setMem_pwd(mem_pwd);
		vo.setMem_name(mem_name);
		vo.setMem_phone(mem_phone);
		vo.setCar_id(carid);
		vo.setCar_model(carmodel);
		vo.setCategory(category);
		vo.setMem_dis(mem_dis);
		vo.setMem_auth(mem_auth);
		vo.setMem_token(mem_token);

		memberService.insertMember(vo);
		//세션에 토큰넣기
		session.setAttribute("mem_token", mem_token);
  	  	System.out.println("세션에 넣은 토큰값 : " + mem_token);
  	  	
		model.addAttribute("logOK", 1); // 로그인 완료되었을 때
		model.addAttribute("mem_name", mem_name);

		return "main/main";
	}	
	
	
	// 회원가입 컨트롤러
	@RequestMapping(value = "/member/insert.do", method = RequestMethod.POST)
	public String signUp(HttpServletRequest request, Model model, HttpSession session) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int mem_dis = 0;
		int mem_auth = 0;

		MemberVO vo = new MemberVO();
		String mem_id = request.getParameter("mem_id");
		System.out.println("controller : mem_id : " + mem_id);
		String mem_pwd = request.getParameter("mem_pwd");
		System.out.println("controller : mem_pwd : " + mem_pwd);
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

		if (category.equals("big-sized")) {
			category = "대형";
		} else if (category.equals("medium-sized")) {
			category = "중형";
		} else if (category.equals("small-sized")) {
			category = "소형";
		}

		if (mem_dis_str.equals("ordi")) {
			mem_dis = 0;
		} else if (mem_dis_str.equals("dis")) {
			mem_dis = 1;
		}

		if (mem_auth_str.equals("user")) {
			mem_auth = 1;
		} else if (mem_auth_str.equals("owner")) {
			mem_auth = 2;
		}
		
		Random rnd = new Random();
		String randomStr = String.valueOf((char) ((int) (rnd.nextInt(26)) + 97));
		String mem_token=null;
		//일반회원가입(토큰이 없는경우)
		if (mem_token == null) {
			mem_token = sha256.testSHA256(randomStr);
		}
		
		vo.setMem_id(mem_id);
		vo.setMem_pwd(mem_pwd);
		vo.setMem_name(mem_name);
		vo.setMem_phone(mem_phone);
		vo.setCar_id(carid);
		vo.setCar_model(carmodel);
		vo.setCategory(category);
		vo.setMem_dis(mem_dis);
		vo.setMem_auth(mem_auth);
		vo.setMem_token(mem_token);

		memberService.insertMember(vo);
		//세션에 토큰넣기
		session.setAttribute("mem_token", mem_token);
  	  	System.out.println("세션에 넣은 토큰값 : " + mem_token);
  	  	
		model.addAttribute("logOK", 1); // 로그인 완료되었을 때
		model.addAttribute("mem_name", mem_name);

		return "main/main";
	}

	// 로그인
	@RequestMapping(value = "/project/login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("로그인 실행");

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String mem_id = request.getParameter("mem_id");
		System.out.println("아이디 : " + mem_id);
		String mem_pwd = request.getParameter("mem_pwd");
		System.out.println("비밀번호 : " + mem_pwd);
		MemberVO vo = new MemberVO();
		vo.setMem_id(mem_id);
		vo.setMem_pwd(mem_pwd);
		
		vo = memberService.login(vo);
		if (vo != null) {
			session.setAttribute("mem_token", vo.getMem_token());
			model.addAttribute("logOK", 1); //로그인 완료시
			model.addAttribute("mem_name", vo.getMem_name());
			System.out.println("로그인 성공");
		}else {
			session.setAttribute("mem_id", null);
			session.setAttribute("mem_pwd", null);
			model.addAttribute("logOK", 0); //로그인 실패시
			System.out.println("로그인 실패");
			return "redirect:/";
		}
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("id",vo.getMem_id());
//		mav.addObject("pwd", vo.getMem_pwd());
		
		System.out.println("로그인 완료");
		
		return "main/main";

	}

	// 내정보 보기
	@RequestMapping(value = "/member/memberdetail.do")
	public ModelAndView memberDetail(HttpServletRequest request, Model model, HttpSession session) {

		String mem_token = (String) session.getAttribute("mem_token");
		System.out.println("mem_token in memberdetail123 : " + mem_token);
		
		
		// 토큰으로 memberVO가져오기
		MemberVO memberVO = memberService.getMemberbytoken(mem_token);

		ModelAndView mav = new ModelAndView();
		mav.addObject(memberVO);
		mav.setViewName("/member/memberdetail");

		return mav;
	}

	// 내정보 수정하기
	@RequestMapping(value = "/member/update.do")
	public String memberUpdate(HttpServletRequest request, Model model, HttpSession session) {

		String mem_token = (String) session.getAttribute("mem_token");
		// 토큰으로 memberVO가져오기
		MemberVO memberVO = memberService.getMemberbytoken(mem_token);

		// 수정할정보
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int mem_dis = 0;
		int mem_auth = 0;

		MemberVO vo = new MemberVO();
		String mem_id = request.getParameter("mem_id");
		System.out.println("controller : mem_id : " + mem_id);
		String mem_pwd = request.getParameter("mem_pwd");
		System.out.println("controller : mem_pwd : " + mem_pwd);
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

		if (category.equals("big-sized")) {
			category = "대형";
		} else if (category.equals("medium-sized")) {
			category = "중형";
		} else if (category.equals("small-sized")) {
			category = "소형";
		}

		if (mem_dis_str.equals("ordi")) {
			mem_dis = 0;
		} else if (mem_dis_str.equals("dis")) {
			mem_dis = 1;
		}

		if (mem_auth_str.equals("user")) {
			mem_auth = 1;
		} else if (mem_auth_str.equals("owner")) {
			mem_auth = 2;
		}
		vo.setMem_num(memberVO.getMem_num());
		vo.setMem_id(mem_id);
		vo.setMem_pwd(mem_pwd);
		vo.setMem_phone(mem_phone);
		vo.setCar_id(carid);
		vo.setCar_model(carmodel);
		vo.setCategory(category);
		vo.setMem_dis(mem_dis);
		vo.setMem_auth(mem_auth);

		memberService.updateMember(vo);

		return "redirect:/member/memberdetail.do";
	}
	
	@RequestMapping(value = "/member/delete.do")
	
	public String memberDelete(HttpServletRequest request, Model model, HttpSession session) {
		return null;
		
	}
	
	@RequestMapping(value = "/member/signUp.do")
	public String signUp() {
		//회원가입 호출
		return "member/signUp";
	}
	
	@RequestMapping(value = "/member/logOut.do")
	public String logOut(HttpServletRequest request, Model model, HttpSession session) {
		session.removeAttribute("mem_token");
		return "redirect:/project/main.do";
	}
}