<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="mem" tagdir="/WEB-INF/tags/member"%>

<!DOCTYPE html>
<html>
<head>

<mem:mainpage></mem:mainpage>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>마이페이지</title>
</head>
<body>
<style type="text/css">
.jumbotron{
 	box-shadow: 5px 3px 10px gray;
	border: 3px solid #88C9F1;
	-webkit-border-radius: 40px;
	-moz-border-radius: 40px;
	border-radius: 5px;
	background-color: #88C9F1;
}
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

 

 
<div class="container">	

<br>
<br>
 <div class="col align-self-center mt-3">
					<a href="${appRoot }/member/main">
						<img src="${appRoot }/resources/image/others/brand_logo_300px.png" alt="...">
					</a>
				</div> 
<br>
<br>				 

 <!-- 12
 <ul class="nav justify-content-end">
  
  <sec:authorize access="isAnonymous()">
		  		<form action="${appRoot }/member/login">
		  			<input class="btn btn-primary mr-1" type="submit" value="로그인"> 
	  			</form>
	  		
		  		<form action="${appRoot }/help/helpdesk">
		  			<input class="btn btn-primary mr-1" type="submit" value="고객센터"> 
	  			</form>
	  		</sec:authorize> -->
	  		
	  		<!--  로그인 했을때 -->
	  		<!--   12
	  		<sec:authorize access="isAuthenticated()">       
	  			<form action="${appRoot }/logout" method="post">
	  					<input class="btn btn-primary mr-1" type="submit" value="로그아웃"> 
	  			</form>
	  	
	  		
	  			<form action="${appRoot }/help/helpdesk">	
	  					<input class="btn btn-primary mr-1" type="submit" value="고객센터"> 
	  			</form>
	  		</sec:authorize>
</ul>  
 -->

  

  <div class="btn-group dropleft">   
  <button class="btn btn-info btn-lg dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   메뉴보기 
  </button> 
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="${appRoot }/member/myget">내 정보확인</a>
 <!--    <a class="dropdown-item" href="${appRoot }/member/subinfo">구독정보</a> -->
    <a class="dropdown-item" href="${appRoot}/searchstore/searchMap">매장찾기</a> 
    <a class="dropdown-item" href="${appRoot }/help/askList">나의 1:1문의내역</a>
    <a class="dropdown-item" href="${appRoot }/review/list">사용자 후기</a>
    <a class="dropdown-item" href="${appRoot }/searchstore/b2bIntroduceBoard">홍보페이지 관리</a>
    <a class="dropdown-item" href="${appRoot}/cancelSubs/cancelSubsBoard">구독 취소</a>      
  </div>
</div> 
 
  
    
   
  <div class="jumbotron"> 
  <h1 class="display-4">안녕하세요  ${member.userName } 회원님</h1>
  <p class="lead">고객님이 이용중인 서비스는 '1인 가구 이용 서비스 입니다'.<br>
   혹시 아직 서비스를 이용하지 않고 계신가요~? <br>
   서둘러 밑에 구독하기 버튼을 눌러주세요.! 
  </p>
  <hr class="my-4">
  
  <div class="row">
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">싱글 구독</h5>
        <p class="card-text">혼자 사는 싱글들을 위한 맞춤형 구독</p>
        <a href="${appRoot }/subscribe/subsregister" class="btn btn-info">1인 가구 구독</a>
      </div>
    </div> 
  </div>
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body"> 
        <h5 class="card-title">대형 구독</h5>
        <p class="card-text">가족 구성원들과 함께 이용하는 구독 서비스</p>
        <a href="${appRoot }/subscribe/subsregister" class="btn btn-info">다세대 가구 구독</a>
      </div>
    </div>
  </div>
</div>
  
</div>
  
  
</div>
 

	
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

