<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec"	 uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="rev" tagdir="/WEB-INF/tags/review"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<meta charset="UTF-8">
<title>review Modify JSP File</title>
</head>

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

#review-modify-btn1, #review-remove-btn1 {
	margin: 5px;
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

#re-input2-label {
  padding: 6px 25px;
  background-color:#FF84A9;
  border-radius: 4px;
  color: white;
  cursor: pointer;
}

#jinah-search-form1 {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	align-content: center;
}
</style>

<script>
	const appRoot = "${appRoot}";
	const userid = "${pinfo.member.userid}";
</script>
<script src="${appRoot }/resources/js/review/modifyandremove.js"></script>

<body>

	<rev:navbar></rev:navbar>

		<%-- 여기는 [글 수정 및 삭제하기] JSP 파일입니다 :) --%>
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

	<div class="container">
		 <div class="row justify-content-center">
		 		<div class="col-8">
			 		<form id="re-modify-form1" action="${appRoot }/review/modify" method="post" enctype="multipart/form-data"> 
			 			<!-- 이미지 파일 -->
						<c:if test="${not empty review.fileName }">
							<c:forEach items="${review.fileName }" var="rfile">
								<div>
									<img class="img-fluid"
										src="${imgReviewRoot }${review.reBno}/${rfile }">
								</div>
							</c:forEach>
						</c:if>
			 			<div class="item form-group">
				 			<label id="re-input2-label" for="re-input2">이미지 선택</label>
				 			<input style="display:none;"id="re-input2" multiple="multiple" class="form-control" type="file" accept="image/*" > 
			 			</div>
			 			<!-- 제목 -->
			 			<div class="item form-group">
				 			<label for="re-input1">리뷰 제목</label>
				 			<input id="re-input1" class="form-control" name="reTitle" value="${review.reTitle }" placeholder="제목을 입력해주세요."> 
			 			</div>
			 			<!-- 내용 -->
			 			<div class="item form-group">
				 			<label for="re-textarea1">리뷰 내용</label>
				 			<textarea class="form-control" name="reContent" col="2" rows="10" placeholder="내용을 입력해주세요.">${review.reContent }</textarea> 
			 			</div>
			 			<!-- 작성자 -->
			 			<div class="item form-group">
				 			<label for="re-input3">리뷰 작성자</label>
				 			<input id="re-input3" class="form-control" value="${pinfo.member.userNickname }" readonly>
			 			</div>
			 			<input type="hidden" name="reWriterName" value="${pinfo.member.userid }" readonly>
			 			
			 			<input type="hidden" name="reBno" value="${review.reBno }" readonly>
			 			
			 			<!-- 페이지네이션 참조 -->
			 			<input hidden name="pageNum" value="${recri.pageNum }" />
						<input hidden name="amount" value="${recri.amount }"	/>
						<input hidden name="type" value="${recri.type }"	/>
						<input hidden name="keyword" value="${recri.keyword }"	/>
						
				 		
				 		<!-- 추천해요 취소 (추천 YES >> 추천 취소 / 추천 NO >> 추천하기 -->
				 			
			 			<!-- 리뷰 수정/삭제 모달 -->
						<div class="container">
							<div class="row justify-content-center">
								<!-- Button trigger modal -->
								<button id="review-modify-btn1" type="button"
									class="btn btn-primary" data-toggle="modal"
									data-target="#staticBackdrop1">
									<img alt="modifyBtn"
										src="${appRoot }/resources/image/review/modify.png">
								</button>
	
								<!-- Modal -->
								<div class="modal fade" id="staticBackdrop1"
									data-backdrop="static" data-keyboard="false" tabindex="-1"
									aria-labelledby="staticBackdropLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="staticBackdropLabel">나의 리뷰 수정</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">${pinfo.member.userName } 회원님의 게시물을
												수정하시겠습니까?</div>
											<div class="modal-footer">
												<button data-reBno="${review.reBno}" type="button"
													id="review-modify-btn" class="btn btn-primary">수정</button>
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="container">
							<div class="row justify-content-center">
								<!-- Button trigger modal -->
								<button id="review-remove-btn1" type="button"
									class="btn btn-primary" data-toggle="modal"
									data-target="#staticBackdrop2">
									<img alt="removeBtn"
										src="${appRoot }/resources/image/review/remove.png">
								</button>
	
								<!-- Modal -->
								<div class="modal fade" id="staticBackdrop2"
									data-backdrop="static" data-keyboard="false" tabindex="-1"
									aria-labelledby="staticBackdropLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="staticBackdropLabel">나의 리뷰 삭제</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">${pinfo.member.userName } 회원님의 게시물을
												삭제하시겠습니까?</div>
											<div class="modal-footer">
												<button data-reBno="${review.reBno}" type="button"
													id="review-remove-btn" class="btn btn-primary">삭제</button>
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
				</form>
		 	</div>
		 </div>
	</div>
	<!-- 리뷰 등록 성공에 대한 메세지 Modal -->
	<c:if test="${not empty result }">
		<script>
			$(document).ready(function() {
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

	<!-- 구독작성/구독하기/로그인 Root Forwarding Buttons -->
	<div class="container">
		<div class="row justify-content-center d-flex justify-content-around">
			<sec:authorize access="hasRole('ROLE_USER')">
				<a href="${appRoot }/subscribe"><button
						id="review-subscribe-btn" type="button" class="btn btn-primary">지금
						빨래 구독하기</button></a>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_USER')">
				<a href="${appRoot }/review/write"><button id="review-write-btn"
						type="button" class="btn btn-primary">구독 리뷰 남기기</button></a>
			</sec:authorize>
			<a href="${appRoot }/review/list"><button type="button"
					class="btn btn-info">다른 리뷰 보러가기</button></a>
		</div>
	</div>
</body>
</html>