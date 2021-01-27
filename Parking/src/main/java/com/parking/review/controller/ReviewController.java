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

import com.parking.review.service.ReviewService;
import com.parking.review.vo.ReviewVO;
import com.parking.util.PagingUtil;




@Controller
public class ReviewController {
	
	@Resource
	private ReviewService reviewService;
	
	
	private int rowCount = 10;
	
	private ReviewVO reviewVO;
	
	//자바빈 초기화
	@ModelAttribute
	public ReviewVO initCommand() {
		return new ReviewVO();
	
	}
	
	//그룹 목록 불러오기
		@RequestMapping("/reviewListAjax.do" )
		@ResponseBody
		public Map<String,Object> getReviewList(@RequestParam(value="pageNum",defaultValue="1") int currentPage, HttpSession session, Model model){
			System.out.println("목록불러오기 ajax 진입");
			List<ReviewVO> list = null;
			
			//ReviewVO review = (ReviewVO)session.getAttribute("user");
			//int sessionMem_num = review.getMem_num();
			int sessionMem_num = 1;
			int count = 0;
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("mem_num", sessionMem_num);
			
			count = reviewService.selectCount(map);
			
			System.out.println("총 글의 갯수 : " + count);
			
			//paging 처리
			PagingUtil page = new PagingUtil(currentPage, count, rowCount, 10, "groupList.do");
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			
			//모든 그룹 list에 담기
			list = reviewService.allReviewList(map);
			System.out.println("list에 담긴 글 목록 : " + list);
			
			Map<String,Object> hashMap = new HashMap<String, Object>();
			hashMap.put("list", list);
			hashMap.put("count", count);
			hashMap.put("rowCount", rowCount);
			
			return hashMap;
			
		}

	
	

	//리뷰 리스트 페이지 호출
	@RequestMapping("/review.do")
	public String review() {
		//리뷰페이지 호출
		return "review/review";
	}
	
	
	//리뷰작성
	@RequestMapping(value="/review/reviewInsert.do", method=RequestMethod.POST) public
	String submitReviewInsert(@Valid ReviewVO reviewvo, BindingResult result, Model
	model, HttpServletRequest request) {
		  		  
		
		//유효성 체크 결과 오류가 없으면 쿼리작업 
		reviewService.insertReview(reviewvo);
		System.out.println("reviewVO : " + reviewvo);  
		return "review/review"; //성공하면 Insert에서 review로 감
	}
	
	
	@RequestMapping("/project/reviewInsert.do")
	public String reviewInsert() {
		//리뷰작성페이지 호출
		return "review/reviewInsert";
	}
	
	
	
}



