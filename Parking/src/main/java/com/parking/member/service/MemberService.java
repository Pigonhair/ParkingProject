package com.parking.member.service;

import java.util.Map;

import com.parking.member.vo.MemberVO;



public interface MemberService {
	/*
	 * 회원가입 관련 사이클 묶기
	 * selectMem_num(); ->시퀀스에서 회원번호 불러오기
	 * insertMember(MemberVO membervo); -> 멤버테이블에 넣기
	 * insertMember_detail(MemberVO membervo); -> 회원 상세정보 넣기
	 */
		
	// 회원가입 정보 넣기
	public void insertMember(MemberVO vo);

	// 가입되어있는 아이디인지 확인하기
	public MemberVO isMemberID(String mem_id);

	//************************ mem_token로 member, member_detail, member_car가져오기 ************************//
	public MemberVO getMemberbytoken(String mem_token);

	//멤버 정보 업데이트하기
	public void updateMember(MemberVO vo);

	

}
