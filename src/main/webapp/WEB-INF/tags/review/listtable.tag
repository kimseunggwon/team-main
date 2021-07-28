<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	 uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="rev" tagdir="/WEB-INF/tags/review"%>

<c:if test="${orderby eq popularlist }">
<table id="review-list-table" class="table table-striped">
		 	<thead>
		 		<tr>
		 			<th>#</th>
		 			<th>제목</th>
		 			<th>글쓴이</th>
		 			<th>작성 날짜</th>
		 			<th>수정 날짜</th>
		 			<th>좋아요</th>
		 			<th>조회수</th>
		 		</tr>
		 	</thead>
		 	<tbody>
		 		<c:forEach items="${reList2 }" var="review">
		 			<tr style="color: red;">
		 				<td>공지</td>
		 				<td>
		 					<c:url value="/review/get" var="reviewGetUrl">
		 						<c:param name="reBno" value="${review.reBno }" />
		 						<c:param name="pageNum" value="${reviewPageMaker.recri.pageNum}" />
		 						<c:param name="amount" value="${reviewPageMaker.recri.amount}" />
		 						<c:param name="type" value="${reviewPageMaker.recri.type}" />
		 						<c:param name="keyword" value="${reviewPageMaker.recri.keyword}" />
		 					</c:url>
		 					<a style="color: red; text-decoration: none;" id="review-record-link"  href="${reviewGetUrl }">
		 						${review.reTitle }
		 					</a>
		 				</td>
		 				
		 				<td>${review.reWriterName }</td>
		 				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${review.reRegdate }"/></td>
		 				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${review.reUpdatedate }"/></td>
		 				<td>${review.likeCount }</td>
		 				<td><c:out value="${review.viewCount }"></c:out></td>
		 			</tr>
		 		</c:forEach>
		 		
		 		<c:forEach items="${reList }" var="review">
		 			<tr>
		 				<td>${review.reBno }</td>
		 				<td>
		 					<c:url value="/review/get" var="reviewGetUrl">
		 						<c:param name="reBno" value="${review.reBno }" />
		 						<c:param name="pageNum" value="${reviewPageMaker.recri.pageNum}" />
		 						<c:param name="amount" value="${reviewPageMaker.recri.amount}" />
		 						<c:param name="type" value="${reviewPageMaker.recri.type}" />
		 						<c:param name="keyword" value="${reviewPageMaker.recri.keyword}" />
		 					</c:url>
		 					<a id="review-record-link"  href="${reviewGetUrl }">
		 						${review.reTitle }
		 					</a>
		 				</td>
		 				
		 				<td>${review.reWriterName }</td>
		 				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${review.reRegdate }"/></td>
		 				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${review.reUpdatedate }"/></td>
		 				<td>${review.likeCount }</td>
		 				<td><c:out value="${review.viewCount }"></c:out></td>
		 			</tr>
		 		</c:forEach>
		 	</tbody>
		 </table>
</c:if>
		 