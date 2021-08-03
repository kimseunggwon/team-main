<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	 uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="rev" tagdir="/WEB-INF/tags/review"%>


<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<meta charset="UTF-8">
<title>Review - list JSP File</title>

<style type="text/css">
@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
	font-family: 'GongGothicMedium';
}

#review-list-table {
	margin: 10px;
	padding: 50px;
}

img {
	padding: 70px;
}

#jinah-search-form1 {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	align-content: center;
}
</style>

<script>
	const reBno = "${review.reBno }";
	const appRoot = "${appRoot}";
</script>

</head>
<body style="overflow-x: hidden;">

	<rev:navbar></rev:navbar>


	<div class="row justify-content-center mt-5">
		<a style="text-decoration: none;" href="${appRoot }/member/main">
			<img id="" alt="" src="${appRoot }/resources/image/others/brand_logo_400px.png">
		</a>
	</div>
	
	<div class="container">
		<%--
		 	여기는 [리뷰 리스트] JSP 파일입니다 :)
		 --%>
		 
		<rev:search></rev:search>
		
		<!-- 리뷰 게시물 총 개수 -->
		<div class="container d-flex justify-content-between"
			style="margin: 10px; padding: 5px;">
			<div class="row justify-content-left">총 게시물 수 : ${totalCount }</div>
			<!-- 정렬 방식 -->
			<div class="btn-group">
				<button type="button" class="btn btn-warning dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					정렬 방식</button>
				<div class="dropdown-menu dropdown-menu-right">
					<a class="dropdown-item" href="#">BEST 5</a>
					<div class="order-new dropdown-divider"></div>
					
						<c:url value="/review/list" var="popUrl">
	 						<c:param name="pageNum" value="${reviewPageMaker.recri.pageNum}" />
	 						<c:param name="amount" value="${reviewPageMaker.recri.amount}" />
	 						<c:param name="type" value="${reviewPageMaker.recri.type}" />
	 						<c:param name="keyword" value="${reviewPageMaker.recri.keyword}" />
	 						<c:param name="sort" value="100" />
	 					</c:url>

						<a id="order-popular" class="dropdown-item" 
							href="${popUrl }" >인기도순</a>
							
						<c:url value="/review/list" var="latestUrl">
	 						<c:param name="pageNum" value="${reviewPageMaker.recri.pageNum}" />
	 						<c:param name="amount" value="${reviewPageMaker.recri.amount}" />
	 						<c:param name="type" value="${reviewPageMaker.recri.type}" />
	 						<c:param name="keyword" value="${reviewPageMaker.recri.keyword}" />
	 						<c:param name="sort" value="200" />
	 					</c:url>
						<a id="order-latest" class="dropdown-item" 
							href="${latestUrl}" >최신순</a>
							
						<c:url value="/review/list" var="viewUrl">
	 						<c:param name="pageNum" value="${reviewPageMaker.recri.pageNum}" />
	 						<c:param name="amount" value="${reviewPageMaker.recri.amount}" />
	 						<c:param name="type" value="${reviewPageMaker.recri.type}" />
	 						<c:param name="keyword" value="${reviewPageMaker.recri.keyword}" />
	 						<c:param name="sort" value="300" />
	 					</c:url>
						<a id="order-viewcount" class="dropdown-item" 
							href="${viewUrl }">조회수순</a>
					
				</div>
			</div>
		</div>
		
	<c:if test="${reviewPageMaker.recri.sort eq 100 }">
		<rev:popularlist></rev:popularlist>
	</c:if>
	
	<c:if test="${reviewPageMaker.recri.sort eq 200 }">
		<rev:latestlist></rev:latestlist>
	</c:if>
	
	<c:if test="${reviewPageMaker.recri.sort eq 300 }">
		<rev:viewcountlist></rev:viewcountlist>
	</c:if>
	
		 
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
		 				<c:url value="/review/list" var="pageLink">
		 					<c:param name="pageNum" value="${num }"></c:param>
		 					<c:param name="amount" value="${recri.amount }"></c:param>
		 					<c:param name="type" value="${recri.type }"></c:param>
		 					<c:param name="keyword" value="${recri.keyword }"></c:param>
	 						<c:param name="sort" value="${reviewPageMaker.recri.sort}" />
		 				</c:url>
		 				
		 				<li class="page-item ${num == recri.pageNum ? 'active' : '' }">
		 					<a class="page-link" href="${pageLink }">${num }</a>
		 				</li>
		 			</c:forEach>
		 			<c:if test="${reviewPageMaker.next }">
		 				<li class="page-item">
		 					<a class="page-link" href="${reviewPageMaker.endPage + 1}">Next</a>
		 				</li>
		 			</c:if>
		 		</ul>
		 	</nav>
		 </div>

		<!-- 구독작성/구독하기/로그인 Root Forwarding Buttons -->
		<div class="container">
			<div class="row justify-content-center d-flex justify-content-around">
				<sec:authorize access="hasRole('ROLE_USER')">
					<a href="${appRoot }/subscribe"><button
							id="review-subscribe-btn" type="button" class="btn btn-primary">지금
							빨래 구독하기</button></a>
				</sec:authorize>
				<sec:authorize access="!isAuthenticated()">
					<a href="${appRoot }/member/login"><button
							id="review-subscribe-login-btn" type="button"
							class="btn btn-primary">지금 빨래 구독하기</button></a>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
					<a href="${appRoot }/review/write"><button
							id="review-write-btn" type="button" class="btn btn-primary">구독
							리뷰 남기기</button></a>
				</sec:authorize>
				<sec:authorize access="!isAuthenticated()">
					<a href="${appRoot }/member/login"><button
							id="review-write-login-btn" type="button" class="btn btn-primary">구독
							리뷰 남기기</button></a>
				</sec:authorize>
			</div>
		</div>
	</div>
	
	<!-- 리뷰 등록 성공에 대한 메세지 Modal -->
	<c:if test="${not empty result }">
	<script>
		$(document).ready(function () {
			if (history.state == null) {
				$("#review-write-success-modal").modal("show");
				history.replaceState({}, null);
			}			
		});
	</script>
		<div id="review-write-success-modal" class="modal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">${messageTitle }</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body">
						<p>${messageBody }</p>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
		</c:if>
</body>
</html>