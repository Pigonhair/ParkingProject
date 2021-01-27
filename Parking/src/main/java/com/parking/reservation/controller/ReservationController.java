package com.parking.reservation.controller;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parking.member.vo.MemberVO;
import com.parking.reservation.service.ReservationService;
import com.parking.reservation.vo.ReservationVO;

@Controller
public class ReservationController {

   @Resource
   ReservationService reservationService;

   // 로그 처리
//   private Logger log = Logger.getLogger(this.getClass());

   // 자바빈(VO) 초기화
   // 서버 유효성 체크시 필수로 필요
   @ModelAttribute("reservationVO")
   public MemberVO initCommand() {
      return new MemberVO();
   }
   
   @RequestMapping(value = "/project/reserveInsert.do", method = RequestMethod.POST)
   public String kakaoInsert(HttpServletRequest request, ModelMap model) throws UnsupportedEncodingException {
      request.setCharacterEncoding("UTF-8");

      ReservationVO vo = new ReservationVO();
   
      String str = request.getParameter("select-profession");
      System.out.println("dsadasdsadsa : " + str);
      
      String[] strArray = str.split(",");
      System.out.println("splitsplit : " + strArray[0]); // park_id 값
      System.out.println("splitsplit : " + strArray[1]); // mem_num 값
      
      // park_id 셋팅
      int park_id = Integer.parseInt(strArray[0]);
      vo.setPark_id(park_id);
      System.out.println("voPark : " + vo.getPark_id());
      
      // mem_num 셋팅
      int mem_num = Integer.parseInt(strArray[1]);
      vo.setMem_num(mem_num);
      System.out.println("mem : " + vo.getMem_num());
      
      // start time 셋팅
      vo.setStart_time(request.getParameter("start_time"));
      System.out.println("reser controller : start : " + vo.getStart_time());
      
      // end time 셋팅
      vo.setEnd_time(request.getParameter("end_time"));
      System.out.println("reser controller : endtime : " + vo.getEnd_time());

      System.out.println("**********controller 들어옴******");

      reservationService.inseReser(vo);
      
      return "예약완료페이지넣어야됨";
   }

}