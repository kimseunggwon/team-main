<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
<style type="text/css">
	h5 {
	font-weight:bold;
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
</style>

<script type="text/javascript">
$("#signup").click(function() {
	
	console.log("ㅎㅎㅎㅎ");
	var idName = $("#sang-userName").val();	
	var idEmail = $("#sang-userEmail").val();
	var data = {id : idName, email : idEmail};
	
	$.ajax({
		type: "post",
		url: "${appRoot}/member/findid",
		data : JSON.stringify(data),
		contentType : "application/json",
		success: function (data) {
			if (data == "success") {
				console.log("있는 아이디.");
				
				$(".result").removeAttr("hidden");
			} else if (data == "exist") {
				console.log("없는 아이디.");
				
				$(".result").attr("hidden", "hidden");
			}
			
		},
		error: function() {
			alert("정확한 정보를 적어주세요.");
			$("#sang-userName").val("");
			$("#sang-userEmail").val("");
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
		<h1 class="mt-5">아이디 찾기</h1>
		<div class="col-12 mt-5">
			
			<form action="">
				<div style="margin: 0 auto;" class="col-5">
				<div style="text-align: left;">
					<h5>
						이름
					</h5>
				</div>
				</div>
				<div class="ps_box col-5">
					<input style="border:none; outline: none; width: 330px;" type="text" id="sang-userName" name="userName" class="" title="userName" maxlength="30">
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
				
				<input type="button" id="signup" value="버튼">
			</form>
			
			<div hidden style="margin: 0 auto;" class="col-5 result">
			<div style="text-align: left;">
				<h5>
					고객님의 정보와 일치하는 아이디 목록입니다.
				</h5>
			</div>
			</div>
			<div hidden class="ps_boxv col-5 result">
				<input style="border:none; outline: none; width: 330px;" type="text" id="" name="userEmail" class="" title="userEmail" maxlength="30">
			</div>
			<div style="margin-top: 25px"></div>
			
			
			
		</div>
	</div>
</div>
</body>
</html>