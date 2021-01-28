<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.7.js"></script> <!-- 결제 -->


<script>
/* $(document).ready(function(){ */
	IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
/* var IMP = window.IMP; */

function pay(){
	alert("버튼눌림");
   
	var IMP = window.IMP;
	
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 14000,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    m_redirect_url : '${pageContext.request.contextPath}/pay/payok.do'
	},
	
	
	function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
	
}; 


//결제페이지



/* }) */
</script>




<meta charset="utf-8" />
<title>Insert title here</title>
</head>
<body>
<div id="wrap">
<div class="wrapper" >
<form class="form-wrapper">
<ul class="steps">
<li class="is-active">Step 2</li>
<li class="listword">결제하기</li>
</ul>
</form>


</div>
</div>


<input type="button" value="결제하기" onclick="pay();" /> 

<button onclick="location.href='${pageContext.request.contextPath}/project/main.do'">홈으로</button>
<button onclick="location.href='${pageContext.request.contextPath}/pay/payok.do'">결제가 성공했을때 확인페이지</button>

</body>
</html>