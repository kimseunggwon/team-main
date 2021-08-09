<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>

<style type="text/css">
@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
 
 body {	
   font-family: 'GongGothicMedium';
}
</style> 


</head>
<body>
 
<div class="container">	
    
    <div class="jumbotron">
    
    <div  class="col align-self-center mt-3">
					<a href="${appRoot }/member/main">
						<img src="${appRoot }/resources/image/others/brand_logo_300px.png" alt="...">
					</a>
				</div> 
				
				<br>
				<br>
				<br>
    
  <h1 class="display-4">나의 구독정보</h1>
   
  <hr class="my-4"> 
  <p class="lead"><span class="badge badge-info">실버</span>박진아</p>
  <a class="btn btn-primary btn-lg" href="#" role="button">구독연장</a>
  <a class="btn btn-primary btn-lg" href="#" role="button">나의 이용요금</a>
  <a class="btn btn-primary btn-lg" href="#" role="button">구독자 이벤트</a>
</div>
    
    
   <form>
  <div class="form-group">
    <label for="formControlRange">남은 구독날짜</label>
    <input type="range" class="form-control-range" id="formControlRange">
  </div>
</form>

<br>
<br>
<h1>요일별 사용량</h1> 
<div style="height: 100px; background-color: rgba(255,0,0,0.1);"> 
  <div class="h-25 d-inline-block" style="width: 120px; background-color: rgba(0,0,255,.1)">월요일 </div>
  <div class="h-50 d-inline-block" style="width: 120px; background-color: rgba(0,0,255,.1)">화요일 </div>
  <div class="h-75 d-inline-block" style="width: 120px; background-color: rgba(0,0,255,.1)">수요일 </div>
  <div class="h-100 d-inline-block" style="width: 120px; background-color: rgba(0,0,255,.1)">목요일 </div>
  <div class="h-25 d-inline-block" style="width: 120px; background-color: rgba(0,0,255,.1)">금요일</div>
  <div class="h-65 d-inline-block" style="width: 120px; background-color: rgba(0,0,255,.1)">토요일</div>
  <div class="h-75 d-inline-block" style="width: 120px; background-color: rgba(0,0,255,.1)">일요일</div>
</div>
 

</div>

   <br><br><br> 
 
	<div class="row justify-content-center">
			<form action="${appRoot }/help/ask">
			 	
			 </form>
		</div>
		
		<div class="row justify-content-center">
			
			<h1>
				1588 - 0000
			</h1>
			
		</div>
		
		<div class="row justify-content-center">
			고객 센터 운영 시간
			 평일(월~금) 09:00 ~ 18:30
			 / 주말(토) 09:00 ~ 13:00
		</div>
		
		<br> 
		
		<hr>
		
		 <div class="row justify-content-around mb-3">
		 	<div class="row">
		 
		 		<div class="mr-10">
		 			<a href="${appRoot }/member/main">
						<img src="${appRoot }/resources/image/others/brand_logo_300px.png" alt="...">
					</a>
		 		</div>
		 	
		 	</div>
		 	
		 	<div class="row">
		 		<div>
		 			서울시 강남구 삼성동 1234 우 : 123-1234
		 			<br>
					TEL:02-123-1234 Email:email@domain.com
					<br>
					COPYRIGHT (C) 빨래널자 ALL RIHGTS RESERVED
					<br>
				</div>
		 	</div>
		 	
		 	<div class="row">
		 		<span >
		 			<a href="#">
		 			 	<img src="${appRoot }/resources/image/blog.jpg">
		 			</a>
		 			<a href="#">
		 				<img  src="${appRoot }/resources/image/facebook.gif">
		 			</a>
		 			<a href="#">
		 				<img  src="${appRoot }/resources/image/twitter.gif">
		 			</a>
		 		</span>
		 	</div>
		 		
		 </div>
		
	</div>

</body>
</html>






