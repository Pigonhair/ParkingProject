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

		String pakring_Selected = request.getParameter("parking_id_selected");
		System.out.println("주차장번호 : " + pakring_Selected);
		
		// park_id 셋팅
		int park_id = Integer.parseInt(pakring_Selected);
		vo.setPark_id(park_id);
		System.out.println("vo에서가져온Park_id값 : " + vo.getPark_id());
		
		//park_name 가져오기
		String park_name = request.getParameter("parking_name_selected");
		System.out.println("주차장이름 : " + park_name);

		//session에서토큰으로 사용자확인
		String mem_token = (String)session.getAttribute("mem_token");
		System.out.println("mem_token :" + mem_token);
		
		//토큰으로 memberVO가져오기
		MemberVO memberVO = memberService.getMemberbytoken(mem_token);
		int mem_num = memberVO.getMem_num();
		vo.setMem_num(mem_num);
		System.out.println("mem : " + vo.getMem_num());
		
        String car_num = request.getParameter("car_num");
        vo.setCar_num(car_num);
        System.out.println("vo에서가져온car_num값: "+ vo.getCar_num());
		

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
		
		model.addAttribute("payprice",totalPrice);
		model.addAttribute("start_time", start_time);
		model.addAttribute("end_time", end_time);
		model.addAttribute("park_name", park_name);
		model.addAttribute("car_num", car_num);

		return "pay/pay";
	}

}