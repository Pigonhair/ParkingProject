package com.parking.kakao.controller;




import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.parking.kakao.model.KakaoProfile;
import com.parking.kakao.model.OAuthToken;
import com.parking.main.controller.MainController;
import com.parking.member.controller.MemberController;
import com.parking.member.vo.MemberVO;


@Controller
public class KakaoController {
	
	
//	@RequestMapping("/project/signUp.do")
//	public String getMain(Locale locale, Model model) {
//		
//		return "main/main";
//	}
//	@RequestMapping("/kakao/callback")
	@GetMapping("/kakao/callback")
	public ModelAndView kakaoCallback(String code) {

//		 http요청을 편하게 할수 있는 RestTemplate
//       Post 방식으로 key=value 테이터를 요청 (카카오쪽으로) 밑에 rt 라이브러리
		RestTemplate rt = new RestTemplate();

		// HTTPHeader 오브잭트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "c33ff58fa9f138c4cca66548e9bbb951");
		params.add("redirect_uri", "http://localhost:8080/project/kakao/callback");
		params.add("code", code);
		
//		 HttpHeader와 HttpBody를 하나의 오브젝트에 담기 밑 response에 넣기위해
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<MultiValueMap<String, String>>(
				params, headers);

//		 Http 요청하기 - Post 방식으로 - 그리고 response 변수의 응답 받음
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,	
				kakaoTokenRequest, 
				String.class);
//		// Gson, ObjectMapper
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonParseException  e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("카카오톡 엑서스 토큰 : " + oauthToken.getAccess_token());
		
		
		RestTemplate rt2 = new RestTemplate();

		// HTTPHeader 오브잭트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		
		
//		 HttpHeader와 HttpBody를 하나의 오브젝트에 담기 밑 response에 넣기위해
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = new HttpEntity<MultiValueMap<String, String>>(
				params, headers2);

//		 Http 요청하기 - Post 방식으로 - 그리고 response 변수의 응답 받음
		ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,	
				kakaoProfileRequest, 
				String.class);
		
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProflie = null;
		try {
			kakaoProflie = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonParseException  e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// User 오브젝트 : 
		System.out.println("카카오 아이디(번호) : " + kakaoProflie.getId()); // member id
		System.out.println("카카오 이메일 : " + kakaoProflie.getKakao_account().getEmail());
		System.out.println("카카오 닉네임(name) : " + kakaoProflie.getProperties().getNickname());
		// 토큰값 
		MemberVO vo = new MemberVO();
		vo.setMem_id(kakaoProflie.getKakao_account().getEmail());
		System.out.println("카카오 vo 값 전달(Id) : " + vo.getMem_id());
		vo.setMem_token(oauthToken.getAccess_token());
		System.out.println("카카오 vo 값 전달(Token) : " + oauthToken.getAccess_token());
		vo.setName(kakaoProflie.getProperties().getNickname());
		System.out.println("카카오 vo 값 전달(name) : " + kakaoProflie.getProperties().getNickname());
		
//		MemberController mc = new MemberController();
//		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("member/signUp.do");
		
		/* return "member/SignUp.jsp"; */
		
		/* response.sendRedirect(request.getContextPath()+"/project/main.do"); */
		
//		HttpSession session=.getSession();
//		session.setAttribute("logOK", entity);
//		session.setAttribute("sessionID", id);
//		return "login/loginOK.jsp"; 
//	
		 ModelAndView mav = new ModelAndView();
		 mav.addObject("id",vo.getMem_id());
		 mav.addObject("name",vo.getName());
		 mav.addObject("token",vo.getMem_token());
//		 mav.setViewName("redirect:/project/signUp.do");
		 mav.setViewName("/member/SignUp");
		return mav;
		// MemberController.java -> signUp.do를 호출 해서 리턴
		
	}

}