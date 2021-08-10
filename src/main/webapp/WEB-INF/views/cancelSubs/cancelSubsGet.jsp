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
	/* 작성자 본인 삭제버튼 */
	$("#removeBTN").click(function() {
		let bno = "${board.bno}";
		let subsid = "${board.subsid }"
		let checkMsg = "게시글을 삭제하시겠습니까?"
				
		let check = confirm(checkMsg);	
		if(check) {
		$.ajax({
				type : "POST",
				data : {
					bno : bno,
					subsid : subsid
					},
				url : "${appRoot}/cancelSubs/cancelSubsRemove",
				success : function() {
					alert("삭제 되었습니다");
					location.href='${appRoot}/cancelSubs/cancelSubsBoard'; 
				}
		})	
		} else {
			alert("취소되었습니다.");
		}
	})
	
	/* ADMIN전용 삭제 버튼 */
	$("#removeBTN_ADMIN").click(function() {
		let bno = "${board.bno}";
		let subsid = "${board.subsid }"
		let checkMsg = "게시글을 삭제하시겠습니까?"
				
		let check = confirm(checkMsg);	
		if(check) {
		$.ajax({
				type : "POST",
				data : {
					bno : bno,
					subsid : subsid
					},
				url : "${appRoot}/cancelSubs/cancelSubsRemoveADMIN",
				success : function() {
					alert("삭제 되었습니다");
					location.href='${appRoot}/cancelSubs/cancelSubsBoard'; 
				}
		})	
		} else {
			alert("취소되었습니다.");
		}
	})
	
	$("#refundCashBTN").click(function() {
		let url = "https://admin.iamport.kr/settings#tab_profile";
		window.open(url);
	})
	
	$("#refundBTN").click(function() {
		let subsid = $("#subsid").val();
		let bno = "${board.bno}";

				let checkMsg;
				checkMsg = subsid + "님의 구독탈퇴를 진행하시겠습니까?"
				checkMsg += "\n환급모드로 환불을 진행 먼저 진행 후 승인해주시기 바랍니다"
				checkMsg += "\n*환급승인 시 구독탈퇴가 됩니다"
				let check = confirm(checkMsg);
				if(check) {
					$.ajax({
						type : "POST",
						data : {
							subsid : subsid,
							bno : bno
							},
						url : "${appRoot}/cancelSubs/cancelSubsRefund",
						success : function(data) {
							console.log(data.userPhonenum);
							console.log(data.SubsName);
							 var userPhonenum = data.userPhonenum;
							 var SubsName = data.SubsName;
							
							 $.ajax({
				                   url:"${appRoot}/cancelSubs/sms.do",
				                   type:"post",
				                   data:{
				                	   userPhonenum: userPhonenum,
				                	   SubsName : SubsName
				                	   },
				                 success:function(){

				                   },
				                   error : function() {
						                alert("해당 휴대폰으로 인증번호를 발송했습니다");
										alert("구독서비스 취소가 승인 되었습니다");
				 						location.href='${appRoot}/cancelSubs/cancelSubsBoard';  
				                   }
				                   
				                }); 
							
						}

					})
				} else {
					alert("환불 승인 취소");
				}
		
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
					
					

						<c:set var="boardId" value="${board.subsid }"/> 
						<c:set var="loginId" value="${pinfo.member.userid }"/>
						<c:if test="${loginId eq boardId }">
							<a href="${modifyUrl }">
								<button class="btn btn-primary">수정</button>
							</a>
							<button id="removeBTN" class="btn btn-primary" style="background-color:#E61B7B; border-color: #E61B7B">삭제</button>
						</c:if>
						


					
					
						
						<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
							<button id="removeBTN_ADMIN" class="btn btn-primary" style="background-color:#E61B7B; border-color: #E61B7B">삭제</button>
							<button id="refundCashBTN" class="btn btn-primary" style="background-color:#454144;border-color: #454144">환급모드</button>
							<button id="refundBTN" class="btn btn-primary" style="background-color:#454144;border-color: #454144">환불승인</button>
						</sec:authorize>
					</div>
			</div>
		</div>
	</div>
	</div>

	<bot:botnav></bot:botnav>
</body>
</html>