<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="hel" tagdir="/WEB-INF/tags/help"%>
<%@ taglib prefix="bot" tagdir="/WEB-INF/tags/botnav"%>

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

<hel:navbar></hel:navbar>

<div class = "container">

			<div class="row justify-content-center mt-5">

					<a href="${appRoot }/member/main">
						<img src="${appRoot }/resources/image/others/brand_logo_400px.png" alt="...">
					</a>

			</div>

			
		
		
		<div>

			<div id="alert1" class="alert alert-primary fade" role="alert">
			</div>
	
		
	
	<h1 class="text-center mt-1">1:1 문의 글 확인</h1>
	
	<div class="row">
		<div class="col-12">
			<form>
				<div class="form-group">
					<label for="input1">제목</label>
					<input readonly="readonly" id="input1" class="form-control" name="title" value="${help.title }">
				</div>
				<div class="form-group">
					<label for="textarea1">내용</label>
					<textarea readonly="readonly" id="textarea1" class="form-control" name="content"><c:out value="${help.content }" /></textarea>
				</div>
				
				<c:if test="${not empty help.fileName }">
					 <c:forEach items="${help.fileName }" var="rfile">
						<div>
							<img class="img-fluid"
							src="${askImgRoot}${help.bno }/${rfile}">
						</div>
					</c:forEach>
				</c:if>
				
				
				<div class="form-group">
					<label for="input2">작성자</label>
					<input type="hidden" readonly="readonly" id="input2" class="form-control" name="writer" value="${help.writer }">
					<input readonly="readonly" class="form-control" value="${help.writerName }">
				</div>				
				
				<c:url value="/help/askModifyContent" var="modifyUrl">
					<c:param name="bno" value="${help.bno }" />
					<c:param name="pageNum" value="${pag.pageNum }" />
					<c:param name="amount" value="${pag.amount }" />
					<c:param name="type" value="${pag.type }"/>
					<c:param name="keyword" value="${pag.keyword }" />
				</c:url>
				
				<c:url value="/help/askAdminModifyContent" var="adminModifyUrl">
					<c:param name="bno" value="${help.bno }" />
					<c:param name="pageNum" value="${pag.pageNum }" />
					<c:param name="amount" value="${pag.amount }" />
					<c:param name="type" value="${pag.type }"/>
					<c:param name="keyword" value="${pag.keyword }" />
				</c:url>
				
				 <sec:authorize access="principal.username == #help.writer">
					
						<a class="btn btn-secondary" href="${modifyUrl}">수정/삭제</a>
						
				</sec:authorize>
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<a class="btn btn-secondary" href="${adminModifyUrl}">수정/삭제</a>
				</sec:authorize>
			
			</form>
		</div>
	</div>
</div>

<div class="container mt-3">
	<div class="row">
		<div class="col-12">
			<h3>답변 </h3>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#reply-insert-modal">답변 작성</button>
			</sec:authorize>
			<ul class="list-unstyled" id="reply-list-container">
			</ul>
		</div>
	</div>
</div>

<br>
		
		
	<bot:botnav></bot:botnav>
		
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
        	<sec:authorize access="hasRole('ROLE_ADMIN')">
		        <button id="reply-modify-btn1" type="button" class="btn btn-primary">댓글 수정</button>
    		    <button id="reply-delete-btn1" type="button" class="btn btn-danger">댓글 삭제</button>
        	</sec:authorize>
        </span>
      </div>
    </div>
  </div>
	
</div>

</body>
</html>