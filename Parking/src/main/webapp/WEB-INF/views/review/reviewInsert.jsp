<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>리뷰쓰기</title>
</head>
<body>

<form:form class="reviewInsertForm" action="/project/review/reviewInsert.do" commandName="reviewVO">
<ul>
<li>
<a>리뷰 제목</a>
<form:input type="text" class="review_title" name="review_title" path="review_title"/>
</li>
<li>
<a>리뷰 내용</a>
<form:input type="text" class="review_content" name="review_content" path="review_content"/>
</li>
</ul>
<input type="submit" value="작성" class="insertReveiwBtn">
</form:form>


</body>
</html>