<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	 uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="rev" tagdir="/WEB-INF/tags/member"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>고객 관리</title>

<style type="text/css">
@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
	font-family: 'GongGothicMedium';
}

#review-list-table {
	margin: 10px;
	padding: 50px;
}

img {
	padding: 70px;
}

#jinah-search-form1 {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	align-content: center;
}
</style>

<script type="text/javascript">
$(function(){
	
	let idVal = "";
	//수정 버튼 클릭시
	$(".usermanageid").click(function(e){
		e.preventDefault();
		idVal = $(this).text().trim();
		$("#black-list-modal").modal('show');
	})
	
	// 블랙 버튼 클릭시
	$("#black-user").click(function(){
		var data = {id : idVal};
		$.ajax({
			type: "get",
			url: "${appRoot}/member/modify2",
			data: data,
			success: function (data) {
				if (data == "success") {
					console.log("블랙이 정상적으로 진행되었습니다.");
					alert("블랙되었습니다!");
					location.reload();
						
				} else if (data == "error") {
					console.log("블랙이 정상적으로 진행되지 않았습니다.");
					alert("오류가 났습니다!");
				}
				
			}, 
			error: function() {
				console.log("띠용 진짜 이건 뭔 오류지?");
			}
			
		});
	})
})
</script>

</head>
<body style="overflow-x: hidden;">

	<rev:navbar></rev:navbar>


	<div class="row justify-content-center mt-5">
		<a style="text-decoration: none;" href="${appRoot }/member/main">
			<img id="" alt="" src="${appRoot }/resources/image/others/brand_logo_400px.png">
		</a>
	</div>
	
	<div class="container">
		 
		<rev:search></rev:search>
		
		<!-- 리뷰 게시물 총 개수 -->
		<div class="container d-flex justify-content-between"
			style="margin: 10px; padding: 5px;">
			<div class="row justify-content-left">총 회원 수 : ${fn:length(reList2)}</div>
			<!-- 정렬 방식 -->
			<div class="btn-group">
				<div class="dropdown-menu dropdown-menu-right">

					<a class="dropdown-item" href="#">BEST 5</a>
					<div class="dropdown-divider"></div>
					<button id="order-popular" class="dropdown-item" type="button">인기도순</button>
					<button id="order-latest" class="dropdown-item" type="button">최신순</button>
					<button id="order-viewcount" class="dropdown-item" type="button">조회수순</button>
				</div>
			</div>
		</div>
		
		<table id="review-list-table" class="table table-striped">
		 	<thead>
		 		<tr style="text-align: left;">
		 			<th>#</th>
		 			<th>아이디</th>
		 			<th>이름</th>
		 			<th>생일</th>
		 			<th>전화번호</th>
		 			<th>이메일</th>
		 			<th>닉네임</th>
		 			<th>권한</th>
		 		</tr>
		 	</thead>
		 	<tbody>
		 		
		 		<c:set var="len" value="${fn:length(reList2)}"/>
		 		<c:forEach items="${reList2 }" var="userinfo" varStatus="status">
		 			<tr>
		 				<td>${len-status.index }</td>
		 				<td>
		 					<a style="text-decoration: none;" class="usermanageid" id="usermanageid${userinfo.userid }" href="">
		 						${userinfo.userid }
		 					</a>
		 				</td>
		 				<td>${userinfo.userName }</td>
		 				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${userinfo.birthDate }"/></td>
		 				<td>${userinfo.userPhonenum }</td>
		 				<td>${userinfo.userEmail }</td>
		 				<td>${userinfo.userNickname }</td>
		 				<td>${userinfo.authList[0].auth }</td>
 		 			</tr>
		 		</c:forEach>
		 	</tbody>
		 </table>
	
</div>


<div class="modal fade" id="black-list-modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-geader">
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>				
				<h5 modal-title style="text-align: center; margin-top: 10px">
					블랙리스트 처리 하시겠습니까?
				</h5>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="black-user">블랙</button>
				<button type="button" class="btn btn-success" data-dismiss="modal">아니요</button>
			</div>
		</div>
	</div>
</div>




</body>
</html>