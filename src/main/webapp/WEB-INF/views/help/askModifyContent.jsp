<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="hel" tagdir="/WEB-INF/tags/help"%>
<%@ taglib prefix="bot" tagdir="/WEB-INF/tags/botnav"%>

<!DOCTYPE html>
<html>
<head>

<link href="${appRoot }/resources/favicon/brand_logo.png" rel="shortcut icon" type="image/x-icon">

<%@ include file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>

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

<script>
$(document).ready(function() {
	var modifyUrl = "${appRoot }/help/askModifyContent";
	var removeUrl = "${appRoot }/help/askRemove"
	$("#board-remove-btn1").click(function(){
		if (confirm("삭제 하시겠습니까?")) {
			$("#modify-form1").attr("action", removeUrl);
			$("#modify-form1").submit();
		}
	});
});
</script>
</head>
<body>

<hel:navbar></hel:navbar>

<div class = "container">

			<div class="row justify-content-center mt-5">
				
				
					<a href="${appRoot }/member/main">
						<img src="${appRoot }/resources/image/others/brand_logo_400px.png" alt="...">
					</a>
			
			</div>
			
	



		<h1 class="text-center mt-5">1:1 문의글 수정/삭제</h1>
	
	<div class="row">
		<div class="col-12">
			<form id="modify-form1" action="${appRoot }/help/askModifyContent" method="post" enctype="multipart/form-data">
				<input hidden name="bno" value="${help.bno }" />
				<div class="form-group">
					<label for="input1">제목</label>
					<input id="input1" value="${help.title }" class="form-control" name="title">
				</div>
				<div class="form-group">
					<label for="textarea1">내용</label>
					<textarea id="textarea1" class="form-control" name="content"><c:out value="${help.content }" /></textarea>
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
					<label for="input3">파일</label>
						<input id="input3" class="form-control" type="file" name="file" accept="image/*" multiple="multiple" />
				</div>
				
				<div class="form-group">
					<label for="input2">작성자</label>
					<input readonly="readonly" value="${help.writer }" id="input2" class="form-control" name="writer">
				</div>
				
				<input hidden name="pageNum" value="${pag.pageNum }" />	
				<input hidden name = "amount" value="${pag.amount }" />			
				<input hidden name="type" value="${pag.type }">
				<input hidden name="keyword" value="${pag.keyword }" />
				
				<input class="btn btn-warning" type="submit" value="수정" />
				<input id="board-remove-btn1" class="btn btn-danger" type="button" value="삭제" />
			</form>
		</div>
		
		</div>
	<bot:botnav></bot:botnav>
</div>
</body>
</html>