<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<meta charset="UTF-8">
<title>Review - write JSP File</title>
</head>
<body>
	<div class="container">
		<%--
		여기는 [글쓰기] JSP 파일입니다 :)
	 	리뷰 글 제목
	 	리뷰 내용
	 	파일 업로드
	 	작성자 (닉네임)
		 --%>
		 <div class="row">
		 	<div class="col-6">
		 		<form action="${appRoot }/review/write" method="post" enctype="multipart/form-data"> 
		 			<!-- 제목 -->
		 			<label for="re-input1">리뷰 제목</label>
		 			<input id="re-input1" name="jinah-title"> <br>
		 			<!-- 내용 -->
		 			<label for="re-textarea1">리뷰 내용</label>
		 			<textarea name="jinah-content"></textarea> <br>
		 			<!-- 이미지 파일 -->
		 			<label for="re-input2">사진 파일</label>
		 			<input id="re-input2" type="file" accept="image/*" > <br>
		 			<!-- 작성자 -->
		 			<label for="re-input3">리뷰 작성자</label>
		 			<input id="re-input3" value="" type="hidden" name="jinah-writer">
		 			<input value="" readonly> <br>
		 			<!-- Submit -->
		 			<input type="submit" value="리뷰 등록하기">
		 		</form>
		 	</div>
		 </div>
	</div>
</body>
</html>