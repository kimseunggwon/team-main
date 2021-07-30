<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>

<style type="text/css">
@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
 
 body {	
   font-family: 'GongGothicMedium';
}
</style>



</head> 
<body>

<script>
		$(function() {
			// 수정
			$("#member-info-modify-btn1").click(function(e) {
				$('#myModal').modal("show");
			});
  
			
		})
	</script>
	
 

<div class="container">	 

<div class="col align-self-center mt-3">
					<a href="${appRoot }/member/main">
						<img src="${appRoot }/resources/image/others/brand_logo_300px.png" alt="...">
					</a>
				</div>  
				<br>
				<br>
				<br>
<h1>내 정보</h1>    


		<section id="container"> 
			<form id="member-form" action="${appRoot }/member/modify" method="post">
			    <div class="form-group has-feedback">
					<label class="control-label" for="userName">이름</label>
					<input   value="${member.userName }" class="form-control"  type="text" id="userName" name="userName"/>
				</div>  
				<div class="form-group has-feedback">  
					<label class="control-label" for="userId">아이디</label>
					<input  class="form-control"  value="${member.userid}" readonly type="text" id="userId" name="userid"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userEmail">이메일주소</label>
					<input  value="${member.userEmail}" class="form-control" type="text" id="userEmail" name="userEmail" />
				</div> 
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass">비밀번호</label>
					<input class="form-control" type="password" id="userPass" name="userpw" />
				</div>
				
				
				   <!--  <a href="myinfo" </a> -->
		        <a href="myinfo" type="submit" class="btn btn-primary" >정보수정하기</a>
				   
				 
			</form>
		</section>
		
	</body>
 
   
</div>

<div id="myModal" class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">알림창</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>수정하시겠습니까?</p>
      </div> 
      <div class="modal-footer">
        <a><button href="myinfo"  type="submit" class="btn btn-primary" data-dismiss="modal">수정하기</button></a>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>



</body>
</html>






