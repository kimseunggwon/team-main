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

img {
	padding: 50px;
}

/* 왜 안될까? */
#jinah-search-form1 {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	align-content: center;
}
</style>

<script>
// 리뷰 평점을 매기자...
</script>

</head>
<body style="overflow-x:hidden;">
		<%-- 선택자 우선순위 구글링 --%>
		
		<%-- 여기는 [글쓰기] JSP 파일입니다 :) 
		1. 검색 기능이 완전하지 않아요.
		2. 도대체 왜 item 수평 정렬이 안되는지 화가 나요. 
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
	
	<!-- Search Start -->
	<div class="container-1 row justify-content-center">
		<form class="d-flex align-items-center"action="${appRoot }/review/list" method="get">
			<div class="item">
				<select name="type" class="form-inline my-2 my-lg-0">
					<option value="">Select</option>
					<option value="T" ${recri.type	== "T" ? 'selected' : '' }>제목</option>
					<option value="C" ${recri.type	== "C" ? 'selected' : '' }>내용</option>
					<option value="W" ${recri.type	== "W" ? 'selected' : '' }>글쓴이</option>
					<option value="TC" ${recri.type	== "TC" ? 'selected' : '' }>제목
						+ 내용</option>
					<option value="TW" ${recri.type	== "TW" ? 'selected' : '' }>제목
						+ 글쓴이</option>
					<option value="TWC" ${recri.type	== "TWC" ? 'selected' : '' }>제목
						+ 글쓴이 + 작성자</option>
				</select>
			</div>
			<div class="item">
				<span
					style="position:absolute; margin-top: 27px; margin-left: 18px"
					class="icon"></span> <input name="keyword"
					value="${recri.keyword }" class="search" type="search"
					id="jinah-search1" placeholder="Search" />
			</div>

			<div class="item">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</div>

			<input type="hidden" name="pageNum" value="1"> <input
				type="hidden" name="amount" value="${recri.amount }">
		</form>
	</div>
	<!-- Search End -->

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
				 			<input id="re-input1" class="form-control" name="reTitle" placeholder="제목을 입력해주세요."> 
			 			</div>
			 			<!-- 내용 -->
			 			<div class="item form-group">
				 			<label for="re-textarea1">리뷰 내용</label>
				 			<textarea class="form-control" name="reContent" col="2" rows="10" placeholder="내용을 입력해주세요."></textarea> 
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
				 			<input id="re-input3" class="form-control" name="reWriter" value="테스터 박진아" readonly>
			 			</div>
			 			
			 			
			 			<!-- Submit -->
			 			<input class="btn btn-primary" type="submit" value="리뷰 등록하기">
			 		</form>
		 	</div>
		 </div>
	</div>
</body>
</html>