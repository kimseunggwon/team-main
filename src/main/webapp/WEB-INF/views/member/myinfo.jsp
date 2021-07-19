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
<script>
 $(function() {
	 var oldPasswordModal =$("#old-password-modal");
	 
	$("#btn-modify").click(function(e) {
		var ans = confirm("수정 완료");
		
		
	})
	
	$("#btn-remove").click(function() {
		var ans = confirm("탈퇴 하시겠습니까?");
		
		if(ans) {
			oldPasswordModal.modal('show');
		}
		
		$("#member-form")
			.attr("action","${appRoot}/member/remove")
			.submit();
	})
 })
	
 
</script> 
<div class="container">	 
<h1>내 정보</h1>  
<body>
		<section id="container">
			<form id="member-form" action="${appRoot }/member/kim" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="userId">아이디</label>
					<input class="form-control" value="kim" type="text" id="userId" name="userid"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass">패스워드</label>
					<input class="form-control" type="password" id="userPass" name="userpw" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">성명</label>
					<input class="form-control" type="text" id="userName" name="username" value="${member.userName}"/>
				</div> 
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="btn-modify">정보 수정</button>
					<button class="cencle btn btn-danger" type="button" id="btn-remove">회원 탈퇴</button>
				</div>
			</form>
		</section>
		
	</body>

   
</div>
</body>
</html>






