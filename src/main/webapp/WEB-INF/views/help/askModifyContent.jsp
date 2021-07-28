<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!DOCTYPE html>
<html>
<head>

<%@ include file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
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
<div class = "container">
		<h1>1:1 문의글 수정/삭제</h1>
	
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
</div>
</body>
</html>