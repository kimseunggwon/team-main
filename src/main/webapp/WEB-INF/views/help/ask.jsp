<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

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
		
		<div>
			<h1 class="text-center mt-5">1:1 문의 글 작성</h1>

			<div class="row justify-content-end">
				
				<form action="${appRoot }/member/main" class="mr-2 mb-2">
						<input class="btn btn-warning" type="submit" value="메인">
					</form>
				
    			<form action="${appRoot }/logout" class="mr-2">
			 		<input class="btn btn-warning" type="submit" value="로그아웃">
			 	</form>
    			<form action="${appRoot }/member/mypage">
				 	<input class="btn btn-warning" type="submit" value="Mypage">
				 </form>
	  		</div>
		</div>

		<div>
			<form action="${appRoot }/help/register" method="post" enctype="multipart/form-data">

				<div class="form-group">
					<label for="input1">제목</label> 
					<input id="input1" class="form-control" name="title">
				</div>

				<div class="form-group">
					<label for="textarea1">내용</label>
					<textarea id="textarea1" class="form-control" name="content"></textarea>
				</div>
				
				<div class="form-group">
					<label for="input3">파일</label> 
					<input id="input3" class="form-control" type="file" name="file" accept="image/*" />
				</div>

				<div class="form-group">
					<label for="input2">작성자</label> 
					<input id="input2" hidden value="${pinfo.member.userid }" readonly class="form-control" name="writer">
					<input value="${pinfo.member.userName }" readonly class="form-control" >
				</div>
				
				<input class="btn btn-primary" type="submit" value="작성" /> 
				
				<input hidden name="pageNum" value="${pag.pageNum }" />	
				<input hidden name = "amount" value="${pag.amount }" />			
				<input hidden name="type" value="${pag.type }">
				<input hidden name="keyword" value="${pag.keyword }" />
				
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
		
		 <div class="row justify-content-around">
		 	<div class="row">
		 
		 		<div class="mr-10">
		 			<img src="${appRoot }/resources/image/logo.jpg" alt="...">
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