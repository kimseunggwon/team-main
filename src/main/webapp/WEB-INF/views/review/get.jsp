<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec"	 uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="rev" tagdir="/WEB-INF/tags/review"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<meta charset="UTF-8">
<title>Review - get JSP File</title>

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

#re-starItem {
	padding: 5px;
	background-color: white;
	border: none;
	outline: none;
}

#review-like-btn {
	padding: 5px;
	background-color: white;
	border: none;
	outline: none;
}

#jinah-star {
	width: 50px;
	height: 50px;
	color: #ffe62e;
}

#re-write-content {
	display: flex;
	flex-direction: column;
	align-content: center;
}

img {
	padding: 50px;
}

/* 왜 안될까? */
#jinah-search-form1 {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	align-content: center;
}
</style>

<script>
	const appRoot = "${appRoot}";
	// const reBno = "${review.reBno}"
	const userid = "${pinfo.member.userid}";
</script>

<script src="${appRoot }/resources/js/review/reviewlikecount.js"></script>

</head>
<body>

	<rev:navbar></rev:navbar>

	<div class="container">
		<%--
		여기는 리뷰를 얻어오는 [리뷰 상세] JSP 파일입니다 :) 
		1. 좋아요, 평점 얻어오기
		2. 
		3. 
		4. 
		 --%>
		<div class="container">
			<div class="row justify-content-center">
				<img alt="jinah-logo"
					src="${appRoot }/resources/image/others/brand_logo_400px.png">
			</div>
		</div>

		<rev:search></rev:search>

		<!-- Review Grading (stars) Start -->
		<div id="re-stare" style="display: inline;" class="container">
			<div class="row justify-content-center d-flex align-items-center">
				<button type="button" class="item" id="re-starItem">
					<i id="jinah-star" class="fas fa-star"></i>
				</button>
				<button type="button" class="item" id="re-starItem">
					<i id="jinah-star" class="fas fa-star"></i>
				</button>
				<button type="button" class="item" id="re-starItem">
					<i id="jinah-star" class="fas fa-star"></i>
				</button>
				<button type="button" class="item" id="re-starItem">
					<i id="jinah-star" class="fas fa-star"></i>
				</button>
				<button type="button" class="item" id="re-starItem">
					<i id="jinah-star" class="fas fa-star"></i>
				</button>
				<div>
					<label for="jinah-restars">평점</label> <input type="hidden"
						name="reStars" value="${re.reStars }" />
				</div>
			</div>
		</div>
		<!-- Review Grading (stars) End -->

		<!-- Main Writing Content -->
		<div id="re-write-content" class="container">
			<div class="row justify-content-center">
				<div class="col-8">
						<!-- 평점 -->
						<%--
						 ${review.reStars }
						 --%>

						<!-- 이미지 파일 -->
						<c:if test="${not empty review.fileName }">
							<c:forEach items="${review.fileName }" var="rfile">
								<div>
									<img class="img-fluid"
										src="${imgRoot }${review.reBno}/${rfile }">
								</div>
							</c:forEach>
						</c:if>

						<!-- 제목 -->
						<div class="item form-group">
							<label for="re-input1">리뷰 제목</label> <input readonly="readonly"
								id="re-input1" class="form-control" name="reTitle"
								value="${review.reTitle }">
						</div>
						
						<!-- 내용 -->
						<div class="item form-group">
							<label for="re-textarea1">리뷰 내용</label>
							<textarea readonly="readonly" class="form-control"
								name="reContent" cols="2" rows="10" >
				 				<c:out value="${review.reContent }"></c:out>
				 			</textarea>
						</div>
						
						<!-- 작성자 -->
						<div class="item form-group">
							<label for="re-input3">리뷰 작성자</label>
							<!-- input id="re-input3" class="form-control" value="" type="hidden" name="jinah-writer"-->
							<input type="hidden" id="re-input3" class="form-control"
								name="reWriterName" value="${review.reWriterName }" readonly>
							<input readonly="readonly" value="${review.reWriterName }">
						
						<!-- 좋아요 누르기 
						<button type="button" class="item" id="review-like-btn">
							<img alt="likebtn" src="${appRoot }/resources/image/review/like.png">
						</button>
						-->
							
						<!-- 리뷰 수정/삭제 버튼 -->
						<c:url value="/review/modify" var="reModifyUrl">
							<c:param name="reBno" value="${review.reBno }" />
							<c:param name="pageNum" value="${recri.pageNum }" />
							<c:param name="amount" value="${recri.amount }" />
							<c:param name="type" value="${recri.type }" />
							<c:param name="keyword" value="${recri.keyword }" />
						</c:url>
	
						<c:if test="${pinfo.member.userid eq review.reWriter}">
							<a class="btn btn-danger" href="${reModifyUrl }">나의 리뷰 수정 or 삭제</a>
						</c:if>
						</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row justify-content-center">
			<span id="review-total-count"> ${review.likeCount }</span> 명이 이 게시물을
			좋아합니다.
		</div>
	</div>

	<!-- 좋아요 Modal (회원 접근 가능) -->
	<sec:authorize access="isAuthenticated()">
	<div class="container">
		<div class="row justify-content-center">
			<!-- Button trigger modal -->
			<button id="review-like-btn" type="button" class="btn btn-primary"
				data-toggle="modal" data-target="#staticBackdrop1">
				<img alt="likebtn" src="${appRoot }/resources/image/review/like.png">
			</button>

			<!-- Modal -->
			<div class="modal fade" id="staticBackdrop1" data-backdrop="static"
				data-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">리뷰 추천</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">${review.reWriterName }님의 게시물을 추천하시겠습니까?</div>
						<div class="modal-footer">
							<button data-reBno="${review.reBno}" type="button" id="review-like-up" class="btn btn-primary">추천할게요!</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">안 할게요</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		</sec:authorize>
	
	
	<!-- 좋아요 Modal (비회원 접근 가능) -->
		<sec:authorize access="!isAuthenticated()">
	<div class="container">
		<div class="row justify-content-center">
			<!-- Button trigger modal -->
			<button id="review-like-btn" type="button" class="btn btn-primary"
				data-toggle="modal" data-target="#staticBackdrop2">
				<img alt="likebtn" src="${appRoot }/resources/image/review/like.png">
			</button>

			<!-- Modal -->
			<div class="modal fade" id="staticBackdrop2" data-backdrop="static"
				data-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">리뷰 추천</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">[빨래널자]의 회원에 한해서만 게시물 추천이 가능합니다. 회원가입 및 로그인 페이지로 이동하시겠습니까?</div>
						<div class="modal-footer">
							<a href="${appRoot }/member/login" type="button" id="review-forward-login" class="btn btn-primary">로그인 할게요!</a>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">안 할게요</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</sec:authorize>
	<div class="container">
		<div class="row justify-content-center">
			<a href="${appRoot }/review/list"><button type="button"
					class="btn btn-info">다른 리뷰 보러가기</button></a>
		</div>
	</div>
</body>
</html>