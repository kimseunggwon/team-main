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
	<h1>나의 1:1 문의 작성 목록</h1>
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
</div>

</body>
</html>