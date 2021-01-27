package com.parking.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.parking.review.vo.ReviewVO;

public interface ReviewMapper {

	//리뷰 식별번호 정하기
	@Select("SELECT review_seq.nextval FROM dual")
	public int selectReview_num();
	
	//리뷰 쓰기
	@Insert("INSERT INTO reviewBoard (review_num, review_title, review_date, review_content, mem_num, park_id) "
			+ "VALUES(#{review_num},#{review_title},SYSDATE,#{review_content},1,#{park_id})")
	public void insertReview(ReviewVO reviewvo);
	
	//리뷰 수정
	/*
	 * @Update("UPDATE reviewBoard SET reviewTitle=?, reviewContent=?, WHERE reviewNum=?"
	 * ) public void updateReview(reviewVO reviewvo);
	 */
	
	//리뷰 삭제
	
	
	
	//리뷰 리스트 불러오기
	public List<ReviewVO> allReviewList(Map<String,Object>map);
	public int selectCount(Map<String,Object>map);
	
	
	
	//리뷰 순서대로 따오기
	/*
	 * @Select("SELECT reviewID FROM reviewBoard ORDER BY reviewID DESC") public int
	 * getNextReview();
	 */
	
	//리뷰 주차장별로 검색
	/*
	 * @Select("SELECT reviewID FROM reviewBoard WHERE parkNum=?") public int
	 * morahaji();
	 */
	
	
	
	
}
