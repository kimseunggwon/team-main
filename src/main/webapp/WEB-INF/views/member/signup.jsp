<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-7">
			<div class="conainer mt-5">
				<h1>회원 가입</h1>
			</div>
			<form action="${pageContext.request.contextPath }/sample2/member/signup" method="post">
				<div>
					<label for="input1">id</label> <!-- 이 아래줄 부터 맘에 안들면 삭제 ㄱㄱ -->
					<div>
					<input id="input1" name="id" type="text">
						<span id="span1"></span>
					</div>
					
					
					<!-- <button class="btn btn-primary" id="button1" type="button">중복 확인</button>
					<span id="span1"></span> -->
				
				</div>
	
				<div>
					<label for="input2">pw</label>
					<input type="password" name="password" id="input2">
				</div>
				<div>
					<label for="input3">name</label>
					<input type="text" name="name" id="input3" class="">
				</div>
				<div class="">
					<label for="input4">birth day</label>
					<input type="date" name="birth" id="input4" class="">
				</div>
				<div class="">
					<label for="input2">E-mail</label>
					<input type="text" name="idA" id="input5" class="">
				</div>
				<div class="">
					<label for="input2">P-number</label>
					<input type="text" name="idB" id="input6" class="">
				</div>
			
			<s2:message></s2:message>
			
		</div>
		<div class="col-5 conainer mt-5">
			<div class="conainer mt-5">
				<h1> </h1>
			</div>
			<div class="">
				<label> </label>
			</div>
			
			<div>
				<button class="" id="button1" type="button">중복 확인</button>
				<span id="span1"></span>
			</div>
	
			<div class="container mt-5 pl-0">
				<button class="" id="but2" type="button">인증번호 전송</button>
				<input class="col-3" hidden name="inz" id="inz"/> <!-- 꾸미기 시급!!!!!!!!!!!!!!!!!!!!!!!!!! -->
				<button hidden class="" id="button11" type="button">인증</button>
			</div>
		</div>
			
		<pre >
		
		
		
		</pre>
		<div class="container mt-5">
			<input hidden id="signup" type="submit" value="가입" class="" >
		</div>
				
		</div>
</div>
</body>
</html>