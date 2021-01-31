package com.parking.reservation.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.parking.reservation.service.ReservationService;
import com.parking.reservation.vo.ReservationVO;

@Controller
public class ReservationAjaxController {

   @Resource
   private ReservationService reservationService;

   @RequestMapping(value="/confirmParkingList.do", method=RequestMethod.POST)
   @ResponseBody
   public Map<String,String> process(@RequestParam("park_id") String park_id,
		   @RequestParam("start_time") String start_time,
		   @RequestParam("end_time") String end_time
		   ){
	   int park_id_int=Integer.parseInt(park_id);
	   
	   ReservationVO reservationVO = new ReservationVO();
	   reservationVO.setPark_id(park_id_int);
	   reservationVO.setStart_time(start_time);
	   reservationVO.setEnd_time(end_time);

      Map<String,String> map = new HashMap<String,String>();
      ReservationVO reservation = reservationService.selectCheckParkingList(reservationVO);

      if(reservation!=null) {

         map.put("result", "idDuplicated");
      }else {

         map.put("result", "idNotFound");
      }

      return map;
   }
}










