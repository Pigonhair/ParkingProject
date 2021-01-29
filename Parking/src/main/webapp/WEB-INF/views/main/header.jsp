<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.io.PrintWriter"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a4fc31dd472c61220b10d05b1cec480c&libraries=services"></script>
<script src="${path}/resources/js/LoginPopup.js"></script>
<script>
$(document).ready(function() {	
	
	var ctx = '<%=request.getContextPath()%>';
	
	//로그아웃
   $("#logout").click(function(){
	   	//세션 삭제하기
	    <% session.invalidate(); %>
		location.href=ctx+"/project/main.do";
   });	
	
	//내정보 보기
   $("#myinfo").click(function(){
		location.href=ctx+"/member/memberdetail.do";
   });
	
	//로그인 popup창 열기
   $("#loginpopup").click(function(){
      var blur = document.getElementById('blur');
      blur.classList.toggle('active')
      var main_content = document.getElementById('main_content');
      main_content.classList.toggle('main_content')
      var popup = document.getElementById('popup');
      popup.classList.toggle('active')
   });
   
   //로그인 popup창 닫기
   $(".btn_exit").click(function(){
      var blur = document.getElementById('blur');
      blur.classList.toggle('active')
      var main_content = document.getElementById('main_content');
      main_content.classList.toggle('main_content')
      var popup = document.getElementById('popup');
      popup.classList.toggle('active')
   });
});
</script>
<style>
#popup.active{
      visibility: visible;
      opacity:1;
      transition : 0.5s;
}

#popup{
    position: fixed;
     background: #e7e7e7;
/*      border: groove black; */
     left: 25%;
     top: 25%; 
     width: 50%;
     height: 50%;
     z-index: 100;
     visibility: hidden;
     opacity:0;
     transition : 0.5s;
     background: url('https://pexels.imgix.net/photos/27718/pexels-photo-27718.jpg?fit=crop&w=1280&h=823') left no-repeat;
     background-size:cover;
}

.container#blur.active{
   filter: blur(20px);
   pointer-events: none;
   user-select:none;
}
.main_content.main_content{
   filter: blur(20px);
   pointer-events: none;
   user-select:none;
}

@media ( max-width : 1230px) {
   #main_content .fbox {
      padding-right: 0;
      padding-bottom: 30px;
   }
}

@media ( max-width : 1230px) {
   #main_content .fbox dl {
      width: 50%;
   }
}

@media ( max-width : 1230px) {
   #main_content .fbox dl {
      border-bottom: 1px solid #dddddd;
   }
}

@media ( max-width : 1230px) {
   #main_content .btn_reserv {
      float: left;
      width: 49.5%;
   }
}

@media ( max-width : 1230px) {
   #main_content .btn_wrap {
      display: inline-block;
      float: left;
      position: relative;
      width: 100%;
      top: 0;
      right: 0;
      padding: 30px 30px 0;
   }
}
</style>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${path}/resources/css/main.css" />
<link rel="stylesheet" href="${path}/resources/css/mainbackground.css" />
<link rel="stylesheet" href="${path}/resources/css/LoginBtn.css" />
<link rel="stylesheet" href="${path}/resources/css/LoginPopup.css" />
<title>메인 헤더</title>
</head>
<body>
<a class="logo" href="${pageContext.request.contextPath}/project/main.do">홈홈홈</a>

<img alt="logo" src="" onclick="${pageContext.request.contextPath}/project/main.do">

<c:if test="${logOK==0}">     
   <a href="#" class="cta" id="loginpopup">
       <span>로그인</span> 
       <svg width="13px" height="10px" viewBox="0 0 13 10">
    <path d="M1,5 L11,5"></path>
    <polyline points="8 1 12 5 8 9"></polyline>
  </svg>
      </a>
      </div>
      
</c:if>
      
<c:if test="${logOK==1}">
   <a href="#" class="cta" id="logout">
       <span>로그아웃</span> 
    <path d="M1,5 L11,5"></path>
    <polyline points="8 1 12 5 8 9"></polyline>
  </svg>
   </a>
  <a href="#" class="cta" id="myinfo">
       <span>${mem_name}님</span> 
    <path d="M1,5 L11,5"></path>
    <polyline points="8 1 12 5 8 9"></polyline>
  </svg>
   </a>
   </div>
</c:if>

<!-- 로그인 팝업창 -->
   <div id="popup">
     <form action="${pageContext.request.contextPath}/project/login.do" method="post" class="form-container">
       <div class="container2">
  <div class='window'>
    <div class='overlay'></div>
    <div class='content2'>
    <div><button type="button" class='btn_exit'>x</button></div>
      <div class='welcome'>Hello There!</div>
      <div class='subtitle'>We're almost done. Before using our services you need to create an account.</div>
      <div class='input-fields'>
        <input type='text' placeholder='ID' class='input-line full-width' id="mem_id" name = "mem_id"></input>
        <input type='password' placeholder='PASSWORD' class='input-line full-width' id = "mem_pwd" name = "mem_pwd"></input>
      </div>
      
      <div class='spacing'><div class='spacing'>
      <a href="https://kauth.kakao.com/oauth/authorize?client_id=c33ff58fa9f138c4cca66548e9bbb951&redirect_uri=http://localhost:8080/project/kakao/callback&response_type=code">
      <img src="../resources/images/kakaolog.png"></a></div>
      <div><a href="${pageContext.request.contextPath}/project/signUp.do">회원 가입</a></div>
      <div><input type = "submit" class = "login_button" value="로그인"></div>
      <div><button class='ghost-round full-width'>Create Account</button></div>
      </div>
    </div>
    </div>
  </div>
  
     </form>
   </div>

</body>
</html> --%>