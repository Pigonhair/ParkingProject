<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<!--
   Dopetrope by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
   <head>
      <title>Parking</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="${path}/resources/css/main.css" />
     
   </head>
   <body class="homepage is-preload">
   
     		<!-- 비로그인 상태 : 회원가입,로그인 활성화 -->
		<c:if test="${empty user}">
			<a href="${pageContext.request.contextPath}/member/userType.do">회원가입</a>
			<a href="${pageContext.request.contextPath}/member/login.do">로그인</a>	
		</c:if>

   </body>
</html>