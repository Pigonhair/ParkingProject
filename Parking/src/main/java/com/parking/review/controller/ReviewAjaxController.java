package com.parking.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.parking.member.service.MemberService;
import com.parking.parking.service.ParkingService;
import com.parking.review.service.ReviewService;
import com.parking.review.vo.ReviewVO;
import com.parking.search.service.SearchService;
import com.parking.search.vo.SearchVO;
import com.parking.util.PagingUtil;

@Controller
public class ReviewAjaxController {

	@Resource
	private SearchService searchService;

	@Resource
	private ReviewService reviewService;
	
	@Resource
	private MemberService memberService;
	
	@Resource
	private ParkingService parkingService;


	private int rowCount = 10;

	private ReviewVO reviewVO;

	// 자바빈 초기화
	@ModelAttribute
	public ReviewVO initCommand() {
		return new ReviewVO();

	}

	// 그룹 목록 불러오기
	@RequestMapping(value="/review/reviewListAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getReviewList(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
			HttpSession session, Model model) {
		System.out.println("목록불러오기 ajax 진입");
		List<ReviewVO> list = null;

		// ReviewVO review = (ReviewVO)session.getAttribute("user");
		// int sessionMem_num = review.getMem_num();
		int sessionMem_num = 1;
		int count = 0;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", sessionMem_num);

		count = reviewService.selectCount(map);

		System.out.println("총 글의 갯수 : " + count);

		// paging 처리
		PagingUtil page = new PagingUtil(currentPage, count, rowCount, 10, "review.do");
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());

		// 모든 그룹 list에 담기
		list = reviewService.allReviewList(map);
		System.out.println("list에 담긴 글 목록 : " + list);

		Map<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("list", list);
		hashMap.put("count", count);
		hashMap.put("rowCount", rowCount);

		return hashMap;

	}
	
	@RequestMapping(value="/reviewListAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getReviewList2(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
			HttpSession session, Model model) {
		System.out.println("목록불러오기 ajax 진입");
		List<ReviewVO> list = null;

		// ReviewVO review = (ReviewVO)session.getAttribute("user");
		// int sessionMem_num = review.getMem_num();
		int sessionMem_num = 1;
		int count = 0;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", sessionMem_num);

		count = reviewService.selectCount(map);

		System.out.println("총 글의 갯수 : " + count);

		// paging 처리
		PagingUtil page = new PagingUtil(currentPage, count, rowCount, 10, "review.do");
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());

		// 모든 그룹 list에 담기
		list = reviewService.allReviewList(map);
		System.out.println("list에 담긴 글 목록 : " + list);

		Map<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("list", list);
		hashMap.put("count", count);
		hashMap.put("rowCount", rowCount);

		return hashMap;

	}


}
