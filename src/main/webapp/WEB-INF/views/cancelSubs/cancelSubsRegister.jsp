<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec"	 uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="rev" tagdir="/WEB-INF/tags/review" %>
<%@ taglib prefix="bot" tagdir="/WEB-INF/tags/botnav" %>



<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<meta charset="UTF-8">
<title>구독취소신청 등록</title>

<style type="text/css">
@font-face {
	font-family: 'GongGothicMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff')
		format('woff');
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

#re-write-content {
	display: flex;
	flex-direction: column;
	align-content: center;
}

#re-input2-label {
	padding: 6px 25px;
	background-color: #FF84A9;
	border-radius: 4px;
	color: white;
	cursor: pointer;
}

/* 왜 안될까? */
#jinah-search-form1 {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	align-content: center;
}
</style>

<link rel="stylesheet" type="text/css"
	href="${appRoot }/resources/css/uploadajax.css">
	
<script type="text/javascript">
	$(function() {
		const contentsVAL = 
		`구독취소 양식
고객 ID:
고객번호:
고객이름:

*빨래널자의 구독계약기간은  14일이며, 총 6번의 서비스가 제공됩니다.(주당 3회)
 구독 취소 시, 결제금액에 남은 계약기간의 횟수를 나눠 환급해드립니다.
ex> 서비스를 4회 받으셨으면 2회는 정기결제 금액에서 환급됩니다.
*구독 취소 다음 날 부터 서비스는 진행 되지 않습니다.
(오후 6시 이후에 구독을 취소 하셨을 경우 모레부터 서비스가 진행되지 않습니다.)`;
		
		
		$("#contents").val(contentsVAL);
		
		
		$("#write-submit").click(function() {
			let title = $("#re-input1").val();
			let content = $("#contents").val();
			let subsid = $("#subsid").val();
			
			data = {
					subsid : subsid,
					title : title,
					content : content
			}
			$.ajax({
				type : "POST",
				data : data,
				url : "${appRoot}/cancelSubs/cancelSubsRegister",
				success : function() {
					location.href='${appRoot}/cancelSubs/cancelSubsBoard';
				}
				
			})
		})
		
		
	})
</script>

</head>
<body style="overflow-x: hidden;">

	<rev:navbar></rev:navbar>

	<div class="container">
		<div class="row justify-content-center" style="padding: 70px;">
			<a href="${appRoot }/member/main"> <img alt="jinah-logo"
				src="${appRoot }/resources/image/others/brand_logo_400px.png">
			</a>
			<div style="margin-top: 2%"><b>구독취소게시판 </b></div>
		</div>
	</div>
	
	
	<div id="re-write-content" class="container">
		<div class="row justify-content-center">
			<div class="col-8">
					<!-- 제목 -->

					<div class="item form-group">
						<label for="re-input1">제목</label> 
						<input id="re-input1" class="form-control"  type="text" minlength="3"
							placeholder="제목을 입력해주세요." required>
					</div>
					<!-- 내용 -->
					<div class="item form-group">
						<label for="re-textarea1">내용</label>
						<textarea id="contents" class="form-control" cols="2" rows="10"></textarea>
					</div>

					<!-- 작성자 -->
					<div class="item form-group">
						<label for="re-input3">작성자</label> 
						<input id="subsid" class="form-control" value="${pinfo.member.userid }" readonly>
					</div>
					
					<input class="btn btn-primary" id="write-submit" type="submit"
						value="구독취소 신청">
			</div>
		</div>
	</div>
	
	<bot:botnav></bot:botnav>
</body>
</html>