<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	
	
	// 아이디 중복 확인
	$("#id-dup-btn").click(function() {
		var idVal = $("#sang-id").val();
		var messageElem = $("#id-message");
		canUseId = false;
		toggleEnableSubmit();
		
		if (idVal == "") {
			// 아이디가 입력되지 않았을 때
			$("#id-message").removeClass("text-success");
			$("#id-message").addClass("text-danger");
			messageElem.text("아이디를 입력해주세요.");
			
			
		} else {
			// 아이디가 입력되어있을 때
			var data = {id : idVal};
			$.ajax({
				type: "get",
				url: "${appRoot}/member/dup",
				data: data,
				success: function (data) {
					if (data == "success") {
						console.log("사용 가능한 아이디");
						canUseId = true;
						var ans = confirm("사용 가능한 아이디 입니다. 사용하시겠습니까?");
						
							if(ans){
								$("#id-message").removeClass("text-danger");
								$("#id-message").addClass("text-success");
								messageElem.text("사용가능한 아이디 입니다.");											
								$("#signup-input1").attr("readonly", "readonly");
							}
							
					} else if (data == "exist") {
						console.log("사용 불가능한 아이디");
						$("#id-message").removeClass("text-success");
						$("#id-message").addClass("text-danger");
						messageElem.text("이미 있는 아이디 입니다.");
					}
					
					toggleEnableSubmit();
				}, 
				error: function() {
					console.log("아이디 중복 체크 실패");
				}
				
			});
		}
	})
	
	
	
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
			}
		}
	});
	
	/* $("#sang-authnum").click(function() {
		var idE = $("#sang-email").val();
		var idI = $("#sang-inz-input").val();
		
		$.ajax({
			type: "post",
			url: "${appRoot}/member/authNumber",
			data: JSON.stringify(idE, idI),
			contentType: "application/json",
			success: function() {
				console.log("성공");
				$("#sang-inz-btn, #sang-inz-input").removeAttr("hidden");
			},
			error: function() {
				console.log("실패");
			}
		});
		
		alert("전송 완료.");
	}); */
	
	var authurl = "${appRoot}"+"/member/authNumber";
	
	$("#sang-authnum").click(function() {
		var idE = $("#sang-email").val();
		/* var idP = $("#sang-pnum").val(); */
		
		$.post(authurl, {idE: idE/* ,idP: idP */}, function(data) {
			if (data == 'ok1') {
				$("#sang-inz-input, #sang-inz-btn").removeAttr("hidden");
			} else {
			
			}
		});
	});
	
	$("#sang-authnum").click(function(){
		
		$("#sang-inz-btn").click(function(){
			var idI = $("#sang-inz-input").val();
			$.post(authurl, {idI: idI}, function(data) {
				if (data == 'ok2') {
					$("#signup").removeAttr("hidden");
				} else {
				
				}
			});
		});
	});
	
	$("#sang-nomal-btn").click(function(){
		var path = '${appRoot }/member/signup';
		$("#sang-signup-form").attr("action", path);
		
		$(".b2bsignup").attr("hidden", "hidden");
		
		$("#sang-img").attr("src", "${appRoot}/resources/image/2.PNG");
	})
	
	$("#sang-b2b-btn").click(function(){
		var path = '${appRoot}/member/b2bsignup';
		$("#sang-signup-form").attr("action", path);
		
		$(".b2bsignup").removeAttr("hidden");
		
		$("#sang-img").attr("src", "${appRoot}/resources/image/1.PNG");
	})
	
});
</script>

</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-12">
			<div class="conainer mt-5">
				<h1>회원 가입</h1>
				
				<button id="sang-nomal-btn">일반 회원 가입</button>
				<button id="sang-b2b-btn">사업자 회원 가입</button>
				<img id="sang-img" alt="눌러줭" src="${appRoot }/resources/image/1.PNG">
				
			</div>
			<form id="sang-signup-form" action="${appRoot }/member/signup" method="post">
				<div class="row">
					<div class="col-8">
						<label for="sang-id">id</label> <!-- 이 아래줄 부터 맘에 안들면 삭제 ㄱㄱ -->
						<input id="sang-id" name="userid" type="text">
							<span id="span1"></span>
						
					</div>
					<div class="col-4">
						<button class="" type="button" id="id-dup-btn">아이디 중복 체크</button>
						<small id="id-message" class="form-text"></small>
					</div>
					
					
					<!-- <button class="btn btn-primary" id="button1" type="button">중복 확인</button>
					<span id="span1"></span> -->
				
				</div>
	
				<div>
					<label for="sang-pw">pw</label>
					<input type="password" name="userpw" id="sang-pw">
				</div>
				<div>
					<label for="sang-pw-conform">pw conform</label>
					<input type="password" name="password" id="sang-pw-conform">
					<small id="password-message" class="form-text text-danger"></small>
				</div>
				<div>
					<label for="sang-name">name</label>
					<input type="text" name="userName" id="sang-name" class="">
				</div>
				<div class="">
					<label for="sang-birth">birth day</label>
					<input type="date" name="birthDate" id="sang-birth" class="">
				</div>
				<div class="">
					<label for="sang-email">E-mail</label>
					<input type="text" name="idE" id="sang-email" class="">
					<button class="" id="sang-authnum" type="button">인증번호 전송</button>
				</div>
				<div class="">
					<label for="sang-pnum">P-number</label>
					<input type="text" name="idP" id="sang-pnum" class="">
				</div>
				
				<hr>
				
				<div class="b2bsignup" hidden>
					<label for="sang-storeaddress">store address</label>
					<input type="text" name="storeaddress" id="sang-storeaddress" class="">
				</div>
				<div class="b2bsignup" hidden>
					<label for="sang-pnum">store name</label>
					<input type="text" name="storename" id="sang-storename" class="">
				</div>
				<div class="b2bsignup" hidden>
					<label for="sang-pnum">store phonenumber</label>
					<input type="text" name="storephonenum" id="sang-storepnum" class="">
				</div>
				<div class="b2bsignup" hidden>
					<label for="sang-pnum">business number</label>
					<input type="text" name="businessnum" id="sang-businessnum" class="">
				</div>
				
				
		
	
			
			<input class="col-3" hidden name="inz" id="sang-inz-input"/>
			<button hidden class="" id="sang-inz-btn" type="button">인증</button>
	
	
			<div class="container mt-5">
				<input hidden id="signup" type="submit" value="가입" class="" >
			</div>
			
			</form>
		</div>
	</div>
</div>
</body>
</html>