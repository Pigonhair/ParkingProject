package com.parking.member.service;

import java.security.MessageDigest;
import java.util.Map;
import java.util.Random;

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
		MemberVO v =memberMapper.isMemberID(mem_id);
		return v;
	}

	//mem_token로 memverVo가져오기
	@Override
	public MemberVO getMemberbytoken(String mem_token) {
		return memberMapper.getMemberbytoken(mem_token);
	}
	
	//멤버 정보 업데이트하기
	@Override
	public void updateMember(MemberVO vo) {
		memberMapper.updateMember(vo);
		System.out.println("회원정보 업데이트 완료");
		memberMapper.updateMember_detail(vo);
		System.out.println("member_detail 업데이트 완료");
		memberMapper.updateMember_car(vo);
		System.out.println("member_car 업데이트 완료");
	}



	//로그인
	@Override
	public MemberVO login(MemberVO vo) {
		System.out.println(vo.getMem_id() + " ///////" + vo.getMem_pwd());
/*		MemberVO v =memberMapper.login(mem_id,mem_pwd);*/
		/*System.out.println("로그이이이이이인 : " + v);*/
		MemberVO v =memberMapper.login(vo);
		if (v != null) {
			String token = vo.getMem_id()+System.currentTimeMillis()+new Random().nextInt(100); 
			token = testSHA256(token);
			System.out.println("또끈 생쉉 : " + token);
		}
		return v;
	}
	//토큰 생성
	public String testSHA256(String pwd) {
		try{

			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(pwd.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();

			for (int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if(hex.length() == 1) hexString.append('0');
				hexString.append(hex);
			}
			//출력
			return hexString.toString();
			
		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
	}
	
//	@Override
//	public void loginid(MemberVO vo) {
//		String mem_phone = vo.getMem_phone();
//		vo=memberMapper.isMemberID(vo.getMem_id());
//		String db_mem_phone = memberMapper.check(mem_phone).getMem_phone();
//		System.out.println("impl 아이디 : " + vo.getMem_id());
//	}
	
}
