package com.parking.parking.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.parking.member.service.MemberService;
import com.parking.member.vo.MemberVO;
import com.parking.parking.service.ParkingService;
import com.parking.parking.vo.ParkingVO;

@Controller
public class ParkingController {

   @Resource
   ParkingService parkingService;
   @Resource
   MemberService memberService;

   // 자바빈(VO) 초기화
   // 서버 유효성 체크시 필수로 필요
   @ModelAttribute("reservationVO")
   public MemberVO initCommand() {
      return new MemberVO();
   }
   
	@RequestMapping("/parking/myparking.do")
	public ModelAndView getMain(HttpServletRequest request,Locale locale, Model model,HttpSession session) {
		String mem_token = (String) session.getAttribute("mem_token");
	    System.out.println("mem_token in memberdetail123 : " + mem_token);
	    MemberVO memberVO = memberService.getMemberbytoken(mem_token);
	    ModelAndView mav = new ModelAndView();
		mav.setViewName("/parking/parking");
		mav.addObject(memberVO);
		return mav;
	}
   
   @RequestMapping(value = "/parking/parkingInsert.do", method = RequestMethod.POST)
   public String kakaoInsert(HttpServletRequest request, ModelMap model, HttpSession session)
         throws UnsupportedEncodingException, ParseException {
      request.setCharacterEncoding("UTF-8");

     String mem_token = (String) session.getAttribute("mem_token");
     System.out.println("mem_token in memberdetail123 : " + mem_token);
     MemberVO memberVO = memberService.getMemberbytoken(mem_token);
     
      
      ParkingVO vo = new ParkingVO();
      vo.setMem_num(memberVO.getMem_num());
      // 주차장 번호
//      String pakring_Selected = request.getParameter("parking_id_selected");
//      System.out.println("주차장번호 : " + pakring_Selected);
      
      // park_id 셋팅
//      int park_id = Integer.parseInt(pakring_Selected);
//      vo.setPark_id(park_id);
//      System.out.println("vo에서가져온Park_id값 : " + vo.getPark_id());
      
      //park_name 가져오기
      String park_name = request.getParameter("parking_name_selected");
      System.out.println("주차장이름 : " + park_name);
      vo.setPark_name(park_name);
      
      // detailAddr 상세주소 가져오기
      String detailAddr = request.getParameter("detailAddr");
      System.out.println("상세주소 : " + detailAddr);
      vo.setDetailAddr(detailAddr);
      
      //park_capacity 총 주차면수
      int park_capacity = Integer.parseInt(request.getParameter("park_capacity"));
      System.out.println("총 주차면수 : " + park_capacity);
      vo.setPark_capacity(park_capacity);
       
      // 주차장 종류  노상 / 부설 / 기계식
      String park_type = request.getParameter("selector");
      System.out.println("주차장 종류 : " + park_type );
      vo.setPark_type(park_type);
      
      // 공용 or 사설  1 = 공용 2 = 사설
      int park_public = Integer.parseInt(request.getParameter("toggle"));
      System.out.println("주차장 이용 : " + park_public);
      vo.setPark_public(park_public);

      parkingService.getInsertParking(vo);
         
      return "pay/pay";
   }
}