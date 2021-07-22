<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		
		<div>
			<h1 class="text-center mt-4">1:1 문의 글 작성</h1>

			<div class="row justify-content-end">
    			<form action="${appRoot }/logout" method="post" class="mr-2 mb-2">
			 		<input class="btn btn-warning" type="submit" value="로그아웃">
			 	</form>
    			<form action="${appRoot }/member/mypage" class="mr-2 mb-2">
				 	<input class="btn btn-warning" type="submit" value="Mypage">
				 </form>
	  		</div>
		</div>

		<div>
			<form action="${appRoot }/help/askList" method="post" enctype="multipart/form-data">

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
					<input id="input2" value="" readonly class="form-control" name="writer">
				</div>
				
				<input class="btn btn-primary" type="submit" value="작성" /> 
				
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