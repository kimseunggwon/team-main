<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>

<style type="text/css">
.container-1 input.search{
  width: 450px;
  height: 78px;
  background: rgb(136, 201, 242);
  border: none;
  font-size: 12pt;
  float: left;
  color: rgb(5, 131, 242);
  padding-left: 45px;
  -webkit-border-radius: 40px;
  -moz-border-radius: 40px;
  border-radius: 40px;
  outline-style: none;
}
</style>

<script type="text/javascript">

$(function(){
	<%-- 
	$("#submit2").click(function(e){
		e.preventDefault(); */ 
		if (confirm("삭제 하시겠습니까?")){
		
		}
		--%>
		
	/* $("#sang-signup-btn").click(function(e){
	
		var path = '${appRoot}/member/signup';
		$("#sang-login-form").attr("action", path);
		$("#sang-login-form").submit();
		
	}); */
	
	$("#sang-normal-img").click(function(e){
		e.preventDefault();
		
		var path = '${appRoot}/login';
		$("#sang-login-form").attr("action", path);
		
		$("#sang-normal-img").attr("src", "${appRoot}/resources/image/로그인2.png");
		$("#sang-b2b-img").attr("src", "${appRoot}/resources/image/사업자 로그인1.png");
	})
	
	$("#sang-b2b-img").click(function(e){
		e.preventDefault();
		
		var path = '${appRoot}/b2blogin';
		$("#sang-login-form").attr("action", path);
		
		$("#sang-normal-img").attr("src", "${appRoot}/resources/image/로그인1.png");
		$("#sang-b2b-img").attr("src", "${appRoot}/resources/image/사업자 로그인2.png");
	})
	
})

</script>

</head>
<body class="row justify-content-center mt-5">
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h1>로그인</h1>
			
			<div class="row justify-content-center mt-5">
				<a style="text-decoration: none;" href="">
					<img id="sang-normal-img" alt="" src="${appRoot }/resources/image/로그인2.png">
				</a>
				<a style="text-decoration: none;" href="">
					<img id="sang-b2b-img" alt="" src="${appRoot }/resources/image/사업자 로그인1.png">
				</a>
			</div>
			
			
			<div class="row justify-content-center mt-5">
			
			<form id="sang-login-form" action="${appRoot}/login" method="post">
			
	            <br>
	            
				<div class="container-1 row">
					<span style="position: absolute; margin-top: 27px; margin-left: 18px" class="icon"><i class="fas fa-user"></i></span>
					<input name="username" class="search" type="text" id="input1" placeholder="아이디" />
				</div>
				
				<br>
				
				<div class="container-1 row">
					<span style="position: absolute; margin-top: 27px; margin-left: 18px" class="icon"><i class="fas fa-lock"></i></span>
					<input name="password" class="search" type="text" id="input2" placeholder="비밀번호" />
				</div>
	
				<br>
				
				<!-- 		
				<div>
					<label for="input1">이름</label>				
					<input id="input1" name="username" autofocus/>
				</div>
				<div>
					<label for="input2">패스워드</label>
					<input id="input2" type="password" name="password" />
				</div> 
				-->
				
				<div class="row justify-content-end">
					<input name="remember-me" type="checkbox" class="form-check-input" id="checkbox1"> <!-- name어트리뷰트가 가장 중요 -->
					<label style="text-align: right;" class="form-check-label col-12" for="checkbox1">로그인 유지</label>
				</div>
								
				<div class="row justify-content-center mt-5">
					<input id="sang-login-btn" type="submit" value="로그인">
				</div>
				<div class="row justify-content-center" style="text-align: center;">
					<a style="text-decoration: none; color: black;" id="sang-findid-btn" class="col-4" href="${appRoot}/member/findid">아이디 찾기</a>
					<a style="text-decoration: none; color: black;" id="sang-findpw-btn" class="col-4" href="${appRoot}/member/findpw">비밀번호 찾기</a>
					<a style="text-decoration: none; color: black;" id="sang-signup-btn" class="col-4" href="${appRoot }/member/signup">회원가입</a>
				</div>
				
				<hr>
				
				<sec:authorize access="isAuthenticated()">
				  <form action="${appRoot }/logout" method="post">
				  	<input type="submit" class="btn btn-outline-secondary" value="로그아웃">
				  </form>
			  	</sec:authorize>
				
			</form>
			
			</div>
			
		</div>
	</div>	
</div>
</body>
</html>