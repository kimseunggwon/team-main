<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec"	 uri="http://www.springframework.org/security/tags" %>


<%-- Navigation Bar 적용--%>
<div class="container">
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-light justify-content-end"
		style="background-color: white;">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarScroll" aria-controls="navbarScroll"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse flex-grow-0  navbar-collapse justify-content-end"
			id="navbarScroll">
			<ul class="navbar-nav my-2 my-lg-0 navbar-nav-scroll"
				style="max-height: 1000px;">
				
				<!-- 관리자 계정에게만 고객관리와 1:1 문의 글 확인 메뉴가 보이도록 함. -->
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li class="nav-item active"><a class="nav-link"
					href="${appRoot }/member/usermanagement">고객관리 <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item active"><a class="nav-link"
					href="${appRoot }/help/askListAdmin">1:1 문의 글 확인 <span class="sr-only">(current)</span></a>
				</li>
				</sec:authorize>
				
				<!-- 로그인 한 계정만 고객센터 접속과 마이페이지 확인 메뉴가 보이도록 함.-->
				<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_B2BUSER', 'ROLE_EMPUSER', 'ROLE_BLACK')">
				<li class="nav-item active"><a class="nav-link"
					href="${appRoot }/help/helpdesk">고객센터 <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item active"><a class="nav-link"
					href="${appRoot }/member/mypage">마이페이지 <span class="sr-only">(current)</span></a>
				</li>
					
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item active"><a class="nav-link"
						href="${appRoot }/logout">Logout<span class="sr-only">(current)</span></a>
					</li>
				</sec:authorize>
				<sec:authorize access="!isAuthenticated()">
					<li class="nav-item active"><a class="nav-link"
						href="${appRoot }/member/login">Login<span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="${appRoot }/member/signup">
							회원가입
						</a> 
					</li>
				</sec:authorize>
			</ul>
		</div>
	</nav>
</div>
