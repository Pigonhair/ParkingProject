package com.parking.review.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
public class ReviewController {

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
		System.out.println("list에 담긴 이미지이름: " + list.get(0).getImg());

		Map<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("list", list);
		hashMap.put("count", count);
		hashMap.put("rowCount", rowCount);

		return hashMap;

	}

	// 리뷰 리스트 페이지 호출
	@RequestMapping("/review.do")
	public String review() {
		// 리뷰페이지 호출
		return "review/review";
	}

	// 리뷰작성
	@RequestMapping(value = "/review/reviewInsert.do", method = RequestMethod.POST)
	public String submitReviewInsert(@Valid ReviewVO reviewvo,
			@RequestParam(value = "pageNum", defaultValue = "1") int currentPage, BindingResult result, Model model,
			HttpServletRequest request, HttpSession session) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("reviewInsert : " + reviewvo.getPark_id());
		
		//세션에서 사용자토큰가져오기
		String mem_token = (String) session.getAttribute("mem_token");
		System.out.println("mem_token in reviewInsert : " + mem_token);
		
		//MEM_TOKEN으로 MEM_NUM 가져오기
		int mem_num = memberService.getMemnumBytoken(mem_token);
		reviewvo.setMem_num(mem_num);
		System.out.println("mem_num in reviewInsert :    " + mem_num);
		
		
		//PARK_ID로 PAKR_NAME가져오기
		String park_name = parkingService.getParknameByParkid(reviewvo.getPark_id());
		reviewvo.setPark_name(park_name);
		System.out.println("park_name in reviewInsert :    " + park_name);

		System.out.println("제목 : " +reviewvo.getReview_content());
		System.out.println("내용 : " +reviewvo.getReview_title());
		
		// 유효성 체크 결과 오류가 없으면 쿼리작업
		reviewService.insertReview(reviewvo);
		System.out.println("reviewVO 후 : " + reviewvo);

		/*
		 * List<ReviewVO> list = null;
		 * 
		 * //ReviewVO review = (ReviewVO)session.getAttribute("user"); //int
		 * sessionMem_num = review.getMem_num(); int sessionMem_num = 1; int count = 0;
		 * 
		 * Map<String,Object> map = new HashMap<String,Object>(); map.put("mem_num",
		 * sessionMem_num);
		 * 
		 * count = reviewService.selectCount(map);
		 * 
		 * System.out.println("총 글의 갯수 : " + count);
		 * 
		 * //paging 처리 PagingUtil page = new PagingUtil(currentPage, count, rowCount,
		 * 10, "review.do"); map.put("start", page.getStartCount()); map.put("end",
		 * page.getEndCount());
		 * 
		 * //모든 그룹 list에 담기 list = reviewService.allReviewList(map);
		 * System.out.println("list에 담긴 글 목록 : " + list);
		 * 
		 * 
		 * Map<String,Object> hashMap = new HashMap<String, Object>();
		 * hashMap.put("list", list); hashMap.put("count", count);
		 * hashMap.put("rowCount", rowCount);
		 * 
		 * 
		 * ModelAndView mav = new ModelAndView(); mav.setViewName("/review/review");
		 * mav.addObject("list", list); mav.addObject("count", count);
		 * mav.addObject("rowCount", rowCount);
		 */

		return "review/review";

	}

	// 리뷰 인서트페이지안에서 주차장 리스트 불러오는거
	@RequestMapping("/review/reviewInsert.do")
	public ModelAndView reviewInsert() {
		// 총 글의 갯수 또는 검색된 글의 갯수
		List<SearchVO> list = searchService.selectParkinglist();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/review/reviewInsert");
		mav.addObject("list", list);
		return mav;
	}
	

}
