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
			+ "VALUES(#{mem_num},#{car_id},#{car_model},#{category})")
	public void insertMember_car(MemberVO vo);
	/************************ Member Register ************************/

	
	/************************ mem_id로 member, member_detail가져오기 ************************/
	@Select("select mem_num,mem_id,mem_auth,mem_token,mem_name,mem_phone,mem_dis from member\r\n" + 
			"left join member_detail using(mem_num) where mem_id=#{mem_id}")
	public MemberVO isMemberID(String mem_id);
	
	/************************ mem_token로 member, member_detail, member_car가져오기 ************************/
	@Select("select a.mem_num\r\n" + 
			"	,a.mem_id\r\n" + 
			"	,a.mem_auth\r\n" + 
			"	,a.mem_token\r\n" + 
			"	,b.mem_name\r\n" + 
			"	,b.mem_phone\r\n" + 
			"	,b.mem_dis\r\n" + 
			"	,c.car_id\r\n" + 
			"	,c.car_model\r\n" + 
			"	,c.category\r\n" + 
			"	from member a\r\n" + 
			"	inner join member_detail b\r\n" + 
			"		on a.mem_num = b.mem_num\r\n" + 
			"	inner join member_car c\r\n" + 
			"		on b.mem_num = c.mem_num\r\n" + 
			"	where mem_token=#{mem_token}")
	public MemberVO getMemberbytoken(String mem_token);
	

}
