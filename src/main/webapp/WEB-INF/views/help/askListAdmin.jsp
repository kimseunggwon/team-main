<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="hel" tagdir="/WEB-INF/tags/help"%>
<%@ taglib prefix="bot" tagdir="/WEB-INF/tags/botnav"%>


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

	<hel:adminnav></hel:adminnav>

<div class = "container">
	
	<div class="row mt-5">
				
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
	
		<h1 class="text-center mt-5">1:1 문의글 리스트 </h1>
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
			   	
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			 <c:forEach items="${list }" var="help">
				<tr>
					<td>${help.bno }</td>
					
					<td>
						<c:url value="/help/askGetContent" var="getUrl">
							<c:param name="bno" value="${help.bno }" />
							<c:param name="pageNum" value="${pageMaker.pag.pageNum }" />
							<c:param name="amount" value="${pageMaker.pag.amount }" />
							<c:param name="type" value="${pageMaker.pag.type }" />
							<c:param name="keyword" value="${pageMaker.pag.keyword }"/>
						</c:url>
					
						<a href="${getUrl}"> 
							${help.title }
							<c:if test="${help.replyCnt  > 0}">
								[${help.replyCnt }]
							</c:if>
						</a> 
					</td>					
	 				<td>${help.userNickName }</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${help.regdate }"/>
					</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${help.updateDate }"/>
					</td>
					</tr>
			</c:forEach>
		</sec:authorize>
	</tbody>
</table>
	
	
	
	<!-- pagenation -->
	
	<!-- pagenation 적용을 위한 코드 추가 -->

	<div>
          <nav aria-label="Page navigation example">
             <ul id="list-pagination1" class="pagination justify-content-center">
                <c:if test="${pageMaker.prev }">
                   <li class="page-item">
                      <a class="page-link" href="${pageMaker.startPage - 1}">Previous</a>
                   </li>
                </c:if>
                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
                   <c:url value="/help/askListAdmin" var="pageLink">
                      <c:param name="pageNum" value="${num }"></c:param>
                      <c:param name="amount" value="${pag.amount }"></c:param>
                      <c:param name="type" value="${pag.type }"></c:param>
                      <c:param name="keyword" value="${pag.keyword }"></c:param>
                   </c:url>
                   
                   <li class="page-item ${num == pag.pageNum ? 'active' : '' }">
                      <a class="page-link" href="${pageLink }">${num }</a>
                   </li>
                </c:forEach>
                <c:if test="${pageMaker.next }">
                   <li class="page-item">
                      <a class="page-link" href="${pageMaker.endPage + 1}">Next</a>
                   </li>
                </c:if>
             </ul>
          </nav>
	
	
	<bot:botnav></bot:botnav>
	
		</div>
</div>
	

</body>
</html>