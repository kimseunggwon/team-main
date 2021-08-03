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

.btn {
  height: 50px;
  width: 70px;
  display: inline-block;
  background: transparent;
  text-transform: uppercase;
  text-align:center;
  font-style: normal;
  font-size: 12pt;
  letter-spacing: 0.1em;
  color: rgb(20, 20, 20);
  transition: all 0.7s ease-out;
  background: linear-gradient(270deg, rgba(50,50,50,1), rgba(50,50,50,1), rgba(34,34,34,0), rgba(34,34,34,0));
  background-position: 1% 50%;
  background-size: 300% 300%;
  text-decoration: none;
  margin: 0.625rem;
  border: none;
  border: 1px solid rgba(223,190,106,0.3);
  border-radius: 40px;
}

.btn:hover {
  color: rgb(180, 180, 180);
  border: 1px solid rgba(0,0,0,1);
  color: $white;
  background-position: 99% 50%;
}

article {
  height: 100vh;
}
</style>

<!-- Search Start -->
	<div class="container-1 row justify-content-center">
		<form class="d-flex align-items-center"action="${appRoot }/member/usermanagement" method="get">
		
			<div class="item">
				<span
					style="position:absolute; margin-top: 27px; margin-left: 18px"
					class="icon"></span> <input autocomplete="off" name="userid"
					class="search" type="search"
					id="jinah-search1" placeholder="Search" />
			</div>

			<div class="item">
				<button class="btn my-2 my-sm-0" type="submit">검색</button>
			</div>
		</form>
	</div>
	<!-- Search End -->