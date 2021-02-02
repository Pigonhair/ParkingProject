<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javaScript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>


<!-- <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js'></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script> -->

<script>
$(document).ready(function(){

	var currentPage;
	var count;
	var rowCount;
	
	//목록호출
	function selectData(pageNum){
		currentPage = pageNum;
		
		if(pageNum==1){
			//처음 호출시 해당 ID의 div 내부 내용물 제거
			$('#output').empty();
		}
		
		//로딩 이미지 노출
		$('#loading').show();
		
		$.ajax({
			type:'post',
			data:{pageNum:currentPage},
			url:'reviewListAjax.do',
			dataType:'json',
			cache:false,
			timeout:10000,
			success:function(data){
				//로딩시 이미지(감춤)
				console.log(data);
				$('#loading').hide();
				count = data.count;
				rowCount = data.rowCount;
				var list = data.list;
				
				if(count<0 || list==null){
					alert('목록 호출 오류 발생!');
				}else{
					$(list).each(function(index,item){
						var output='<div class="container">';
						output = '<h1 class="my-4"></h1>';
						output += '<div class="row">';
						output += '<div class="col-md-7">';
						output += '<a href="#">';
						output += '<img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">';
						output += '</a>';
						output += '</div>';
						output += '<div class="col-md-5">';
						output += '<h1>'+item.park_name+'</h1>';
						/* output += '<h2>'+{parking.park_name}+'<h2>'; */
						output += '<h3>'+item.review_title+'</h3>'; 
						
						
						output += '<p>'+item.review_content+'</p>'; 
						
						output += '<a class="btn btn-primary" href="#">상세보기</a>';
						output += '</div>';
						output += '</div>';
						output += '<hr>';
						
						
						//문서 객체에 추가
						$('#output').append(output);						
					});
				}
			},
			error:function(){
				//로딩 이미지 숨김
				$('#loading').hide();
				alert('네트워크 오류');
			}
		});		
	}
	//스크롤시 데이터 추가
	$(window).scroll(function(){
		
		var scrollTop = $(document).scrollTop();
		var docHeight = $(document).height();
		var winHeight = $(window).height();
		
		if(scrollTop >= docHeight - winHeight){
			if(currentPage>=Math.ceil(count/rowCount)){
				//다음페이지 없을때
				return;
			}else{
				//다음페이지 있을때
				var pageNum = currentPage +1;
				selectData(pageNum);
			}
		}
		
	});
	
	//1페이지 호출
	selectData(1);	
});

</script>

<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<div class="page_reviewList">
<a class="btn btn-primary" href="${pageContext.request.contextPath}/review/reviewInsert.do">리뷰쓰기</a>
<div class="review">
<div id="output">
<!-- ajax 영역 -->
</div>
</div>
</div>




 <%-- <div class="container">

      <!-- Page Heading -->
      <h1 class="my-4">주차장 사용 어땠는지 평가
      </h1>

      <!-- Project One -->
      <div class="row">
        <div class="col-md-7">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
          </a>
        </div>
        <div class="col-md-5">
          <h3>강남역 주차장</h3>
          <p>강남역이랑 가까운데 비싸요</p>
          <a class="btn btn-primary" href="#">위치 보기로 할지</a>
        </div>
      </div>
      <!-- /.row -->

      <hr>

      <!-- Project Two -->
      <div class="row">
        <div class="col-md-7">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
          </a>
        </div>
        <div class="col-md-5">
          <h3>저멀리 주차장</h3>
          <p>엄청 싼데 엄청 멀어요.</p>
          <a class="btn btn-primary" href="${pageContext.request.contextPath}/project/reviewInsert.do">리뷰쓰기 버튼으로 할지 고민중</a>
        </div>
      </div>
      <!-- /.row -->

     
    </div>  --%>