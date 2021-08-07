<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>아이디 찾기</title>
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

$(function() {
	$("#signup").click(function() {
		
		var idName = $("#sang-userName").val();	
		var idEmail = $("#sang-userEmail").val();
		var data = {userName : idName, userEmail : idEmail};
		
		$.ajax({
			type: "post",
			url: "${appRoot}/member/findid",
			data : JSON.stringify(data),
			contentType : "application/json",
			success: function (data) {
				console.log(data);
				if (data.length > 0) {
					
					$(".result").removeAttr("hidden");
					showList(data);
					
				} else {
					alert("일치하는 이름과 Email이 없습니다.");
					
					$(".result").attr("hidden", "hidden");
				}
				
			},
			error: function() {
				alert("정확한 정보를 적어주세요.");
				$("#sang-userName").val("");
				$("#sang-userEmail").val("");
				$(".result").attr("hidden", "hidden");
			}
			
		});
		
	});
	
	function showList(list) {
		var container = $("#resultid").empty();
		
		for (var userid of list) {
			var useridHTML = `
				<li class="media" id="userid\${userid}" data-rno="\${userid}">
					<div class="media-body">
						<p style="margin: 8px 0px; font-family: GongGothicMedium;">\${userid}</p>
					</div>
				</li>`;
			
			container.append(useridHTML);
		}
	}
	
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
			
			<div hidden style="margin: 0 auto;" class="col-5 result">
			<div style="text-align: left;">
				<h5>
					고객님의 정보와 일치하는 아이디 입니다.
				</h5>
			</div>
			</div>
			<div id="resultid" hidden class="ps_boxv col-5 result">
				<!-- 여긴 id불러오는곳!여긴 id불러오는곳!여긴 id불러오는곳!여긴 id불러오는곳!여긴 id불러오는곳! -->
			</div>
			<div style="margin-top: 25px"></div>
			
			
			
		</div>
	</div>
</div>
</body>
</html>