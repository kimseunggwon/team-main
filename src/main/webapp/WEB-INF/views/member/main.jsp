<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags/MainMapTags"%>


<!DOCTYPE html>
<html>
<head>

<%@ include file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>

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
<div class = "container">
	
	
	
	
	 <div class="row">
				
				 <div class="col align-self-start">
				 
				 </div>
			
				<!-- 빨래 널자(회사) 로고 이미지가 들어갈 위치 -->
				<div class="col align-self-center mt-3">
					<a href="${appRoot }/member/main">
						<img src="${appRoot }/resources/image/others/brand_logo_300px.png" alt="...">
					</a>
				</div>
			
				<!-- 간단한 검색을 할 수 있는 검색창 구현 -->
				<div class="col align-self-end">
			
					<form class="d-flex">
     	 				<input class="form-control mr-2" type="search" placeholder="Search" aria-label="Search">
      					<button class="btn btn-outline-success" type="submit">Search</button>
    				</form>
				</div>
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
	  			<form action="${appRoot }/logout" method="post">
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
	
	
	<hr>
	
	<div class="row justify-content-center">
		<form action="${appRoot }/review/list">
	  			<input class="btn btn-danger" type="submit" value="사용자 후기!"> 
	  		</form>
	</div>
	
	
</div>

<tags:MainMapTags>
</tags:MainMapTags>

</body>
</html>