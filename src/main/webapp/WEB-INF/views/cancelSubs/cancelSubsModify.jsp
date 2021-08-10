<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rev" tagdir="/WEB-INF/tags/review"%>
<%@ taglib prefix="bot" tagdir="/WEB-INF/tags/botnav"%>

<!DOCTYPE html>
<html>
<head>

<link href="${appRoot }/resources/favicon/brand_logo.png" rel="shortcut icon" type="image/x-icon">

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


#jinah-search-form1 {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	align-content: center;
}
</style>
<script type="text/javascript">
$(function() {
	
	
	
	$("#modeifyBTN").click(function() {
		
	let title = $("#title").val();
	let content = $("#content").val();
	let bno = "${board.bno}";
	let subsid = "${board.subsid }";
	let url = '${appRoot}/cancelSubs/cancelSubsGet?bno=' + bno;
	
	let data = {
				bno : bno,
				subsid : subsid,
				title : title,
				content : content
				}
		$.ajax({
			type : "POST",
			url : "${appRoot}/cancelSubs/cancelSubsModify1",
			data : data,
			success : function() {
				location.href= url;
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
			<div style="margin-top: 2%"><b>구독취소게시판 수정 </b></div>
		</div>
	</div>
	
	<div class="container">
		<div id="re-write-content" class="container">
		<div class="row justify-content-center">
			<div class="col-8">
					<!-- 제목 -->

					<div class="item form-group">
						<label for="re-input1">제목</label> 
						<input id="title" class="form-control" value="${board.title }" >
					</div>
					<!-- 내용 -->
					<div class="item form-group">
						<label for="re-textarea1">내용</label>
						<textarea id="content" class="form-control" cols="2" rows="10" >
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
					

					<button id="modeifyBTN" class="btn btn-primary">수정</button>
					</div>
			</div>
		</div>
	</div>
	</div>

	<bot:botnav></bot:botnav>
</body>
</html>