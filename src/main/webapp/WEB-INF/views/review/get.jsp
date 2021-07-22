<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
</script>

<script src="${appRoot }/resources/js/review/reviewlikecount.js"></script>

</head>
<body>
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
							<div>
								<img class="img-fluid"
									src="${imgRoot }${review.reBno}/${review.fileName}">
							</div>
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
								name="reContent" col="2" rows="10">
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
						<input class="btn btn-warning" type="submit" value="리뷰 수정하기">
						<input id="review-remove-btn1" class="btn btn-danger" type="submit" value="리뷰 삭제하기">
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

	<!-- 좋아요 Modal -->
	<div class="container">
		<div class="row justify-content-center">
			<!-- Button trigger modal -->
			<button id="review-like-btn" type="button" class="btn btn-primary"
				data-toggle="modal" data-target="#staticBackdrop">
				<img alt="likebtn" src="${appRoot }/resources/image/review/like.png">
			</button>

			<!-- Modal -->
			<div class="modal fade" id="staticBackdrop" data-backdrop="static"
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
</body>
</html>