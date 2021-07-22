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
	
	
	// 수정
	$("#btn-modify").click(function(e) {
		var ans = confirm("수정 완료");
		
	}); 
		
	//탈퇴
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

<c:if test="${param.status == 'success' }">
		<div id="alert1" class="alert alert-primary" role="alert">
			회원 정보를 수정하였습니다.
		</div>
	</c:if>
	
	<c:if test="${param.status == 'error' }">
		<div id="alert1" class="alert alert-danger" role="alert">
			회원 정보 수정을 할 수 없습니다.
		</div>
	</c:if>

		<section id="container"> 
			<form id="member-form" action="${appRoot }/member/modify" method="post">
			    <div class="form-group has-feedback">
					<label class="control-label" for="userName">이름</label>
					<input class="form-control" type="text" id="userName" name="userName"/>
				</div> 
				<div class="form-group has-feedback">  
					<label class="control-label" for="userId">아이디</label>
					<input  class="form-control"  value="${member.userid}" readonly type="text" id="userId" name="userid"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userEmail">이메일주소</label>
					<input class="form-control" type="text" id="userEmail" name="userEmail" />
				</div> 
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass">비밀번호</label>
					<input class="form-control" type="password" id="userPass" name="userpw" />
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






