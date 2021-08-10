<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="mem" tagdir="/WEB-INF/tags/member"%>

<!DOCTYPE html>
<html>
<head>

<link href="${appRoot }/resources/favicon/brand_logo.png" rel="shortcut icon" type="image/x-icon">

<mem:mainpage></mem:mainpage>
<br>
<br>
<br> 
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
.jumbotron{
 
  background-color:
}
.control-label {
  color:#6464CD;
}

</style>



</head> 
<body style="overflow-x: hidden;">



<script>


</script>
	
  

<div class="container">	 

<div class="col align-self-center mt-3">
					<a href="${appRoot }/member/main">
						<img src="${appRoot }/resources/image/others/brand_logo_300px.png" alt="...">
					</a>
				</div>  
				<br> 
				<br> 
				<br> 
<h1><span class="badge badge-info">실버</span> ${member.userName }님 안녕하세요!</h1> 
        <div class="jumbotron jumbotron-fluid">
		<section id="container">   
			<form id="member-form" action="${appRoot }/member/modify" method="post">
			    <div class="form-group has-feedback">
					<label class="control-label" for="userName">나의 이름</label>
					<input  value="${member.userName }" class="form-control" readonly type="text" id="userName" name="userName"/>
				</div>  
				<br>
				<div class="form-group has-feedback">  
					<label class="control-label" for="userId">나의 아이디</label>
					<input  class="form-control"  value="${member.userid}" readonly type="text" id="userId" name="userid"/>
				</div> 
				<br>
				<div class="form-group has-feedback">
					<label class="control-label" for="userEmail">나의 이메일주소</label>
					<input  value="${member.userEmail}" class="form-control" readonly type="text" id="userEmail" name="userEmail" />
				</div> 
				<br>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPhonenum">나의 핸드폰번호</label>
					<input  value="${member.userPhonenum}" class="form-control" readonly type="text" id="userPhonenum" name="userPhonenum" />
				</div> 
				<br>
				<div class="form-group">
					<label class="control-label" for="userAddress">나의 주소</label>
					<input  value="${member.userAddress}" class="form-control" readonly type="text" id="userAddress" name="userAddress" />
				</div>
				   
				</div>
				  
				   <!--  <a href="myinfo" </a> -->
			 <div class="col-sm-12" style="text-align:center;">
		        <a href="myinfo" type="submit" class="btn btn-primary btn-lg" >내 정보 수정하기</a>
			</div>	
				    
				 
			</form>
		</section>
		
	</body>
 
   
</div>

<div id="myModal" class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">알림창</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>수정하시겠습니까?</p>
      </div> 
      <div class="modal-footer">
        <a><button href="myinfo" id="btn-modify1" type="submit" class="btn btn-primary" data-dismiss="modal">수정하기</button></a>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
   
   <br>
   <br>
   <br>
   <br> 
   <!-- 밑에 nav -->

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






