<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
request.setCharacterEncoding("UTF-8");
String parkngAr = request.getParameter("parkngAr");
String btnAddress = request.getParameter("btnAddress");
%>
<script type="text/javaScript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>

<link rel="stylesheet" href="${path}/resources/css/Search.css" />
<link rel="stylesheet" href="${path}/resources/css/Search2.css" />
<link rel="stylesheet" href="${path}/resources/css/parkingList.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />


<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${path}/resources/css/custom.css">


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c59597a942774a145bf6ea568ac28488&libraries=services,clusterer,drawing"></script>
<meta charset="utf-8" />

<style>
</style>
<title>리뷰쓰기</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
	<div id="wrap">
		<div class="wrapper">
			<ul class="steps">
				<li class="listword">사용 후기를 작성해 주세요 :)</li>
			</ul>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<form:form class="reviewInsertForm"
				action="/project/review/reviewInsert.do" commandName="reviewVO">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">
							<form:select name="select-profession" id="select-profession" path="park_id">
									<form:option value="0">주차장선택</form:option>
									<c:forEach var="parking" items="${list}">
										<form:option value="${parking.park_id}">
											${parking.park_name}, ${parking.park_type}, ${parking.detailAddr}, 
											${parking.park_public}</form:option>
										<br>
									</c:forEach>
							</form:select></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><form:input type="text" class="form-control"
									placeholder="리뷰 제목" path="review_title" name="review_title" /></td>
						</tr>
						<tr>
							<td><form:input type="textarea" class="form-control"
									placeholder="리뷰 내용" name="review_content" path="review_content"
									style="height:400px;" /></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="등록">
			</form:form>

		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>



	<script
		src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>


	<script>
		//DB에서 받아온 주차장 이름 및 위치 넣기
		<c:forEach var="parking" items="${list}">
		var parkinglot_name = '${parking.park_name}';
		var parkinglot_addr = '${parking.detailAddr}';
		//map에 주차장 key,value 넣기
		parking_position_Map.set(parkinglot_name, parkinglot_addr);
		</c:forEach>
	</script>
</body>
</html>