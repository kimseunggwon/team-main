<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec"	 uri="http://www.springframework.org/security/tags" %>

<!-- 로그인 한 유저의 구독 여부 확인 -->
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
				$("#nav-subs").show();
				$("#nav-subs").click(function() {
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

<%-- Navigation Bar 적용--%>
<div class="container">
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-light justify-content-end"
		style="background-color: white;">
		
		<!-- 구독 여부에 따라서 구독하기가 보이거나 보이지 않음, 블랙리스트 유저이거나 일반 유저일 때만 보이도록 함 -->
		<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_BLACK')">		
		<a class="navbar-brand" id="nav-subs" style="display: none;">구독하기</a>
		</sec:authorize>
		
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarScroll" aria-controls="navbarScroll"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse flex-grow-0  navbar-collapse justify-content-end"
			id="navbarScroll">
			<ul class="navbar-nav my-2 my-lg-0 navbar-nav-scroll"
				style="max-height: 1000px;">
				<li class="nav-item active"><a class="nav-link"
					href="${appRoot }/member/main">Main <span class="sr-only">(current)</span></a>
				</li>
				
				<!-- 1:1 문의글의 상단 navbar를 통해서 모든 권한의 유저는 마이페이지에 접속할 수 있음. -->
				<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_B2BUSER', 'ROLE_EMPUSER', 'ROLE_ADMIN', 'ROLE_BLACK')">
					<li class="nav-item active"><a class="nav-link"
					href="${appRoot }/member/mypage">마이페이지 <span class="sr-only">(current)</span></a>
					</li>
				</sec:authorize>
				
				<li class="nav-item active"><a class="nav-link"
					href="${appRoot }/help/helpdesk">고객센터 <span class="sr-only">(current)</span></a>
				</li>
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item active"><a class="nav-link"
						href="${appRoot }/logout">Logout<span class="sr-only">(current)</span></a>
					</li>
				</sec:authorize>
				<sec:authorize access="!isAuthenticated()">
					<li class="nav-item active"><a class="nav-link"
						href="${appRoot }/member/login">Login<span class="sr-only">(current)</span></a>
					</li>
				</sec:authorize>
			</ul>
		</div>
	</nav>
</div>
