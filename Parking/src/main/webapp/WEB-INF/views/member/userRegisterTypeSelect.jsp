<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_userType.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#button1').click(function(){
		alert("�޴���ȭ ��ȣ�� �̸����� ���̵�/��й�ȣ ã�� �� ����Ͻ� �����Դϴ�. �ʼ��Է»����� �������ּ���.");
	});
	$('#button2').click(function(){
		alert("�޴���ȭ ��ȣ�� �̸����� ���̵�/��й�ȣ ã�� �� ����Ͻ� �����Դϴ�. �ʼ��Է»����� �������ּ���.");
	});
});
</script>
<div class="page-main-style">
   <div class="align-center">
      <h2 class="type_text"><img src="../resources/images/text_Member_type_select.png"></h2>
      
      <!-- ����� ��ư -->
      <button type="button" id="button1" class="type_select_btn" 
      onclick="location.href='${pageContext.request.contextPath}/member/memberRegister.do'">
      <img src="../resources/images/Btn_member_register.png">
      </button>
      
      <!-- ����� ��ư -->
      <button type="button" id="button2" class="type_select_btn" 
      onclick="location.href='${pageContext.request.contextPath}/member/trainerRegister.do'">
      <img src="../resources/images/Btn_trainer_register.png">
      </button>
   </div>
</div>