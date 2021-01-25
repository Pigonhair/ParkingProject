<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/Search.css" />
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<meta charset="utf-8" />
<title>Kakao 지도 시작하기</title>
</head>
<body>
<div class= "container2" style="width:100%; overflow: hidden; position:relative" >
<div id="map" style="width: 1000px; height: 500px; margin:0 auto;"></div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c59597a942774a145bf6ea568ac28488&libraries=services,clusterer,drawing"></script>

  <div class="container">
    <div class="wrapper">
      <ul class="steps">
        <li class="is-active">Step 1</li>
        <li>Step 2</li>
        <li>Step 3</li>
      </ul>
      <form class="form-wrapper">
        <fieldset class="section is-active">
          <h3>Your Details</h3>
          <input type="text" name="name" id="name" placeholder="Name">
          <input type="text" name="email" id="email" placeholder="Email">
          <input type="text" name="" id="email" placeholder="Email">
          <input type="text" name="email" id="email" placeholder="Email">
          <div class="button">Next</div><br>
        </fieldset>
        <fieldset class="section">
          <h3>Account Type</h3>
          <div class="row cf">
            <div class="four col">
              <input type="radio" name="r1" id="r1" checked>
              <label for="r1">
                <h4>Designer</h4>
              </label>
            </div>
            <div class="four col">
              <input type="radio" name="r1" id="r2"><label for="r2">
                <h4>Developer</h4>
              </label>
            </div>
            <div class="four col">
              <input type="radio" name="r1" id="r3"><label for="r3">
                <h4>Project Manager</h4>
              </label>
            </div>
          </div>
          <div class="button">Next</div>
        </fieldset>
        <fieldset class="section">
          <h3>Choose a Password</h3>
          <input type="password" name="password" id="password" placeholder="Password">
          <input type="password" name="password2" id="password2" placeholder="Re-enter Password">
          <input class="submit button" type="submit" value="Sign Up">
        </fieldset>
        <fieldset class="section">
          <h3>Account Created!</h3>
          <p>Your account has now been created.</p>
          <div class="button">Reset Form</div>
        </fieldset>
      </form>
    </div>
  </div>

<div class="scroll_box">
						[예약 기본정보]<br>
						(예약 기간) 최소 2시간부터 최장 1개월까지 예약이 가능합니다.<br>
						(예약 대기) 예약신청 일자 중 예약이 불가한 일정이 있을 경우 예약대기가 가능하며, 예약 가능 시 자동 예약 후 예약확정 안내가 휴대폰 문자 및 이메일로 통보됩니다.<br>
						(예약 안내) 예약 시 예약일정 및 예약정보를 포함한 안내사항은 휴대폰 문자 및 이메일로 통보됩니다.<br>
						(예약 변경) 입차 후에도 예약출차시간 변경이 가능하며, 예약 변경은 최대 2회 가능합니다.<br>
						(예약 취소) 예약 입차시간 이후 2시간까지 예약 취소가 가능하며, 이에 따른 페널티 부과는 없습니다.<br>
						(페널티) 최근 1년간 예약부도 2회 이상 시 예약 출차일로부터 3개월간 주차 예약 서비스의 이용이 불가합니다.<br>
						
							
								(예약문의) 예약관련 문의는 1661-2626 또는 02-2660-2515로 가능합니다.<br>
							
							
							
							
						
						<br>
						[예약 입출차]<br>
						(입차 시간) 예약 입차 시간 2시간 전부터 입차 가능합니다.<br>
						(지연 입차) 예약 입차 시간 이후 2시간까지 지연입차가 가능하며, 출차 시 실제 입차 시간을 기준으로 주차요금이 부과됩니다.<br>
						(예약부도) 예약 입차 시간 이후 2시간 내 미입차시, 예약은 자동 취소되며 예약부도(No-Show) 처리됩니다.<br>
						<br>
						[예약주차장 이용]<br>
						
							
								(주차장 위치) 예약 주차장은 국내선 제1주차장입니다.<br>
							
							
							
							
							
						
						
							(장애인 차량이용) 장애인 차량을 위한 주차면이 별도로 마련되어 있습니다. (엘리베이터 및 에스컬레이터 없음)<br>
						
						
						(주차요금) 주차요금은 예약 입출차시간이 아닌 실제 입출차 시간을 기준으로 부과됩니다.<br>
						(할인적용) 저공해차량, 장애인, 국가유공상이자, 다자녀가정, 경차 할인은 출차(유인, 무인) 정산 시 적용(자세한 할인내용은 주차장 운영관리 예규 참조)<br>
						
							
								(이용 불가 차량) 미니버스, 화물차 등 대형차량은 입차가 불가능함에 따라 예약이 제한됩니다.<br>
								(입차방법) 예약 후 제1주차장 예약주차입구에서 차량번호 확인 후 입차<br>
							
							
							
							
							
						
						(출차방법) 예약존(Zone) 출구를 지나 무인정산기 또는 출구 정산소를 이용하여 요금정산 후 출차
					</div>

<% 
//여긴 jsp 문법
request.setCharacterEncoding("UTF-8"); //받아올 데이터의 인코딩
String address = request.getParameter("btnAddress"); //넘겨오는 데이터중에 btnAddress속성을 가져옴
%>

<%
out.print("주소는  " + address);
%>

	

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

//내 위치,이름 설정
var myposition_name = '내위치';
var myposition = '<%= address %>';

//주차장 이름,위치 설정
var parkinglot1_name = '주차장1';
var parkinglot1 = '';

//positionMap만들기 key(이름),value(위치)
var positionMap = new Map()
positionMap.set(parkinglot1_name, parkinglot1)
positionMap.set(myposition_name, myposition)
console.log(positionMap)

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// ****************************지도위에 Toolbar****************************************
// 도형 스타일을 변수로 설정합니다
var strokeColor = '#39f',
   fillColor = '#cce6ff',
   fillOpacity = 0.5,
   hintStrokeStyle = 'dash';

var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
    map: map, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
    drawingMode: [
        kakao.maps.Drawing.OverlayType.MARKER
    ]


};

// 위에 작성한 옵션으로 Drawing Manager를 생성합니다
var manager = new kakao.maps.Drawing.DrawingManager(options);

// Toolbox를 생성합니다. 
// Toolbox 생성 시 위에서 생성한 DrawingManager 객체를 설정합니다.
// DrawingManager 객체를 꼭 설정해야만 그리기 모드와 매니저의 상태를 툴박스에 설정할 수 있습니다.
var toolbox = new kakao.maps.Drawing.Toolbox({drawingManager: manager});

// 지도 위에 Toolbox를 표시합니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOP은 위 가운데를 의미합니다.
map.addControl(toolbox.getElement(), kakao.maps.ControlPosition.TOP);
// ****************************지도위에 Toolbar****************************************

for(var [key, value] of positionMap){
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(value, function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });


	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+key+'</div>'
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
}
</script>
</body>
</html>