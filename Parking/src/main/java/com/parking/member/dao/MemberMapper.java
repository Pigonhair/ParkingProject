package com.parking.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.parking.member.vo.MemberVO;


public interface MemberMapper {

	
	/****** 가입 ******/
	//회원식별 번호 정하기
	@Select("SELECT member_seq.nextval FROM dual")
	public int selectMem_num();
	
	//member테이블에 입력하기
	@Insert("INSERT INTO member (mem_num, mem_id, mem_auth, mem_token) VALUES (#{mem_num},#{mem_id},#{mem_auth},#{mem_token})")
	public void insertMember(MemberVO membervo);
	
	//member_detail 테이블에 입력하기
	@Insert("INSERT INTO member_detail(mem_num,mem_name,mem_phone,mem_dis)"
			+ "VALUES(#{mem_num},#{mem_name},#{mem_phone},#{mem_dis})")
	public void insertMember_detail(MemberVO membervo);
	
	/****** 가입 ******/
	
	
	/****** 로그인 ******/
	//아이디 중복체크,로그인 사용 가능
	//매개변수를 아이디만 주기
	@Select("SELECT * FROM member WHERE mem_id=#{mem_id}")
	public MemberVO login(String mem_id);
	/****** 로그인 ******/
	
	
	

	//카카오톡에서 받은 email, name, token, 
		@Insert("INSERT INTO member(mem_num,mem_id,mem_auth,mem_token)"
				+ "VALUES(mem_num_member.nextval,#{mem_id},#{mem_auth},#{mem_token})")
		public void insertMember_kakao(MemberVO membervo);
}
