package com.parking.member.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.parking.member.dao.MemberMapper;
import com.parking.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Resource
	private MemberMapper memberMapper;
	
	//회원가입하는 메서드
	@Override
	public void insertMember(MemberVO vo) {
		System.out.println("**********impl 들어옴********");
		vo.setMem_num(memberMapper.selectMem_num());// 시퀀스 적용하기
		System.out.println("InsertMEmber : vo.getNUM : " + vo.getMem_num());
		memberMapper.insertMember(vo); // member테이블 저장
		System.out.println("InsertMEmber :  vo.getToken()" + vo.getMem_token());
		memberMapper.insertMember_detail(vo); // 일반회원 테이블에 저장
		System.out.println("InsertMEmber :  vo.getToken()" + vo.getMem_token());
		memberMapper.insertMember_car(vo);//
		System.out.println("InsertMEmber :  vo.getToken()" + vo.getMem_token());
		
	}
	
	//mem_id로 memverVo가져오기
	@Override
	public MemberVO isMemberID(String mem_id) {
		return memberMapper.isMemberID(mem_id);
	}

	//mem_token로 memverVo가져오기
	@Override
	public MemberVO getMemberbytoken(String mem_token) {
		return memberMapper.getMemberbytoken(mem_token);
	}
	
}
