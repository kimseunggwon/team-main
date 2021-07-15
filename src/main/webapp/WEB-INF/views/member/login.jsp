<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>

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
	$("#sang-findid-btn").click(function(e){
		
		var path = '${appRoot}/member/findid';
		$("#sang-login-form").attr("action", path);
		$("#sang-login-form").submit();
		
	});
	$("#sang-findpw-btn").click(function(e){
		
		var path = '${appRoot}/member/findpw';
		$("#sang-login-form").attr("action", path);
		$("#sang-login-form").submit();
		
	});
	
	$("#sang-normal-img").click(function(e){
		e.preventDefault();
		
		var path = '${appRoot}/login';
		$("#sang-login-form").attr("action", path);
		
		$(".b2blogin").attr("hidden", "hidden");
		
		$("#sang-normal-img").attr("src", "${appRoot}/resources/image/로그인2.png");
		$("#sang-b2b-img").attr("src", "${appRoot}/resources/image/사업자 로그인1.png");
	})
	
	$("#sang-b2b-img").click(function(e){
		e.preventDefault();
		
		var path = '${appRoot}/b2blogin';
		$("#sang-login-form").attr("action", path);
		
		$(".b2blogin").removeAttr("hidden");
		
		$("#sang-normal-img").attr("src", "${appRoot}/resources/image/로그인1.png");
		$("#sang-b2b-img").attr("src", "${appRoot}/resources/image/사업자 로그인2.png");
	})
	
})

</script>

</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h1>로그인</h1>
			
			<a href="">
				<img style="text-decoration: none;" id="sang-normal-img" alt="눌러줭" src="${appRoot }/resources/image/로그인2.png">
			</a>
			<a href="">
				<img style="text-decoration: none;" id="sang-b2b-img" alt="눌러줭" src="${appRoot }/resources/image/사업자 로그인1.png">
			</a>
				
			<form id="sang-login-form" action="${appRoot}/login" method="post">
				<div>
					<label for="input1">이름</label>				
					<input id="input1" name="username" autofocus/>
				</div>
				<div>
					<label for="input2">패스워드</label>
					<input id="input2" type="password" name="password" />
				</div>
				<div class="b2blogin" hidden>
					<label for="input2">사업자 번호</label>
					<input id="input2" type="password" name="password" />
				</div>
				
				<div>
					<input name="remember-me" type="checkbox" class="form-check-input" id="checkbox1"> <!-- name어트리뷰트가 가장 중요 -->
					<label class="form-check-label" for="xheckbox1">로그인 유지</label>
				</div>
								
				<div>
					<input id="sang-login-btn" type="submit" value="로그인">
				</div>
				<div>
					<input id="sang-findid-btn" type="submit" value="아이디 찾기">
					<input id="sang-findpw-btn" type="submit" value="비밀번호 찾기">
					<a id="sang-signup-btn" class="btn btn-primary" href="${appRoot }/member/signup">회원가입</a>
				</div>
				
			</form>
		</div>
	</div>	
</div>
</body>
</html>