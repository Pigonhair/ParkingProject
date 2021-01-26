<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String parkngAr = request.getParameter("parkngAr");
String btnAddress = request.getParameter("btnAddress");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Kakao 지도 시작하기</title>
</head>
<body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c59597a942774a145bf6ea568ac28488&libraries=services,clusterer,drawing"></script>
<style>
#sub_visual {
    height: 126px;
    background-size: cover;
}
.scroll_box {
    overflow-y: scroll;
    height: 125px;
    padding: 20px;
    border: 1px solid #d8d8da;
    color: #666666;
}
html, body{
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
  font-family: 'Open Sans', sans-serif;
}

h1, h2, h3, h4, h5 ,h6{
  font-weight: 200;
}

a{
  text-decoration: none;
}

p, li, a{
  font-size: 14px;
}

fieldset{
  margin: 0;
  padding: 0;
  border: none;
}

/* GRID */

.twelve { width: 100%; }
.eleven { width: 91.53%; }
.ten { width: 83.06%; }
.nine { width: 74.6%; }
.eight { width: 66.13%; }
.seven { width: 57.66%; }
.six { width: 49.2%; }
.five { width: 40.73%; }
.four { width: 32.26%; }
.three { width: 23.8%; }
.two { width: 15.33%; }
.one { width: 6.866%; }

/* COLUMNS */

.col {
	display: block;
	float:left;
	margin: 0 0 0 1.6%;
}

.col:first-of-type {
  margin-left: 0;
}

#sub_content {
    max-width: 1240px;
    min-height: 500px;
    margin: 0 auto 65px;
    padding: 50px;
    border: 1px solid #dddddd;
    background: #fff;
}

.information_sub_container{
  width: 100%;
  max-width: 1000px;
  margin: 0 auto;
  position: relative;
  height: 500px;
}
#map_content{
  width: 100%;
  max-width: 1000px;
  margin: 0 auto;
  position: relative;
  height: 500px;
  overflow:hidden;
}
.radius_border{border:1px solid #919191;border-radius:5px;}     
.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
.custom_typecontrol .selected_btn:hover {color:#fff;}   
.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}
     
.information_container{
  width: 100%;
  max-width: 1000px;
  margin: 0 auto;
  position: relative;
  height: 500px;
}
.row{
  padding: 20px 0;
}

/* CLEARFIX */

.cf:before,
.cf:after {
    content: " ";
    display: table;
}

.cf:after {
    clear: both;
}

.cf {
    *zoom: 1;
}

.wrapper{
  width: 100%;
  margin: 30px 0;
}

/* STEPS */

.steps{
  list-style-type: none;
  margin: 0;
  padding: 0;
  background-color: #fff;
  text-align: center;
}


.steps li{
  display: inline-block;
  margin: 20px;
  color: #ccc;
  padding-bottom: 5px;
}

.steps li.is-active{
  border-bottom: 1px solid #3498db;
  color: #3498db;
}

/* FORM */

.form-wrapper .section{
  padding: 0px 20px 30px 20px;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  background-color: #fff;
  opacity: 0;
  -webkit-transform: scale(1, 0);
  -ms-transform: scale(1, 0);
  -o-transform: scale(1, 0);
  transform: scale(1, 0);
  -webkit-transform-origin: top center;
  -moz-transform-origin: top center;
  -ms-transform-origin: top center;
  -o-transform-origin: top center;
  transform-origin: top center;
  -webkit-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  text-align: center;
  position: absolute;
  width: 100%;
  min-height: 300px
}

.form-wrapper .section h3{
  margin-bottom: 30px;
}

.form-wrapper .section.is-active{
  opacity: 1;
  -webkit-transform: scale(1, 1);
  -ms-transform: scale(1, 1);
  -o-transform: scale(1, 1);
  transform: scale(1, 1);
}

.form-wrapper .button, .form-wrapper .submit{
  background-color: #3498db;
  display: inline-block;
  padding: 8px 30px;
  color: #fff;
  cursor: pointer;
  font-size: 14px !important;
  font-family: 'Open Sans', sans-serif !important;
  position: absolute;
  right: 20px;
  bottom: 20px;
}

.form-wrapper .submit{
  border: none;
  outline: none;
  -webkit-box-sizing: content-box;
  -moz-box-sizing: content-box;
  box-sizing: content-box;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}

.form-wrapper input[type="text"],
.form-wrapper input[type="password"]{
  display: block;
  padding: 10px;
  margin: 10px auto;
  background-color: #f1f1f1;
  border: none;
  width: 50%;
  outline: none;
  font-size: 14px !important;
  font-family: 'Open Sans', sans-serif !important;
}

.form-wrapper input[type="radio"]{
  display: none;
}

.form-wrapper input[type="radio"] + label{
  display: block;
  border: 1px solid #ccc;
  width: 100%;
  max-width: 100%;
  padding: 10px;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  cursor: pointer;
  position: relative;
}

.form-wrapper input[type="radio"] + label:before{
  content: "✔";
  position: absolute;
  right: -10px;
  top: -10px;
  width: 30px;
  height: 30px;
  line-height: 30px;
  border-radius: 100%;
  background-color: #3498db;
  color: #fff;
  display: none;
}

.form-wrapper input[type="radio"]:checked + label:before{
  display: block;
}

.form-wrapper input[type="radio"] + label h4{
  margin: 15px;
  color: #ccc;
}

.form-wrapper input[type="radio"]:checked + label{
  border: 1px solid #3498db;
}

.form-wrapper input[type="radio"]:checked + label h4{
  color: #3498db;
}

</style>
<div id="wrap">
<header id="header"><h1><span>주차장 예약</span></h1></header>
<main id="main_container">
<div id="sub_content">
	<div id="map_content">
		<div id="map" style="width:1000px;height:500px;position:relative;overflow:hidden;"></div>  
	    <!-- 지도타입 컨트롤 div 입니다 -->
	    <div class="custom_typecontrol radius_border">
	        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
	        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
	    </div>
	    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
	    <div class="custom_zoomcontrol radius_border"> 
	        <span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
	        <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
	    </div>
	</div>
  <div class="information_container">
    <div class="information_sub_container">
    <div class="wrapper">
      <form class="form-wrapper">
			<c:forEach var="parking" items="${list}">
				${parking.park_id}
				${parking.park_name}
				${parking.park_capacity}
				${parking.mem_num}
				${parking.park_type}
				${parking.detailAddr}
				${parking.park_public}
				<br>
			</c:forEach>
		
      </form>
    </div>
  </div>
  </div>
  <h3 class="stitle01">주차예약 이용안내</h3>
  <div class="scroll_box">
						[예약 기본정보]<br>
						(예약 기간) 최소 2시간부터 최장 1개월까지 예약이 가능합니다.<br>
						(예약 대기) 예약신청 일자 중 예약이 불가한 일정이 있을 경우 예약대기가 가능하며, 예약 가능 시 자동 예약 후 예약확정 안내가 휴대폰 문자 및 이메일로 통보됩니다.<br>
						(예약 안내) 예약 시 예약일정 및 예약정보를 포함한 안내사항은 휴대폰 문자 및 이메일로 통보됩니다.<br>
						(예약 변경) 입차 후에도 예약출차시간 변경이 가능하며, 예약 변경은 최대 2회 가능합니다.<br>
						(예약 취소) 예약 입차시간 이후 2시간까지 예약 취소가 가능하며, 이에 따른 페널티 부과는 없습니다.<br>
						(페널티) 최근 1년간 예약부도 2회 이상 시 예약 출차일로부터 3개월간 주차 예약 서비스의 이용이 불가합니다.<br>
						
							
							
								(예약문의) 예약관련 문의는 1661-2626 또는 051-974-3718로 가능합니다.<br>
							
							
							
						
						<br>
						[예약 입출차]<br>
						(입차 시간) 예약 입차 시간 2시간 전부터 입차 가능합니다.<br>
						(지연 입차) 예약 입차 시간 이후 2시간까지 지연입차가 가능하며, 출차 시 실제 입차 시간을 기준으로 주차요금이 부과됩니다.<br>
						(예약부도) 예약 입차 시간 이후 2시간 내 미입차시, 예약은 자동 취소되며 예약부도(No-Show) 처리됩니다.<br>
						<br>
						[예약주차장 이용]<br>
						
							
							
							
								(주차장 위치) 예약주차장은 P2 국제선 주차빌딩 3,4층입니다.<br>
							
							
							
						
						
						
						(주차요금) 주차요금은 예약 입출차시간이 아닌 실제 입출차 시간을 기준으로 부과됩니다.<br>
						(할인적용) 저공해차량, 장애인, 국가유공상이자, 다자녀가정, 경차 할인은 출차(유인, 무인) 정산 시 적용(자세한 할인내용은 주차장 운영관리 예규 참조)<br>
						
							
							
							
								(이용 불가 차량) 미니버스, 화물차 등 대형차량 및 2.3m 이상의 차량은 입차가 불가능함에 따라 예약이 제한됩니다.<br>
								(입차방법) 예약 후 P2 국제선 주차빌딩 3층 예약존(Zone)입구에서 차량번호 확인 후 입차<br>
							
							
							
						
						(출차방법) 예약존(Zone) 출구를 지나 무인정산기 또는 출구 정산소를 이용하여 요금정산 후 출차
					</div>
					<div class="agree_chk">
						<input type="checkbox" id="agree1" name="agree1" value="Y" aria-required="true">
						<label for="agree1">주차예약 이용안내 모든 내용을 읽고 동의합니다.</label>
					</div>
					<div style="margin-bottom:10px"><br></div>
					<h3 class="stitle01">개인정보처리방침 <button id="btnPrivacy" class="btn" style="height:35px;margin:2px;line-height:29px;font-size:16px;">개인정보처리방침</button></h3>
					<div class="agree_chk">
						<input type="checkbox" id="agree2" name="agree2" value="Y" aria-required="true">
						<label for="agree2">개인정보처리방침 모든 내용을 읽고 동의합니다.</label>
						
					<div class="btn_area">
						<button id="btnNext" class="btn wine">예약하기</button>
					</div>
		</div>
	</div>
</main>
</div>
</body>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

//내 위치,이름 설정
var dest_name = '목적지';
var dest_position = '<%=btnAddress%>';

//주차장 map만들기
var parking_position_Map = new Map()

//DB에서 받아온 주차장 이름 및 위치 넣기
<c:forEach var="parking" items="${list}">
var parkinglot_name = '${parking.park_name}';
var parkinglot_addr = '${parking.detailAddr}';
//map에 주차장 key,value 넣기
parking_position_Map.set(parkinglot_name, parkinglot_addr);
</c:forEach>

var dest_position_Map = new Map()
//목적지map에 key,value 넣기
dest_position_Map.set(dest_name, dest_position)

console.log(parking_position_Map)
console.log(dest_position_Map)

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
function setMapType(maptype) { 
    var roadmapControl = document.getElementById('btnRoadmap');
    var skyviewControl = document.getElementById('btnSkyview'); 
    if (maptype === 'roadmap') {
        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
        roadmapControl.className = 'selected_btn';
        skyviewControl.className = 'btn';
    } else {
        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'btn';
    }
}

// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}

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


//지도위에 parking poisition marker만들기
for(let item of parking_position_Map){
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(item[1], function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });


	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+item[0]+'</div>'
	        });
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        infowindow.open(map, marker);
	    } 
	});
}

//지도위에 목적지 marker만들고 거기로 이동하기
for(let item of dest_position_Map){
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(item[1], function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });


	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+item[0]+'</div>'
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
}
</script>
</html>