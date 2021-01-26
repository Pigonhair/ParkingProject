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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a4fc31dd472c61220b10d05b1cec480c&libraries=services"></script>
<script src="${path}/resources/js/LoginPopup.js"></script>
<script>
$(document).ready(function() {
   $(".cta").click(function(){
      var blur = document.getElementById('blur');
      blur.classList.toggle('active')
      var main_content = document.getElementById('main_content');
      main_content.classList.toggle('main_content')
      var popup = document.getElementById('popup');
      popup.classList.toggle('active')
   });
   
   $(".btn_exit").click(function(){
      var blur = document.getElementById('blur');
      blur.classList.toggle('active')
      var main_content = document.getElementById('main_content');
      main_content.classList.toggle('main_content')
      var popup = document.getElementById('popup');
      popup.classList.toggle('active')
   });
   
   $("#btnAddress").click(function(){
      new daum.Postcode({
          oncomplete: function(data) {
              var addr = data.address; // 최종 주소 변수

              // 주소 정보를 해당 필드에 넣는다.
              document.getElementById("btnAddress").value = addr;
              // 주소로 상세 정보를 검색
              geocoder.addressSearch(data.address, function(results, status) {
                  // 정상적으로 검색이 완료됐으면
                  if (status === daum.maps.services.Status.OK) {

                      var result = results[0]; //첫번째 결과의 값을 활용

                      // 해당 주소에 대한 좌표를 받아서
                      var coords = new daum.maps.LatLng(result.y, result.x);
                      // 지도를 보여준다.
                      mapContainer.style.display = "block";
                      map.relayout();
                      // 지도 중심을 변경한다.
                      map.setCenter(coords);
                      // 마커를 결과값으로 받은 위치로 옮긴다.
                      marker.setPosition(coords)
                  }
              });
          }
      }).open();
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
<title>Parking</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${path}/resources/css/main.css" />
<link rel="stylesheet" href="${path}/resources/css/mainbackground.css" />
<link rel="stylesheet" href="${path}/resources/css/LoginBtn.css" />
<link rel="stylesheet" href="${path}/resources/css/LoginPopup.css" />

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
      
  <form action="${pageContext.request.contextPath}/project/search.do" method=post> 
   <div id="main_content">
<!--       <form id="resveForm" name="resveForm" class="needs-validation" -->
<!--          novalidate="novalidate"> -->
         <fieldset>
            <legend>예약하기 정보 입력폼</legend>
            <div class="fbox">
               <dl>
                  <dt>차량 선택</dt>
                  <dd class="select_wrap">
                     <select title="Division" id="parkngAr" name="parkngAr">
                        <option value="GNRL" selected="selected">일반</option>
                        <option value="DSPSN">장애인</option>
                     </select>
                  </dd>
               </dl>
               <dl>
                  <dt>목적지</dt>
                  <dd class="cal_wrap main">
                     <input type="text" id="btnAddress" name="btnAddress">
                  </dd>
               </dl>
               <p class="btn_wrap">
                  <input type="submit" id="btnReserve" class="btn_reserv" value="찾 기"></input>
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
    <div><button type="button" class='btn_exit'>x</button></div>
      <div class='welcome'>Hello There!</div>
      <div class='subtitle'>We're almost done. Before using our services you need to create an account.</div>
      <div class='input-fields'>
        <input type='text' placeholder='Username' class='input-line full-width'></input>
        <input type='email' placeholder='Email' class='input-line full-width'></input>
        <input type='password' placeholder='Password' class='input-line full-width'></input>

      </div>
      <div class='spacing'><div class='spacing'>
      <a href="https://kauth.kakao.com/oauth/authorize?client_id=c33ff58fa9f138c4cca66548e9bbb951&redirect_uri=http://localhost:8080/project/kakao/callback&response_type=code">
      <img src="../resources/images/kakaolog.png"></a></div>
      <div><button class='ghost-round full-width'>Create Account</button></div>
    </div>
  </div>
</div>
     </form>
   </div>
</body>

</html>