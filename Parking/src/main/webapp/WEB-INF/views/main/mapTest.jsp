<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Kakao 지도 시작하기</title>
</head>
<body>
	<div id="map" style="width: 400px; height: 350px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c59597a942774a145bf6ea568ac28488&libraries=services,clusterer,drawing"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

//내 위치,이름 설정
var myposition_name = '내위치';
var myposition = '경기도 평택시 지장로 28';

//주차장 이름,위치 설정
var parkinglot1_name = '주차장1';
var parkinglot1 = '경기도 평택시 지장로 15';

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