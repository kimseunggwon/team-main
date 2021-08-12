<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	 uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="rev" tagdir="/WEB-INF/tags/review"%>
<%@ taglib prefix="bot" tagdir="/WEB-INF/tags/botnav" %>

<!DOCTYPE html>
<html>
<head>

<link href="${appRoot }/resources/favicon/brand_logo.png" rel="shortcut icon" type="image/x-icon">

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<meta charset="UTF-8">
<title>구독취소 게시판</title>

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


#jinah-search-form1 {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	align-content: center;
}
</style>
<script type="text/javascript">
$(function() {
		let userid = "${pinfo.member.userid}";

		
	$("#subscribe-cancel-btn").click(function() { 
		$.ajax({
			type : "POST",
			url : "${appRoot}/cancelSubs/checkSubsUser",
			data : {userid : userid},
			success : function(data) {
				if(data != "") {
					$.ajax({
						type : "POST",
						url : "${appRoot}/cancelSubs/checkSubsBoard",
						data : {userid : userid},
						success : function(data) {
							if(data != "") {
								alert("이미 구독취소신청이 되었습니다.")
							} else if (data == "") {
				 				location.href='${appRoot}/cancelSubs/cancelSubsRegister'; 
							}
						}
					})
					
				} else if (data == "") {
					alert("고객님은 현재 구독중이 아닙니다.");
				}
			}
		})
	})
})
</script>
</head>
<body style="overflow-x: hidden;">
<div class = "container"> 
	<rev:navbar></rev:navbar>



	<div class="container">
		<div class="row justify-content-center" style="padding: 70px;">
			<a href="${appRoot }/member/main"> <img alt="jinah-logo"
				src="${appRoot }/resources/image/others/brand_logo_400px.png">
			</a>
			<div style="margin-top: 2%"><b>구독취소게시판 </b></div>
		</div>
	</div>

		<div class="row justify-content-left mt-3">
				<button id="subscribe-cancel-btn"  style="margin-left: 3%" type="button" class="btn btn-primary">구독취소신청</button>
		</div>

		<table id="review-list-table" class="table table-striped">
		 	<thead>
		 		<tr>
		 			<th>#</th>
		 			<th>제목</th>
		 			<th>글쓴이</th>
		 			<th>작성 날짜</th>
		 		</tr>
		 	</thead>
		 	<tbody>
		 		<c:forEach items="${list }" var="list">
		 			<tr>
		 				<td>${list.bno }</td>
		 				<td>
		 					<c:url value="/cancelSubs/cancelSubsGet" var="getUrl">
		 						<c:param name="bno" value="${list.bno }" />
		 					</c:url>
						<a style="text-decoration: none;"
						id="review-record-link" href="${getUrl }">
							${list.title } </a>
						</td>
		 				
		 				<td>${list.subsid }</td>
		 				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.updatedate }"/></td>
		 			</tr>
		 		</c:forEach>
		 	</tbody>
		 </table>


		 
		 <!-- 페이지네이션 -->
		 <div>
		 	<nav aria-label="Page navigation example">
		 		<ul id="list-pagination1" class="pagination justify-content-center">
		 			<c:if test="${pageMaker.prev }">
		 				<li class="page-item">
		 					<a class="page-link" href="${pageMaker.startPage - 1 }">Previous</a>
		 				</li>
		 			</c:if>
		 			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
					    <li class="page-item ${num == cri.pageNum ? 'active' : '' }"><a class="page-link" 
					    href="${num }">${num }</a></li>
					</c:forEach>
					
		 			<c:if test="${pageMaker.next }">
					    <li class="page-item">
					      <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a>
					    </li>
					</c:if>
		 		</ul>
		 	</nav>
		 </div>

		
		<bot:botnav></bot:botnav>
		
		</div>
</body>
</html>