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
	
	<div>
	
		<h1 class="text-center mt-4">나의 1:1 문의 작성 목록</h1>
	
		<div class="row justify-content-end">
    				<form action="#" class="mr-2">
			 			<input class="btn btn-warning" type="submit" value="로그아웃">
			 		</form>
    				<form action="#">
					 	<input class="btn btn-warning" type="submit" value="Mypage">
					 </form>
		</div>
	</div>
	
	<table class="table table-striped">
		<thead>
			<tr>
				<th>#</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>수정일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="board">
				<tr>
					<td>${board.bno }</td>
					<td>
					
					<c:url value="/board/get" var="getUrl">
						<c:param name="bno" value="${board.bno }" />
						<c:param name="pageNum" value="${pageMaker.cri.pageNum }" />
						<c:param name="amount" value="${pageMaker.cri.amount }" />
						<c:param name="type" value="${pageMaker.cri.type }" />
						<c:param name="keyword" value="${pageMaker.cri.keyword }"/>
					</c:url>
					
					<a href="${getUrl}">
					${board.title }
					<c:if test="${board.replyCnt  > 0}">
						[${board.replyCnt }]
					</c:if>
					</a> 
					</td>					
					<td>${board.writerName }</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/>
					</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }"/>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
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