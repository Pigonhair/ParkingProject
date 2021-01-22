package com.parking.member.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parking.member.service.MemberService;
import com.parking.member.vo.MemberVO;






@Controller
public class MemberController {

	
	//로그 처리
	private Logger log = Logger.getLogger(this.getClass());
	
	//자바빈(VO) 초기화
	//서버 유효성 체크시 필수로 필요
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}
	

	/*========================================================================================================*/
	//로그인 폼에서 회원가입 버튼을 눌렀을시 호출될 메서드
	//유저 타입 폼
	//처리할게 없으니 get/post 안씀
	@RequestMapping("/member/userType.do")
	public String formUserType() {
		//definition 설정명을 호출
		return "member/userRegisterTypeSelect";// 사용자/사장님 구분
	}

	/*========================================================================================================*/
	
	/*========================================================================================================*/
	//로그인 폼을 호출하는 메서드 [회원가입/로그인/(id/pw)찾기] 버튼으로 3가지 동작이 있음
	//로그인 폼
	@RequestMapping(value="/member/login.do", method=RequestMethod.GET)
	public String formLogin() {	
		//tiles-def 폴더에 member.xml파일의 definition name 호출
		return "member/login";
	}

	/*========================================================================================================*/	
}
