<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%-- 여기는 [글 수정 및 삭제하기] JSP 파일입니다 :) --%>
	<div class="container">
		<div class="row justify-content-center">
			<img alt="jinah-logo"
				src="${appRoot }/resources/image/review/logo.png">
		</div>
	</div>
	
	<!-- 검색 버튼 -->
	<div class="container-1 row justify-content-center">
		<span style="position: absolute; margin-top: 27px; margin-left: 18px"
			class="icon"></span> <input
			name="username" class="search" type="text" id="input1"
			placeholder="SEARCH" />
	</div>

	<div class="container">
		 <div class="row justify-content-center">
		 		<div class="col-8">
	
			 		<form id="re-modify-form1" action="${appRoot }/review/modify" method="post" enctype="multipart/form-data"> 
			 			<!-- 제목 -->
			 			<div class="item form-group">
				 			<label for="re-input1">리뷰 제목</label>
				 			<input id="re-input1" class="form-control" name="jinah-title" placeholder="제목을 입력해주세요."> 
			 			</div>
			 			<!-- 내용 -->
			 			<div class="item form-group">
				 			<label for="re-textarea1">리뷰 내용</label>
				 			<textarea class="form-control" name="jinah-content" col="2" rows="10" placeholder="내용을 입력해주세요."></textarea> 
			 			</div>
			 			<!-- 이미지 파일 -->
			 			<c:if test="${not empty review.fileName }">
			 				<div>
			 					<img class="img-fluid" 
			 					alt="user-review-file" 
			 					src="${imgRoot }${review.reBno }/${review.fileName }">
			 				</div>
			 			</c:if>
			 			<div class="item form-group">
				 			<label for="re-input2">이미지 선택</label>
				 			<input id="re-input2" class="form-control" type="file" accept="image/*" > 
			 			</div>
			 			<!-- 작성자 -->
			 			<div class="item form-group">
				 			<label for="re-input3">리뷰 작성자</label>
				 			<input id="re-input3" class="form-control" value="" type="hidden" name="jinah-writer">
				 			<input readonly="readonly" value="${review.reWriterName }" id="re-input3" class="form-control" name="jin"> 
			 			</div>
			 			<!-- Submit -->
			 			<input class="btn btn-primary" type="submit" value="리뷰 등록하기">
			 		</form>
		 	</div>
		 </div>
	</div>
</body>
</html>