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

<mem:mybar></mem:mybar>
 


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
/*사용자 리뷰 관련 박스 */
#reviewbox {
	border: 3px solid #0583F2;
	border-radius: 10%;
}

/*구독 관련 정보 박스 */
#subsinfo_box {
	border: 3px solid #0583F2;
	border-radius: 10%;
}
/* 서비스 관련 정보 박스 */
#service_box {
	border: 3px solid #0583F2;
	border-radius: 10%;
}
/* 세탁방 위치 관련 정보 박스 */
#location {
	border: 3px solid #0583F2;
	border-radius: 10%;
}
</style>


<!-- Tawk.to 실시간 채팅 -->
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




		<div class="row justify-content-center  mt-5 mb-5">


			<!-- 빨래 널자(회사) 로고 이미지가 들어갈 위치 -->
			<div class="row justify-content-center">
				<a href="${appRoot }/member/main"> 
					<img src="${appRoot }/resources/image/others/brand_logo_300px.png" alt="...">
				</a>
			</div>

		</div>



		<hr>
	
	<div id="alert1" class="alert alert-danger fade" role="alert"> </div>
	
	
	<br>
	
	<div id="reviewbox">
		
		<h1 class="text-center mt-4">빨래널자의 사용후기! 확인해볼까요?</h1>
		
		<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  				<div class="carousel-inner">
    				<div class="carousel-item active">
      					<img src="..." class="d-block w-100" alt="...">
    				</div>
    				<div class="carousel-item">
     					<img src="..." class="d-block w-100" alt="...">
    				</div>
    				<div class="carousel-item">
      					<img src="..." class="d-block w-100" alt="...">
    				</div>
  				</div>
  				
  			<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
   		 		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    	 		<span class="sr-only">Previous</span>
 	 		</a>
 	 		
 			<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    			<span class="carousel-control-next-icon" aria-hidden="true"></span>
    			<span class="sr-only">Next</span>
  			</a>
		</div>
		
		<div class="card-group">
 			<div class="card ml-3 mr-3" style="border-radius: 10%; border : 3px solid #0583F2">
    			<div class="card-body">
      				<h5 class="card-title">12개월 연속 구독중인 "빨래싫어!" 님의 리뷰</h5>
      				<p class="card-text">빨래를 귀찮아하고 싫어하지만 옷은 많은 저한테는 딱인 서비스였어요. 처음에는 1달만 써봐야지! 하고...</p>
      				<p class="card-text"><small class="text-muted"><a href="#"><더보기></a></small></p>
    			</div>
  			</div>
 			<div class="card ml-3 mr-3" style="border-radius: 10%; border : 3px solid #0583F2">
    			<div class="card-body">
      				<h5 class="card-title">가장 많은 추천을 받은 "리뷰왕" 님의 리뷰</h5>
      				<p class="card-text">빨래널자의 서비스가 제 워라밸을 보장해줬어요. 아무래도 자취하는 입장에서는 제일 하기 싫은게 빨래인데..</p>
      				<p class="card-text"><small class="text-muted"><a href="#"><더보기></a></small></p>
    			</div>
  			</div>
		</div>
		
		
		<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_EMPUSER', 'ROLE_ADMIN') or isAnonymous()">
			<div class="row justify-content-center mt-3 mb-3">
		
	 		<a href="${appRoot }/review/list?sort=200">
				<input class="btn btn-danger" type="submit" value="사용자 후기!"> 
			 </a>
			</div>
		</sec:authorize>
	</div>
	
	<div class="row mt-5" id="subsinfo_box">
	
	</div>
	
	
	<div class="row mt-5" id="service_box">
	
	</div>
	
	<div class = "row mt-5" id="location">
	
	</div>
	
	<br>
		
		<div class="row justify-content-center fixed-bottom">
			<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_BLACK')">
						<a class="btn btn-secondary mb-3"  id="main-subscribe" style="display:none;">구독 신청!</a>
			</sec:authorize>
			
			<sec:authorize access="isAnonymous()">
				<a class="btn btn-secondary mb-3" href="${appRoot}/member/login">구독 신청!</a>
			</sec:authorize>
		</div>

	<bot:botnav></bot:botnav>

</div>
</body>
</html>