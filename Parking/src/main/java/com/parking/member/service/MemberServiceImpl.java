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
	public void insertMember_detail(MemberVO membervo) {
		//3개 전부 성공해야지 커밋, 아님 rollback
//		//시퀀스에서 mem_num 받아온것을 mem_num에 넣기
//		membervo.setMem_num(memberMapper.selectMem_num());
//		System.out.println("selectMem_num()의 결과 : " + membervo.getMem_num());
//		//member 테이블에 회원정보 넣기
//		memberMapper.insertMember(membervo);
//		System.out.println("insertMember 메서드 실행 성공");
//		//member_detail 테이블에 회원정보 넣기
//		memberMapper.insertMember_detail(membervo);
//		System.out.println("insertMember_detail() 메서드 실행 성공");
	}
	
	
	
	
	//로그인처리 및 아이디 중복확인 시 사용할 메서드
	@Override
	public MemberVO login(String mem_id) {
		return memberMapper.login(mem_id);
	}




	@Override
	public void insertMember(MemberVO vo) {
		System.out.println("**********impl 들어옴******");
		vo.setMem_num(memberMapper.selectMem_num());// 시퀀스 적용하고
		System.out.println("InsertMEmber : vo.getNUM : " + vo.getMem_num());
		
		memberMapper.insertMember(vo); // member테이블 저장
		System.out.println("InsertMEmber :  vo.getToken()" + vo.getMem_token());
		
		memberMapper.insertMember_detail(vo); // 일반회원 테이블에 저장
		System.out.println("InsertMEmber :  vo.getToken()" + vo.getMem_token());
		memberMapper.insertMember_car(vo);//
		System.out.println("InsertMEmber :  vo.getToken()" + vo.getMem_token());
		
		
	}




	


	
	
		
}
