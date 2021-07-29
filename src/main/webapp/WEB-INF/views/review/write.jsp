<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec"	 uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="rev" tagdir="/WEB-INF/tags/review" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<meta charset="UTF-8">
<title>Review - write JSP File</title>

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

#re-starItem {
	padding: 5px;
	background-color: white;
	border: none;
	outline: none;
}

#jinah-star {
	width: 50px;
	height: 50px;
	color: #ffe62e;
}

#re-write-content {
	display: flex;
	flex-direction: column;
	align-content: center;
}

img {
	padding: 50px;
}

#re-input2-label {
  padding: 6px 25px;
  background-color:#FF84A9;
  border-radius: 4px;
  color: white;
  cursor: pointer;
}

/* 왜 안될까? */
#jinah-search-form1 {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	align-content: center;
}
</style>

<link rel="stylesheet" type="text/css" href="${appRoot }/resources/css/uploadajax.css">

<script>
	const appRoot = "${appRoot}";
</script>

<script src="${appRoot }/resources/js/review/uploadajax.js"></script>

</head>
<body style="overflow-x:hidden;">

		<rev:navbar></rev:navbar>

		<%-- 선택자 우선순위 구글링 --%>
		
		<%-- 여기는 [글쓰기] JSP 파일입니다 :) 
		1. 검색 기능이 완전하지 않아요.
		2. 도대체 왜 item 수평 정렬이 안되는지 화가 나요. (해결 완)
		3. 리뷰 작성자는 user table이 정리된 이후에 다시 할 수 있어요. 
		4. authentication 설정 이후 test가 필요해요.. (MyPage랑 연결시켜야 해요)
		5. 서버 실행을 위해 잠시 작성자 reWriterName - NULL값 가능하게.? 만들기 + mapper.xml도 잠시 변경함
		--%>
		
	<div class="container">
		<div class="row justify-content-center">
			<img alt="jinah-logo"
				src="${appRoot }/resources/image/others/brand_logo_400px.png">
		</div>
	</div>
	
		<rev:search></rev:search>

	<!-- Review Grading (stars) Start -->
	<div id="re-star" style="display:inline;" class="container">
		<div class="row justify-content-center d-flex align-items-center">
			<button type="button" class="item" id="re-starItem"><i id="jinah-star" class="far fa-star"></i></button>
			<button type="button" class="item" id="re-starItem"><i id="jinah-star" class="far fa-star"></i></button>
			<button type="button" class="item" id="re-starItem"><i id="jinah-star" class="far fa-star"></i></button>
			<button type="button" class="item" id="re-starItem"><i id="jinah-star" class="far fa-star"></i></button>
			<button type="button" class="item" id="re-starItem"><i id="jinah-star" class="far fa-star"></i></button>
			<div>
				<label for="jinah-restars">평점</label>
				<input type="hidden" name="reStars"  value="${re.reStars }"/>
			</div>
		</div>
	</div>
	<!-- Review Grading (stars) End -->

	<!-- Main Writing Content -->
	<div id="re-write-content" class="container">
		 <div class="row justify-content-center">
		 		<div class="col-8">
			 		<form action="${appRoot }/review/write" method="post" enctype="multipart/form-data"> 
			 			<!-- 제목 -->
			 			<div class="item form-group">
				 			<label for="re-input1">리뷰 제목</label>
				 			<input id="re-input1" class="form-control" 
				 			name="reTitle" type="text" minlength="5" placeholder="제목을 입력해주세요." required> 
			 			</div>
			 			<!-- 내용 -->
			 			<div class="item form-group">
				 			<label for="re-textarea1">리뷰 내용</label>
				 			<textarea class="form-control" name="reContent" cols="2" rows="10" placeholder="내용을 입력해주세요." required></textarea> 
			 			</div>
			 			
						<!-- 이미지 파일 -->
			 			<div id="uploadDiv" class="item form-group">
				 				<label id="re-input2-label" for="re-input2">이미지 업로드</label>
				 			<input style="display:none;"id="re-input2" class="form-control" multiple="multiple" type="file" name="file" accept="image/*" > 
			 			</div>
			 			<div class="uploadResult">
			 				<ul>
			 				</ul>
			 			</div>
			 			<!-- 작성자 -->
			 			<div class="item form-group">
				 			<label for="re-input3">리뷰 작성자</label>
				 			<input id="re-input3" class="form-control" value="${pinfo.member.userNickname }" readonly>
			 			</div>
			 			<input type="hidden" name="reWriterName" value="${pinfo.member.userid }" readonly>
			 			
						<input class="btn btn-primary" type="submit" value="리뷰 등록하기">
			 			
			 	</form>
		 	</div>
		 </div>
	</div>
	
	<%-- 사용자가 이용한 세탁소 위치 정보 --%>
	
	
	
	<div class="container">
		<div class="row justify-content-center">
			<a href="${appRoot }/review/list"><button type="button"
					class="btn btn-info">다른 리뷰 보러가기</button></a>
		</div>
	</div>
</body>
</html>