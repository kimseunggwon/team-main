<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<link href="${appRoot }/resources/favicon/brand_logo.png" rel="shortcut icon" type="image/x-icon">

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>비밀번호 찾기</title>
<style type="text/css">
	@font-face {
	    font-family: 'GongGothicMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	h5 {
	font-family: GongGothicMedium;
	font-size: 15px;
	}
	.ps_box {
    display: inline-block;
    position: relative;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 110px 10px 14px;
    background: #fff;
    box-sizing: border-box;
    vertical-align: top;
	}
	.ps_boxv {
    display: inline-block;
    position: relative;
    width: 100%;
    height: 100%px;
    border: solid 1px #dadada;
    padding: 10px 10px 10px 14px;
    background: #fff;
    box-sizing: border-box;
    vertical-align: top;
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
    font-family: Noto Sans KR,sans-serif,Malgun Gothic,맑은 고딕,Dotum,돋움,Tahoma;
	}
	.button:hover {
		background: #0583F2;
	}
</style>

<script type="text/javascript">
var passwordfin = false;

$(function() {
	$("#signup").click(function() {
		
		var userid = $("#sang-userid").val();
		var idName = $("#sang-userName").val();	
		var idEmail = $("#sang-userEmail").val();
		var data = {userid : userid, userName : idName, userEmail : idEmail};
		
		$.ajax({
			type: "post",
			url: "${appRoot}/member/findpw",
			data : JSON.stringify(data),
			contentType : "application/json",
			success: function (data) {
				
				if (data == 'success') {
					
					$(".result").removeAttr("hidden");
					
				} else if (data == 'exist') {
					
					alert("일치하는 아이디, 이름과 Email이 없습니다.");
					
					$(".result").attr("hidden", "hidden");
				}
				
				
			},
			error: function() {
				alert("정확한 정보를 적어주세요.");
				$("#sang-userid").val("");
				$("#sang-userName").val("");
				$("#sang-userEmail").val("");
				$(".result").attr("hidden", "hidden");
			}
			
		});
		
	});
	
	$("#sang-pw-conform, #sang-pw").keyup(function() {
		var pw1 = $("#sang-pw").val();
		var pw2 = $("#sang-pw-conform").val();
		var submitBtn = $("#signup-btn1");
		passwordConfirm = false;
		
		if (pw1 != pw2) {
			passwordConfirm = false;
			$("#password-message").removeClass("text-success");
			$("#password-message").addClass("text-danger");
			$("#password-message").text("패스워드가 일치하지 않습니다.");	
		} else {
			
			if(pw1 == ""){
				passwordConfirm = false;
				$("#password-message").text("패스워드를 입력해 주세요.");
			}else{
				passwordConfirm = true;
				$("#password-message").removeClass("text-danger");
				$("#password-message").addClass("text-success");
				$("#password-message").text("패스워드가 일치합니다.");
				passwordfin = true;
			}
		}
	});
});
</script>
</head>
<body>
</head>
<body>
<div class="container">
	<div style="text-align: center;" class="row">
		<div class="col-12 mt-5">
		
			<div class="row justify-content-center mt-5">
				<a style="text-decoration: none;" href="${appRoot }/member/main">
					<img id="" alt="" src="${appRoot }/resources/image/others/brand_logo_400px.png">
				</a>
			</div>
			
			<form action="">
				<div class="row mt-5">
				</div>
				<div style="margin: 0 auto;" class="col-5">
				<div style="text-align: left;">
					<h5>
						ID
					</h5>
				</div>
				</div>
				<div class="ps_box col-5">
					<input style="border:none; outline: none; width: 330px;" type="text" id="sang-userid" name="userid" class="" title="userid" maxlength="30" autofocus>
				</div>
				<div style="margin-top: 25px"></div>
				<div style="margin: 0 auto;" class="col-5">
				<div style="text-align: left;">
					<h5>
						이름
					</h5>
				</div>
				</div>
				<div class="ps_box col-5">
					<input style="border:none; outline: none; width: 330px;" type="text" id="sang-userName" name="userName" class="" title="userName" maxlength="30" autofocus>
				</div>
				<div style="margin-top: 25px"></div>
				<div style="margin: 0 auto;" class="col-5">
				<div style="text-align: left;">
					<h5>
						E-mail
					</h5>
				</div>
				</div>
				<div class="ps_box col-5">
					<input style="border:none; outline: none; width: 330px;" type="text" id="sang-userEmail" name="userEmail" class="" title="userEmail" maxlength="30">
				</div>
				<div style="margin-top: 25px"></div>
				
				<input class="button" type="button" id="signup" value="찾기">
			</form>
			
			<hr hidden class="result">
			
			<form action="">
				<div hidden style="margin: 0 auto;" class="col-5 result">
				<div style="text-align: left;">
					<h5>
						비밀번호
					</h5>
				</div>
				</div>
				<div hidden class="ps_box col-5 result">
					<input style="border:none; outline: none; width: 330px;" type="password" id="sang-pw" name="userpw" class="" title="PW" maxlength="30">
	            </div>
	            <div style="margin-top: 25px"></div>
				
				<div hidden style="margin: 0 auto;" class="col-5 result">
				<div style="text-align: left;">
					<h5>
						비밀번호 확인
					</h5>
				</div>
				</div>
				<div hidden class="ps_box col-5 result">
					<input style="border:none; outline: none; width: 330px;" type="password" id="sang-pw-conform" name="password" class="" title="PW" maxlength="30">
				</div>
				<small hidden style="white-space: pre-wrap;" id="password-message" class="form-text text-danger result"> </small>
				<div style="margin-top: 25px"></div>
				
				<input hidden class="button result" type="button" id="signupchange" value="바꾸기">			
			</form>
			
			
		</div>
	</div>
</div>
</body>
</html>