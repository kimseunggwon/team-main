<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rev" tagdir="/WEB-INF/tags/review"%>
<%@ taglib prefix="bot" tagdir="/WEB-INF/tags/botnav"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>구독취소신청서 보기</title>
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

.review-star-child {
	padding: 5px;
	background-color: white;
	border: none;
	outline: none;
}

#jinah-star1, #jinah-star2, #jinah-star3, #jinah-star4, #jinah-star5 {
	width: 50px;
	height: 50px;
	color: #ffe62e;
}

#review-like-btn {
	padding: 5px;
	background-color: white;
	border: none;
	outline: none;
}


#re-write-content {
	display: flex;
	flex-direction: column;
	align-content: center;
}

/* 왜 안될까? */
#jinah-search-form1 {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	align-content: center;
}
</style>
<script type="text/javascript">
$(function() {
	$("#removeBTN").click(function() {
		let bno = "${board.bno}";
		
		$.ajax({
				type : "POST",
				data : {bno : bno},
				url : "${appRoot}/cancelSubs/cancelSubsRemove",
				success : function() {
					alert("삭제 되었습니다");
					location.href='${appRoot}/cancelSubs/cancelSubsBoard'; 
				}
		})
	})
	
	$("#refundCashBTN").click(function() {
		let url = "https://admin.iamport.kr/settings#tab_profile";
		window.open(url);
	})
	
	$("#refundBTN").click(function() {
		$.ajax({
			type : "POST",
			data : {subsid : subsid},
			url : "${appRoot}/cancelSubs/cancelSubsRemove",
			success : function() {

			}
		})
	})
})
</script>

</head>
<body style="margin-top: 60px">

	<rev:navbar></rev:navbar>

	<div class="container">
		<div class="row justify-content-center" style="padding: 70px;">
			<a href="${appRoot }/member/main"> <img alt="jinah-logo"
				src="${appRoot }/resources/image/others/brand_logo_400px.png">
			</a>
			<div style="margin-top: 2%"><b>구독취소게시판 </b></div>
		</div>
	</div>
	
	<div class="container">
		<div id="re-write-content" class="container">
		<div class="row justify-content-center">
			<div class="col-8">
					<!-- 제목 -->

					<div class="item form-group">
						<label for="re-input1">제목</label> 
						<input id="re-input1" class="form-control" value="${board.title }" readonly>
					</div>
					<!-- 내용 -->
					<div class="item form-group">
						<label for="re-textarea1">내용</label>
						<textarea id="contents" class="form-control" cols="2" rows="10" readonly>
						<c:out value="${board.content }" />
						</textarea>
					</div>

					<!-- 작성자 -->
					<div class="item form-group">
						<label for="re-input3">작성자</label> 
						<input id="subsid" class="form-control" value="${board.subsid }" readonly>
					</div>
					
					<div>
					<c:url value="/cancelSubs/cancelSubsModify" var="modifyUrl">
						<c:param name="bno" value="${board.bno }" />
					</c:url>
					
					<a href="${modifyUrl }">
						<button class="btn btn-primary">수정</button>
					</a>
						<button id="removeBTN" class="btn btn-primary" style="background-color:#E61B7B; border-color: #E61B7B">삭제</button>
						<button id="refundCashBTN" class="btn btn-primary" style="background-color:#454144;border-color: #454144">환급모드</button>
						<button id="refundBTN" class="btn btn-primary" style="background-color:#454144;border-color: #454144">환불승인</button>
					</div>
			</div>
		</div>
	</div>
	</div>

	<bot:botnav></bot:botnav>
</body>
</html>