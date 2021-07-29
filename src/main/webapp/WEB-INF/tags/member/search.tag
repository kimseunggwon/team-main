<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec"	 uri="http://www.springframework.org/security/tags" %>

<style>

.container-1 input.search{
  width: 300px;
  height: 50px;
  background: rgb(50, 50, 50);
  border: none;
  font-size: 12pt;
  float: left;
  color: rgb(230, 230, 230);
  padding-left: 45px;
  -webkit-border-radius: 40px;
  -moz-border-radius: 40px;
  border-radius: 40px;
  outline-style: none;
}

#select-list {
}
</style>

<!-- Search Start -->
	<div class="container-1 row justify-content-center">
		<form class="d-flex align-items-center"action="${appRoot }/member/usermanagement" method="get">
		
			<div class="item">
				<span
					style="position:absolute; margin-top: 27px; margin-left: 18px"
					class="icon"></span> <input name="userid"
					class="search" type="search"
					id="jinah-search1" placeholder="Search" />
			</div>

			<div class="item">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</div>
		</form>
	</div>
	<!-- Search End -->