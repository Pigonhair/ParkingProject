<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<!--
   Dopetrope by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<script>
function openForm(){
	var blur = document.getElementById('blur');
	blur.classList.toggle('active')
	var main_content = document.getElementById('main_content');
	main_content.classList.toggle('main_content')
	var popup = document.getElementById('popup');
	popup.classList.toggle('active')
}
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
<title>Parking</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${path}/resources/css/main.css" />
<link rel="stylesheet" href="${path}/resources/css/mainbackground.css" />
<link rel="stylesheet" href="${path}/resources/css/LoginBtn.css" />
<link rel="stylesheet" href="${path}/resources/css/LoginPopup.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%-- <script src="${path}/resources/js/anime.js"></script> --%>
<script src="${path}/resources/js/anime.min.js"></script>
<%-- <script src="${path}/resources/js/anime.es.js"></script> --%>
<script src="//code.jquery.com/jquery-3.4.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.2.0/anime.min.js"></script>
<script src="${path}/resources/js/LoginPopup.js"></script>

</head>
<body>
	<div class="container" id="blur">
		<img class="background"
			src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/221808/sky.jpg" />

		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
		<div class="circle-container">
			<div class="circle"></div>
		</div>
	
		<a href="#" onclick="openForm()" class="cta">
		 <span>로그인</span> 
		 <svg width="13px" height="10px" viewBox="0 0 13 10">
    <path d="M1,5 L11,5"></path>
    <polyline points="8 1 12 5 8 9"></polyline>
  </svg>
		</a>
	</div>
		
		
	<div id="main_content">
		<form id="resveForm" name="resveForm" class="needs-validation"
			novalidate="novalidate">
			<fieldset>
				<legend>예약하기 정보 입력폼</legend>
				<div class="fbox">
					<dl>
						<dt>시간 선택</dt>
						<dd class="select_wrap">
							<select title="Airport" id="airportCode" name="airportCode">
								<option value="" selected="selected">공항선택</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">00:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">00:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">00:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">00:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">00:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">00:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">01:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">01:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">01:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">01:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">01:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">01:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">02:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">02:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">02:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">02:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">02:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">02:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">03:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">03:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">03:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">03:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">03:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">03:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">04:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">04:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">04:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">04:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">04:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">04:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">05:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">05:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">05:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">05:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">05:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">05:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">06:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">06:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">06:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">06:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">06:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">06:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">07:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">07:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">07:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">07:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">07:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">07:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">08:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">08:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">08:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">08:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">08:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">08:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">09:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">09:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">09:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">09:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">09:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">09:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">10:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">10:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">10:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">10:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">10:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">10:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">11:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">11:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">11:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">11:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">11:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">11:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">12:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">12:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">12:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">12:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">12:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">12:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">13:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">13:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">13:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">13:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">13:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">13:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">14:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">14:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">14:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">14:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">14:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">14:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">15:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">15:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">15:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">15:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">15:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">15:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">16:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">16:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">16:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">16:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">16:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">16:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">17:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">17:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">17:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">17:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">17:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">17:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">18:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">18:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">18:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">18:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">18:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">18:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">19:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">19:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">19:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">19:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">19:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">19:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">20:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">20:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">20:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">20:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">20:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">20:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">21:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">21:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">21:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">21:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">21:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">21:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">22:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">22:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">22:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">22:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">22:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">22:50</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">23:00</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">23:10</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">23:20</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">23:30</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">23:40</option>
								<option value="1" ilotareaname="국내선 제1주차장" ilotarea="1"
									resveclosminde="0" resveclosmaxde="45" mxmmresveposblde="30">23:50</option>

							</select>
						</dd>
					</dl>
					<dl>
						<dt>예약 입차일시</dt>
						<dd class="cal_wrap main">
							<input type="text" id="entvhclResveDate" name="entvhclResveDt"
								placeholder="Entry date" readonly="readonly">
						</dd>
					</dl>
					<dl>
						<dt>예약 출차일시</dt>
						<dd class="cal_wrap main">
							<input type="text" id="lvvhclResveDate" name="lvvhclResveDt"
								placeholder="Exit date" readonly="readonly">
						</dd>
					</dl>
					<dl>
						<dt>차량 선택</dt>
						<dd class="select_wrap">
							<select title="Division" id="parkngAr" name="parkngAr">
								<option value="GNRL" selected="selected">일반</option>
								<option value="DSPSN">장애인</option>
							</select>
						</dd>
					</dl>
					<p class="btn_wrap">
						<button type="button" id="btnReserve" class="btn_reserv">예약하기</button>
					</p>
				</div>
			</fieldset>
			<div id="resve_able_info" class="fc_wine"
				style="padding-left: 20px; padding-top: 10px;"></div>
			<div id="resve_able_info2"
				style="padding-left: 20px; padding-top: 0px;"></div>
			<input type="hidden" id="iLotArea" name="iLotArea">
			<a href="https://kauth.kakao.com/oauth/authorize?client_id=c33ff58fa9f138c4cca66548e9bbb951&redirect_uri=http://localhost:8080/project/kakao/callback&response_type=code"> 
<img src="/image/kakaologin.png"></a>
		</form>
	</div>
	<!-- 비로그인 상태 : 회원가입,로그인 활성화 -->
	<c:if test="${empty user}">
		<a href="${pageContext.request.contextPath}/project/mapTest.do">맵띄우기
			연습</a>
	</c:if>
	<c:if test="${empty user}">
		<a href="https://kauth.kakao.com/oauth/authorize?client_id=c33ff58fa9f138c4cca66548e9bbb951&redirect_uri=http://localhost:8080/project/kakao/callback&response_type=code"> 
			개같은 카카오 연습</a>
	</c:if>
	
	
	<!-- 로그인 팝업창 -->
	<div id="popup">
	  <form action="/action_page.php" class="form-container">
	    <div class="container2">
  <div class='window'>
    <div class='overlay'></div>
    <div class='content2'>
      <div class='welcome'>Hello There!</div>
      <div class='subtitle'>We're almost done. Before using our services you need to create an account.</div>
      <div class='input-fields'>
        <input type='text' placeholder='Username' class='input-line full-width'></input>
        <input type='email' placeholder='Email' class='input-line full-width'></input>
        <input type='password' placeholder='Password' class='input-line full-width'></input>

      </div>
      <div class='spacing'>or continue with <span class='highlight'>Facebook</span></div>
      <div><button class='ghost-round full-width'>Create Account</button></div>
    </div>
  </div>
</div>
	  </form>
	</div>
</body>

</html>
