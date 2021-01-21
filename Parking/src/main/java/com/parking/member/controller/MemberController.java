package com.parking.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MemberController {


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
}
