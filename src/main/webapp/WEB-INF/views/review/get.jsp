<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<meta charset="UTF-8">
<title>Review - get JSP File</title>
</head>
<body>
	<div class="container">
		<%--
		제목
		(좋아요) (평점)
		내용 
		파일 업로드
		리뷰 수정/삭제 버튼 (상필이와 논의 필요) ***
		 --%>
		 <h1>리뷰 상세 보기</h1>
		 <div class="row">
			<div class="'col-12">
				<form>
					<!-- 제목 -->
					<label for="re-input1">리뷰 제목</label>
					<input readonly="readonly" id="re-input1" value="${review.reTitle }" name="jinah-title">
					<br>
					<!-- 내용 -->
					<label for="re-textarea1">리뷰 내용</label>
					<textarea readonly="readonly" name="jinah-content">
						<c:out value="${review.reContent }"></c:out>
					</textarea>
					<br>
					<!-- 이미지 파일 업로드 -->
					<c:if test="${not empty review.fileName }">
						<div>
							<img class="img-fluid" src="${imgRoot }${review.reBno}/${review.fileName}">
						</div>
					</c:if>	
					<!-- 작성자 -->				
					<label for="re-input2">리뷰 작성자</label>
					<input type="hidden" readonly="readonly" id="re-input2" name="jinah-writer" value="${review.reWriterName }">
					<input readonly="readonly" value="${review.reWriterName }">
					
					<!-- 리뷰 수정 -->
					
				</form>
			</div>		 
		 </div>
	</div>
</body>
</html>