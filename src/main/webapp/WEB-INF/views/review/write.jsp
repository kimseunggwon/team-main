<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<meta charset="UTF-8">
<title>Review - write JSP File</title>

<style type="text/css">
.container {
	display: flex;
	flex-direction: column;
	align-content: center;
}

.container-1 input.search{
  width: 420px;
  height: 78px;
  background: rgb(242, 242, 242);
  border: none;
  font-size: 12pt;
  float: left;
  color: rgb(0, 0, 0);
  padding-left: 45px;
  -webkit-border-radius: 40px;
  -moz-border-radius: 40px;
  border-radius: 40px;
  outline-style: none;
}
</style>

<script>
</script>

</head>
<body>
		<%-- 여기는 [글쓰기] JSP 파일입니다 :) --%>
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
		 		
	
			 		<form action="${appRoot }/review/write" method="post" enctype="multipart/form-data"> 
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
			 			<div class="item form-group">
				 			<label for="re-input2">사진 파일</label>
				 			<input id="re-input2" class="form-control" type="file" name="file" accept="image/*" > 
			 			</div>
			 			<!-- 작성자 -->
			 			<div class="item form-group">
				 			<label for="re-input3">리뷰 작성자</label>
				 			<!-- input id="re-input3" class="form-control" value="" type="hidden" name="jinah-writer"-->
				 			<input id="re-input3" class="form-control" name="jinah-writer">
			 			</div>
			 			<!-- Submit -->
			 			<input class="btn btn-primary" type="submit" value="리뷰 등록하기">
			 		</form>
		 	</div>
		 </div>
	</div>
</body>
</html>