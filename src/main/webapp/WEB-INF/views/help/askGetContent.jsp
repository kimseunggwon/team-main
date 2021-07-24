<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!DOCTYPE html>
<html>
<head>

<%@ include file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>

<script type="text/javascript">
var appRoot = "${appRoot}";
var bno = "${help.bno}"
var userid = "${pinfo.member.userid}";
</script>


<script src="${appRoot }/resources/js/get.js"></script>

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
<div class = "container">

			<div class="row">
				
				 <div class="col align-self-start">
				 
				 </div>
			
				<!-- 빨래 널자(회사) 로고 이미지가 들어갈 위치 -->
				<div class="col align-self-center mt-3">
					<a href="${appRoot }/member/main">
						<img src="${appRoot }/resources/image/others/brand_logo_300px.png" alt="...">
					</a>
				</div>
			
				<!-- 간단한 검색을 할 수 있는 검색창 구현 -->
				<div class="col align-self-end">
			
					<form class="d-flex">
     	 				<input class="form-control mr-2" type="search" placeholder="Search" aria-label="Search">
      					<button class="btn btn-outline-success" type="submit">Search</button>
    				</form>
				</div>
			</div>

			<div class="row justify-content-end mt-3">
				
				<form action="${appRoot }/member/main" class="mr-2 mb-2">
						<input class="btn btn-warning" type="submit" value="메인">
					</form>
				
    			<form action="${appRoot }/logout" class="mr-2">
			 		<input class="btn btn-warning" type="submit" value="로그아웃">
			 	</form>
    			<form action="${appRoot }/member/mypage">
				 	<input class="btn btn-warning" type="submit" value="Mypage">
				 </form>
	  		</div>
			
		
		
		<div>
			
		<hr>

			<div id="alert1" class="alert alert-primary fade" role="alert">
			</div>
	
		
	
	<h1 class="text-center mt-5">1:1 문의 글 확인</h1>
	
	<div class="row">
		<div class="col-12">
			<form>
				<div class="form-group">
					<label for="input1">제목</label>
					<input readonly="readonly" id="input1" class="form-control" name="title" value="${help.title }">
				</div>
				<div class="form-group">
					<label for="textarea1">내용</label>
						<textarea readonly="readonly" id="textarea1" class="form-control" name="content">
						<c:out value="${help.content }" />
						</textarea>
				</div>
				
				<c:if test="${not empty help.fileName }">
					<div>
						<img class="img-fluid"
						src="${imgRoot}${help.bno }/${help.fileName}">
					</div>
				</c:if>
				
				<div class="form-group">
					<label for="input2">작성자</label>
					<input type="hidden" readonly="readonly" id="input2" class="form-control" name="writer" value="${help.writer }">
					<input readonly="readonly" class="form-control" value="${help.writerName }">
				</div>				
				
				<c:url value="/help/modify" var="modifyUrl">
					<c:param name="bno" value="${help.bno }" />
					<c:param name="pageNum" value="${pag.pageNum }" />
					<c:param name="amount" value="${pag.amount }" />
					<c:param name="type" value="${pag.type }"/>
					<c:param name="keyword" value="${pag.keyword }" />
				</c:url>
				
				<c:if test="${pinfo.member.userid eq help.writer }">
				<a class="btn btn-secondary" href="${modifyUrl}">수정/삭제</a>
				</c:if>	
			
			
			</form>
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-12">
			<h3>댓글 </h3>
			<sec:authorize access="isAuthenticated()">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#reply-insert-modal">댓글 작성</button>
			</sec:authorize>
			<ul class="list-unstyled" id="reply-list-container">
			</ul>
		</div>
	</div>
</div>

<br>
		
		<hr>
		
		 <div class="row justify-content-around mb-3">
		 	<div class="row">
		 
		 		<div class="mr-10">
		 			<a href="${appRoot }/member/main">
						<img src="${appRoot }/resources/image/others/brand_logo_300px.png" alt="...">
					</a>
		 		</div>
		 	
		 	</div>
		 	
		 	<div class="row">
		 		<div>
		 			서울시 강남구 삼성동 1234 우 : 123-1234
		 			<br>
					TEL:02-123-1234 Email:email@domain.com
					<br>
					COPYRIGHT (C) 빨래널자 ALL RIHGTS RESERVED
					<br>
				</div>
		 	</div>
		 	
		 	<div class="row">
		 		<span >
		 			<a href="#">
		 			 	<img src="${appRoot }/resources/image/blog.jpg">
		 			</a>
		 			<a href="#">
		 				<img  src="${appRoot }/resources/image/facebook.gif">
		 			</a>
		 			
		 			<a href="#">
		 				<img  src="${appRoot }/resources/image/twitter.gif">
		 			</a>
		 		</span>
		 	</div>
		 		
		 </div>
		
	</div>



<%-- 댓글 입력 모달 --%>

<div class="modal fade" id="reply-insert-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">새 댓글</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <input type="text" value="${help.bno }" readonly hidden id="reply-bno-input1">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">작성자</label>
            <input type="text" readonly value="${pinfo.member.userNickname }" class="form-control" />
            <input type="hidden" value="${pinfo.member.userid }" class="form-control" id="reply-replyer-input1">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">댓글</label>
            <textarea class="form-control" id="reply-reply-textarea1"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="reply-insert-btn1" type="button" class="btn btn-primary">댓글 입력</button>
      </div>
    </div>
  </div>
</div>

<%-- 댓글 수정, 삭제 모달 --%>
<div class="modal fade" id="reply-modify-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">댓글 수정/삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <input type="text" value="" readonly hidden id="reply-rno-input2" >
          <input type="text" value="${help.bno }" readonly hidden id="reply-bno-input2">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">작성자</label>
             <input id="reply-replyerName-input2" class="form-control" readonly type="text" />
            <input type="hidden" class="form-control" id="reply-replyer-input2" readonly>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">댓글</label>
            <textarea class="form-control" id="reply-reply-textarea2"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
        <span id="reply-modify-delete-btn-wrapper">
	        <button id="reply-modify-btn1" type="button" class="btn btn-primary">댓글 수정</button>
    	    <button id="reply-delete-btn1" type="button" class="btn btn-danger">댓글 삭제</button>
        </span>
      </div>
    </div>
  </div>
	
</div>
</div>
</body>
</html>