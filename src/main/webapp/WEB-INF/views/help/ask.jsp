<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
</head>
<body>
	<div class="container">

		<h1>1:1 문의 글 작성</h1>

		<div>
			<form action="${appRoot }/help/askList">

				<div class="form-group">
					<label for="input1">제목</label> <input id="input1"
						class="form-control" name="title">
				</div>

				<div class="form-group">
					<label for="textarea1">내용</label>
					<textarea id="textarea1" class="form-control" name="content"></textarea>
				</div>
				
				<div class="form-group">
					<label for="input3">파일</label> <input id="input3"
						class="form-control" type="file" name="file" accept="image/*" />
				</div>

				<div class="form-group">
					<label for="input2">작성자</label> 
					<input id="input2" value="" readonly class="form-control" name="writer">
				</div>
				
				<input class="btn btn-primary" type="submit" value="작성" /> 
				
			</form>
		</div>
	</div>
</body>
</html>