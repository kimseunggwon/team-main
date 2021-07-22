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
	margin: 70px;
	padding: 50px;
}

.container-1 input.search{
  width: 420px;
  height: 78px;
  background: rgb(242, 242, 242);
  border: none;
  font-size: 12pt;
  float: left;
  color: rgb(0, 0, 0);
  padding-left: 45px;
  -webkit-border-radius: 40px;
  -moz-border-radius: 40px;
  border-radius: 40px;
  outline-style: none;
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

</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<img alt="jinah-logo"
				src="${appRoot }/resources/image/others/brand_logo_400px.png">
		</div>
	</div>
	<div class="container">
		<%--
		 	여기는 [리뷰 리스트] JSP 파일입니다 :)
		 	1. 게시물 상세로 잘 넘어가는지 확인해야 해요.
		 --%>
		 
		<!-- Search Start -->
		<div class="container-1 row justify-content-center">
			<form class="d-flex align-items-center"
				action="${appRoot }/review/list" method="get">
				<div class="item">
					<select name="type" class="form-inline my-2 my-lg-0">
						<option value="">Select</option>
						<option value="T" ${recri.type	== "T" ? 'selected' : '' }>제목</option>
						<option value="C" ${recri.type	== "C" ? 'selected' : '' }>내용</option>
						<option value="W" ${recri.type	== "W" ? 'selected' : '' }>글쓴이</option>
						<option value="TC" ${recri.type	== "TC" ? 'selected' : '' }>제목
							+ 내용</option>
						<option value="TW" ${recri.type	== "TW" ? 'selected' : '' }>제목
							+ 글쓴이</option>
						<option value="TWC" ${recri.type	== "TWC" ? 'selected' : '' }>제목
							+ 글쓴이 + 작성자</option>
					</select>
				</div>
				<div class="item">
					<span
						style="position: absolute; margin-top: 27px; margin-left: 18px"
						class="icon"></span> <input name="keyword"
						value="${recri.keyword }" class="search" type="search"
						id="jinah-search1" placeholder="Search" />
				</div>

				<div class="item">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
				</div>

				<input type="hidden" name="pageNum" value="1"> <input
					type="hidden" name="amount" value="${recri.amount }">
			</form>
		</div>
		<!-- Search End -->
		
		<table id="review-list-table" class="table table-striped">
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
		 	
		 	<%-- Form for Page Link --%>
			<div style="display: none">
				<form id="actionForm" action="${appRoot }/review/list" method="get">
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