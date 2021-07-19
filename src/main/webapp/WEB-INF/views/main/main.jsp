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
	  		
	  		<!-- 로그인하지 않은 상태로 접근하면 보이는 버튼을 구현하였다. -->
	  		<form action="${appRoot }/member/login">
	  			<c:if test="${empty main.userid }">
	  				<input class="btn btn-primary mr-1" type="submit" value="로그인"> 
	  			</c:if>
	  		</form>
	  		
	  		<form action="${appRoot }/member/signup">
	  			<c:if test="${empty main.userid }">	
	  				<input class="btn btn-primary mr-1" type="submit" value="회원가입"> 
	  			</c:if>	
	  		</form>
	  
	  		
	  		<!-- 
	  			(1) 로그인시에만 보이도록 <c:if> tag 사용함.
	  			(2) 로그아웃 버튼에 경로 수정.
	  			(3) Mypage 버튼에 경로 수정.
	  		       -->
	  		<form action="${appRoot }/main/mainpage">
	  			<c:if test="${not empty main.userid }">
	  				<input class="btn btn-primary mr-1" type="submit" value="로그아웃"> 
	  			</c:if>
	  		</form>
	  		
	  		<form action="${appRoot }/member/mypage">
	  			<c:if test="${not empty main.userid }">
	  				<input class="btn btn-primary mr-1" type="submit" value="MyPage"> 
	  			</c:if>	
	  		</form>
	  		
	  		<form action="${appRoot }/help/helpdesk">
	  			<c:if test="${not empty main.userid }">	
	  				<input class="btn btn-primary mr-1" type="submit" value="고객센터"> 
	  			</c:if>
	  		</form>
	  		
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