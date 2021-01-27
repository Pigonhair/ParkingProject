package com.parking.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.parking.member.vo.MemberVO;


public interface MemberMapper {

	
	
	/************************ Member Register ************************/
	// 멤버 mem_num 시퀀스 적용하기 
	@Select("SELECT mem_num.nextval FROM dual")
	public int selectMem_num();
	
	//member테이블에 member 정보 입력
	@Insert("INSERT INTO MEMBER (mem_num,mem_id, mem_auth, mem_token)"
			+ "VALUES (#{mem_num},#{mem_id},#{mem_auth},#{mem_token})")
	public void insertMember(MemberVO vo);	
	
	//member_detail 테이블에 추가 입력
	@Insert("INSERT INTO member_detail(mem_num,mem_name,mem_phone,mem_dis)"
			+ "VALUES(#{mem_num},#{mem_name},#{mem_phone},#{mem_dis})")
	public void insertMember_detail(MemberVO vo);
	
	@Insert("INSERT INTO member_car(mem_num,car_id,car_model,category)"
			+ "VALUES(#{mem_num},#{carid},#{carmodel},#{category})")
	public void insertMember_car(MemberVO vo);
	/************************ Member Register ************************/

	
	/************************ 회원가입 되어있는지 확인 ************************/
	@Select("SELECT * FROM MEMBER WHERE MEM_id=#{mem_id}")
	public MemberVO isMemberID(String mem_id);
	/************************ 회원가입 되어있는지 확인 ************************/
	

}
