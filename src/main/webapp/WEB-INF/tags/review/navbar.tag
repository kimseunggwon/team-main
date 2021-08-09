<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec"	 uri="http://www.springframework.org/security/tags" %>

<%-- Pagination 적용 --%>
<!-- 리뷰 목록 (list)  -->
<c:url value="/review/list" var="listUrl">
	<c:if test="${not empty recri.pageNum }">
		<c:param name="pageNum" value="${recri. pageNum }"></c:param>
	</c:if>
	<c:if test="${not empty recri.amount }">
		<c:param name="amount" value="${recri.amount }"></c:param>
	</c:if>
		<c:param name="keyword" value="${recri.keyword }"></c:param>
		<c:param name="type" value="${recri.type }"></c:param>
</c:url>

<!-- 리뷰 작성 (write) -->
<c:url value="/review/write" var="writeUrl">
	<c:if test="${not empty recri.pageNum }">
		<c:param name="pageNum" value="${recri.pageNum }"></c:param>
	</c:if>
	<c:if test="${not empty recri.amount }">
		<c:param name="amount" value="${recri.amount }"></c:param>
	</c:if>
		<c:param name="keyword" value="${recri.keyword }"></c:param>
		<c:param name="type" value="${recri.type }"></c:param>
</c:url>

<!-- 나의 리뷰 -->
<c:url value="/review/list" var="myListUrl">
	<c:if test="${not empty recri.pageNum }">
		<c:param name="pageNum" value="${recri.pageNum }"></c:param>
	</c:if>
	<c:if test="${not empty recri.amount }">
		<c:param name="amount" value="${recri.amount }"></c:param>
	</c:if>
		<c:param name="keyword" value="${pinfo.member.userNickname }"></c:param>
		<c:param name="type" value="W"></c:param>
</c:url>

<%-- Navigation Bar 적용--%>
<div class="container">
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-light justify-content-end"
		style="background-color: white;">
		<a class="navbar-brand" href="${appRoot }/subscribe/register">구독하기</a>
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
				<sec:authorize access="hasRole('ROLE_USER')">
					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="${appRoot }/member/mypage"
						id="navbarScrollingDropdown" role="button" data-toggle="dropdown"
						aria-expanded="false"> 마이페이지 </a>
						<ul class="dropdown-menu"
							aria-labelledby="navbarScrollingDropdown">
							<li><a class="dropdown-item" href="${appRoot }/member/mypage">나의 회원정보</a></li>
							<li><a class="dropdown-item" href="#">나의 구독정보</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="${myListUrl }">나의 리뷰</a></li>
						</ul></li>
				</sec:authorize>
				<li class="nav-item active"><a class="nav-link"
					href="${appRoot }/help/helpdesk">1:1 문의 <span class="sr-only">(current)</span></a>
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
