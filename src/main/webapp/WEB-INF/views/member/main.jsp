<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags/MainMapTags"%>
<%@ taglib prefix="hel" tagdir="/WEB-INF/tags/help"%>
<%@ taglib prefix="bot" tagdir="/WEB-INF/tags/botnav"%>
<%@ taglib prefix="main" tagdir="/WEB-INF/tags/main"%>

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
.button1 {
	background-color: #169EF2;
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	font-size: 18px;
	margin: 4px 2px;
	opacity: 1;
	transition: 0.3s;
	display: inline-block;
	text-decoration: none;
	cursor: pointer;
	-webkit-border-radius: 40px;
	-moz-border-radius: 40px;
	border-radius: 40px;
	width:200px;
    font-family: 'GongGothicMedium';
}
.button1:hover {
	background: #0583F2;
}
</style>


<!--Tawk.to 실시간 채팅 -->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/6034acd39c4f165d47c618a9/1ev6sa12g';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})(); 
</script>



<!-- 구독 신청 버튼 권한 부여 -->
<script type="text/javascript">
$(function(){
	let loginID = "${pinfo.member.userid}";
	$.ajax({
		type: "POST",
		url: "${appRoot}/member/getLoginInfo",
		data: {
			userid : loginID
		},
		success: function(data) {
			
			let confirmID = data;
			console.log(confirmID);
			if(confirmID == "") {
				$("#main-subscribe").show();
				$("#main-subscribe").click(function() {
				location.href = "${appRoot}/subscribe/subsregister";
				})
			} 		
		},
		error : function() {
			console.log("실패")
		}
	})
})
</script>

<script type="text/javascript">
	$(function() {
		let loginid = "${pinfo.member.userid}";
		$.ajax({
			type: "GET",
			url: "${appRoot}/member/getMemberAuth",
			data: {
				userid : loginid
			},
			success: function(data) {
				
				let blackAuth = data;
				console.log(blackAuth);
				if(blackAuth == "ROLE_BLACK") {
					$("#alert1").text("당신은 블랙리스트로 지정되었습니다. 이의가 있을 경우 1:1 문의를 통해 접수해주세요.").addClass("show");
				} else {
					console.log("일반유저")
				}
			}
		});
	});
</script>


</head>
<body>
	<main:navbar></main:navbar>
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
	  
	
	
	<hr>
	
	<div id="alert1" class="alert alert-danger fade" role="alert"> </div>
	
	<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_EMPUSER', 'ROLE_ADMIN')">
		<div class="row justify-content-center">
		
	 	<a href="${appRoot }/review/list?sort=200">
			<input class="btn btn-danger" type="submit" value="사용자 후기!"> 
		 </a>
		</div>
	</sec:authorize>
	
			<br>
		
		<div class="row justify-content-center fixed-bottom">
			<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_BLACK')">
						<a class="btn btn-secondary mb-5"  id="main-subscribe" style="display:none;">구독 신청!</a>
			</sec:authorize>
			
			<sec:authorize access="isAnonymous()">
				<a class="btn btn-secondary mb-5" href="${appRoot}/member/login">구독 신청!</a>
			</sec:authorize>
		</div>

	<bot:botnav></bot:botnav>

</div>
</body>
</html>