<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	 uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="rev" tagdir="/WEB-INF/tags/member"%>
<%@ taglib prefix="bot" tagdir="/WEB-INF/tags/botnav"%>

<!DOCTYPE html>
<html>
<head>

<link href="${appRoot }/resources/favicon/brand_logo.png" rel="shortcut icon" type="image/x-icon">

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>로그인</title>

<style type="text/css">
@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
	font-family: 'GongGothicMedium';
}
.container-1 input.search{
  width: 420px;
  height: 78px;
  background: rgb(242, 242, 242);
  border: none;
  font-size: 12pt;
  float: left;
  color: rgb(0, 0, 0);
  padding-left: 45px;
  -webkit-border-radius: 40px;
  -moz-border-radius: 40px;
  border-radius: 40px;
  outline-style: none;
}
.button {
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
	width:420px;
    font-family: 'GongGothicMedium';
}
.button:hover {
	background: #0583F2;
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
		
		var path = '${appRoot}/member/login';
		$("#sang-login-form").attr("action", path);
		
		$("#sang-normal-img").attr("src", "${appRoot}/resources/image/로그인2.png");
		$("#sang-b2b-img").attr("src", "${appRoot}/resources/image/사업자 로그인1.png");
	})
	
	$("#sang-b2b-img").click(function(e){
		e.preventDefault();
		
		var path = '${appRoot}/member/b2blogin';
		$("#sang-login-form").attr("action", path);
		
		$("#sang-normal-img").attr("src", "${appRoot}/resources/image/로그인1.png");
		$("#sang-b2b-img").attr("src", "${appRoot}/resources/image/사업자 로그인2.png");
	})
})

</script>

<script>
    $(document).ready(function()
    {
        var userId = getCookie("cookieUserId"); 
        $("input[name='username']").val(userId); 
         
        if($("input[name='username']").val() != ""){ // Cookie에 만료되지 않은 아이디가 있어 입력됬으면 체크박스가 체크되도록 표시
            $("input[name='remember']").attr("checked", true);
        }
         
        $("#sang-login-btn", $('#sang-login-form')).click(function(){ // Login Form을 Submit할 경우,
            if($("input[name='remember']").is(":checked")){ // ID 기억하기 체크시 쿠키에 저장
                var userId = $("input[name='username']").val();
                setCookie("cookieUserId", userId, 7); // 7일동안 쿠키 보관
            } else {
                deleteCookie("cookieUserId");
            }
        });             
    })
 
    function setCookie(cookieName, value, exdays){
        var exdate = new Date();
        exdate.setDate(exdate.getDate()+exdays);
        var cookieValue = escape(value)+((exdays==null)? "": "; expires="+exdate.toGMTString());
        document.cookie = cookieName+"="+cookieValue;
    }
    function deleteCookie(cookieName){
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate()-1);
        document.cookie = cookieName+"= "+"; expires="+expireDate.toGMTString();
    }
    function getCookie(cookieName){
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if(start != -1){
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1) end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
         
    }
</script>

</head>
<body style="overflow-x: hidden;" class="row justify-content-center mt-5">
<rev:navbar></rev:navbar>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="row justify-content-center mt-5">
				<a style="text-decoration: none;" href="${appRoot }/member/main">
					<img id="" alt="" src="${appRoot }/resources/image/others/brand_logo_400px.png">
				</a>
			</div>
			
			<div class="row justify-content-center mt-5">
				<a style="text-decoration: none;" href="">
					<img id="sang-normal-img" alt="" src="${appRoot }/resources/image/로그인2.png">
				</a>
				<a style="text-decoration: none;" href="">
					<img id="sang-b2b-img" alt="" src="${appRoot }/resources/image/사업자 로그인1.png">
				</a>
			</div>
			
			
			<div>
				<img style="position: absolute; z-index: -1" alt="" src="${appRoot }/resources/image/로그인 테두리3.png">
			</div>
			<div class="row justify-content-center mt-5">
			
			<form id="sang-login-form" action="${appRoot}/login" method="post">
			
				
	            <br>
	            
				<div class="container-1 row">
					<span style="position: absolute; margin-top: 27px; margin-left: 18px" class="icon"><i class="fas fa-user"></i></span>
					<input spellcheck="false" autocomplete="off" autofocus name="username" class="search" type="text" id="input1" placeholder="아이디" />
				</div>
				
				<br>
				
				<div class="container-1 row">
					<span style="position: absolute; margin-top: 27px; margin-left: 18px" class="icon"><i class="fas fa-lock"></i></span>
					<input name="password" class="search" type="password" id="input2" placeholder="비밀번호" />
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
				
				<div class="row align-items-center">
					<input id="checkbox1" type="checkbox" name="remember-me" class="col-1"> <!-- name어트리뷰트가 가장 중요 -->
					<label class="form-check-label col-5" for="checkbox1">로그인 유지</label>
					<input id="checkbox2" type="checkbox" name="remember" value="1" class="col-1">
					<label class="form-check-label col-5" for="checkbox2">아이디 저장</label>
				</div>
				
				<div style="margin-top: 20px;"class="row justify-content-center">
					<input class="button" id="sang-login-btn" type="submit" value="로그인">
				</div>
				<div class="row justify-content-center" style="text-align: center; margin-top:20px;">
					<a style="text-decoration: none; color: black;" id="sang-findid-btn" class="col-4" href="${appRoot}/member/findid">아이디 찾기</a>
					<a style="text-decoration: none; color: black;" id="sang-findpw-btn" class="col-4" href="${appRoot}/member/findpw">비밀번호 찾기</a>
					<a style="text-decoration: none; color: black;" id="sang-signup-btn" class="col-4" href="${appRoot }/member/signup">회원가입</a>
				</div>
				
				<%-- <sec:authorize access="isAuthenticated()">
				  <form action="${appRoot }/logout" method="post">
				  	<input type="submit" class="btn btn-outline-secondary" value="로그아웃">
				  </form>
			  	</sec:authorize> --%>
				
			</form>
			
			</div>
			
		</div>
	</div>
	<div style="margin-top: 50px"></div>
	<bot:botnav></bot:botnav>
</div>
</body>
</html>