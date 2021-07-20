<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!DOCTYPE html>
<html>
<head>

<%@ include file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<div class = "container">
	
	
	  <div class="row justify-content-center mt-4">
	  	<img alt="" src="${appRoot }/resources/image/logo.jpg">
	  </div>
	  
	  <div class="row justify-content-end mt-3">
	  	<div class="row justify-content-around">
	  		
	  		<sec:authorize access="isAnonymous()">
		  		<form action="${appRoot }/member/login">
		  			<input class="btn btn-primary mr-1" type="submit" value="로그인"> 
	  			</form>
	  		
		  		<form action="${appRoot }/member/signup">
		  			<input class="btn btn-primary mr-1" type="submit" value="회원가입"> 
	  			</form>
	  		</sec:authorize>
	  		
	  
	  		
	  		<!-- 
	  			(1) 로그아웃 버튼에 경로 수정.
	  			(2) Mypage 버튼에 경로 수정.
	  		       -->
	  		<sec:authorize access="isAuthenticated()">       
	  			<form action="${appRoot }/member/main">
	  					<input class="btn btn-primary mr-1" type="submit" value="로그아웃"> 
	  			</form>
	  		
	  			<form action="${appRoot }/member/mypage">
	  					<input class="btn btn-primary mr-1" type="submit" value="MyPage"> 
	  			</form>
	  		
	  			<form action="${appRoot }/help/helpdesk">	
	  					<input class="btn btn-primary mr-1" type="submit" value="고객센터"> 
	  			</form>
	  		</sec:authorize>
	  		
	  	</div>
	  </div>
	
	<div class="row justify-content-end mt-4">	
		<form class="d-flex">
     	 	<input class="form-control mr-2" type="search" placeholder="Search" aria-label="Search">
      		<button class="btn btn-outline-success" type="submit">Search</button>
    	</form>
	</div>
	
	<hr>
	
	<div class="row justify-content-center">
		<form action="${appRoot }/review/list">
	  			<input class="btn btn-danger" type="submit" value="사용자 후기!"> 
	  		</form>
	</div>
	
	
</div>
</body>
</html>