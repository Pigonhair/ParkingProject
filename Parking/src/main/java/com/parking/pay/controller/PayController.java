package com.parking.pay.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parking.pay.service.PayService;
import com.parking.pay.vo.PayVO;


@Controller
public class PayController {
	
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	/*
	 * @Resource PayService payService;
	 * 
	 * //자바빈(VO) 초기화
	 * 
	 * @ModelAttribute public PayVO initCommand() { return new PayVO(); }
	 */

	//search화면
	@RequestMapping(value = "/pay/pay.do")
	public String payReservation() {

		return "pay/pay";
	}
	
	
	//결제 완료
	@RequestMapping(value = "/pay/payok.do")
	public String payok() {

		return "pay/payok";
	}
	
	
}
