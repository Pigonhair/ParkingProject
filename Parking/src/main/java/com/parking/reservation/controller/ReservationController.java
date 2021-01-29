package com.parking.reservation.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parking.member.service.MemberService;
import com.parking.member.vo.MemberVO;
import com.parking.reservation.service.ReservationService;
import com.parking.reservation.vo.ReservationVO;

import oracle.net.aso.m;

@Controller
public class ReservationController {

	@Resource
	ReservationService reservationService;
	@Resource
	MemberService memberService;

	// 로그 처리
//   private Logger log = Logger.getLogger(this.getClass());

	// 자바빈(VO) 초기화
	// 서버 유효성 체크시 필수로 필요
	@ModelAttribute("reservationVO")
	public MemberVO initCommand() {
		return new MemberVO();
	}

	@RequestMapping(value = "/project/reserveInsert.do", method = RequestMethod.POST)
	public String kakaoInsert(HttpServletRequest request, ModelMap model, HttpSession session)
			throws UnsupportedEncodingException, ParseException {
		request.setCharacterEncoding("UTF-8");

		ReservationVO vo = new ReservationVO();

		String str = request.getParameter("select-profession");
		System.out.println("인풋에서 가져온 주차장번호 : " + str);

//		String[] strArray = str.split(",");
//		System.out.println("splitsplit : " + strArray[0]); // park_id 값
//		System.out.println("splitsplit : " + strArray[1]); // mem_num 값

		// park_id 셋팅
		int park_id = Integer.parseInt(str);
		vo.setPark_id(park_id);
		System.out.println("vo에서가져온Park_id값 : " + vo.getPark_id());

		//session에서토큰으로 사용자확인
		session = request.getSession();
		String mem_token = (String)session.getAttribute("mem_token");
		System.out.println("mem_token :" + mem_token);
		
		//토큰으로 memberVO가져오기
		MemberVO memberVO = memberService.getMemberbytoken(mem_token);
		int mem_num = memberVO.getMem_num();
		vo.setMem_num(mem_num);
		System.out.println("mem : " + vo.getMem_num());
		
		// mem_num 셋팅
//		int mem_num = Integer.parseInt(strArray[1]);
//		vo.setMem_num(mem_num);
		

		//문자열로 받아온 데이터 시간차 계산해서 총가격 측정
		String start_time = request.getParameter("start_time");
		String end_time = request.getParameter("end_time");

		SimpleDateFormat fm = new SimpleDateFormat("HH:mm");
		Date d1 = fm.parse(start_time);
		Date d2 = fm.parse(end_time);
		long diff = d2.getTime() - d1.getTime();
		long diffHours = diff / (60 * 60 * 1000) % 24;
		long diffMinutes = diff / (60 * 1000) % 60;
		long totalMinutes = diffMinutes + (diffHours * 60);
		System.out.println("시간차:" + diffHours + "시" + diffMinutes + "분");
		System.out.println("총 예약 분: " + totalMinutes);
		long price = 100 * totalMinutes;
		int totalPrice = (int) price;
		System.out.println("총 가격: " + totalPrice + "원");

		// start time, end_time, totalPrice VO에 값 넣기
		vo.setStart_time(start_time);
		vo.setEnd_time(end_time);
		vo.setTotalPrice(totalPrice);

		System.out.println("**********controller 들어옴******");

		reservationService.inseReser(vo);

		return "예약완료페이지넣어야됨";
	}

}