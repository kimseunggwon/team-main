<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec"	 uri="http://www.springframework.org/security/tags" %>


<%-- Navigation Bar 적용--%>
<div class="container">
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-light justify-content-end"
		style="background-color: white;">
		
		<div class="collapse flex-grow-0  navbar-collapse justify-content-end"
			id="navbarScroll">
			<ul class="navbar-nav my-2 my-lg-0 navbar-nav-scroll"
				style="max-height: 1000px;">
				
				<li class="nav-item active"><a class="nav-link"
						href="${appRoot }/member/main">main <span class="sr-only">(current)</span></a>
					</li>
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li class="nav-item active"><a class="nav-link"
						href="${appRoot }/member/usermanagement">고객관리 <span class="sr-only">(current)</span></a>
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
				</sec:authorize>
			</ul>
		</div>
	</nav>
</div>