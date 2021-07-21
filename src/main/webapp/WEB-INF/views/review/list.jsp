<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<meta charset="UTF-8">
<title>Review - list JSP File</title>
</head>
<body>
	<div class="container">
		<%--
		 	# 글번호
		 	제목
		 	작성자 
		 	작성일
		 	수정일
		 	좋아요수 (추천수로 할까)
		 	댓글수
		 	
		 	페이지네이션
		 	
		 	메세지 Modal
		 --%>
		 <h1>리뷰 게시물 목록</h1>
		 <table class="table table-striped">
		 	<thead>
		 		<tr>
		 			<th>#</th>
		 			<th>제목</th>
		 			<th>글쓴이</th>
		 			<th>작성 날짜</th>
		 			<th>수정 날짜</th>
		 		</tr>
		 	</thead>
		 	<tbody>
		 		<c:forEach items="${reList }" var="review">
		 			<tr>
		 				<td>${review.reBno }</td>
		 				<td>
		 					<c:url value="/review/get" var="reviewGetUrl">
		 						<c:param name="bno" value="${review.reBno }" />
		 						<c:param name="pageNum" value="${reviewPageMaker.recri.pageNum}" />
		 						<c:param name="amount" value="${reviewPageMaker.recri.amount}" />
		 						<c:param name="type" value="${reviewPageMaker.recri.type}" />
		 						<c:param name="keyword" value="${reviewPageMaker.recri.keyword}" />
		 					</c:url>
		 					<a href="${reviewGetUrl }">
		 						${review.reTitle }
		 					</a>
		 				</td>
		 				
		 				<td>${review.reWriterName }</td>
		 				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${review.reRegdate }"/></td>
		 				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${review.reUpdatedate }"/></td>
		 			</tr>
		 		</c:forEach>
		 	</tbody>
		 </table>
		 
		 <!-- 페이지네이션 -->
		 <div>
		 	<nav aria-label="Page navigation example">
		 		<ul id="list-pagination1" class="pagination justify-content-center">
		 			<c:if test="${reviewPageMaker.prev }">
		 				<li class="page-item">
		 					<a class="page-link" href="${reviewPageMaker.startPage - 1}">Previous</a>
		 				</li>
		 			</c:if>
		 			<c:forEach begin="${reviewPageMaker.startPage }" end="${reviewPageMaker.endPage }" var="num">
		 				<li class="page-item ${num == recri.pageNum ? 'active' : '' }">
		 					<a class="page-link" href="${num }">${num }</a>
		 				</li>
		 			</c:forEach>
		 			<c:if test="${reviewPageMaker.next }">
		 				<li class="page-item">
		 					<a class="page-link" href="${reviewPageMaker.endPage + 1}">Next</a>
		 				</li>
		 			</c:if>
		 		</ul>
		 	</nav>
		 	
		 	<%-- Form for Page Link 
		 	뭔지 잘 모르겠다...
		 	--%>
			<div style="display: none">
				<form id="actionForm" action="${appRoot }/board/list" method="get">
					<input name="pageNum" value="${recri.pageNum }" /> 
					<input name="amount" value="${recri.amount }" />
					<input name="type" value="${recri.type }" />
					<input name="keyword" value="${recri.keyword }" />
				</form>
			</div>
		 </div>
	</div>
</body>
</html>