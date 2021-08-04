<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="hel" tagdir="/WEB-INF/tags/help"%>
<%@ taglib prefix="bot" tagdir="/WEB-INF/tags/botnav"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<script type="text/javascript">
	
	$(function() {
		$("#ask-submit-btn").click(function(e) {
			e.preventDefault();
			askCheck = document.forms.ask;
			if(askCheck.title.value == "" && askCheck.content.value == "") {
				alert("문의 제목과 내용을 입력해주세요!")
				return false; 
			} else if(askCheck.title.value == "") {
				alert("문의 제목을 입력해주세요!")
				return false;
			} else if (askCheck.content.value == "") {
				alert("문의 내용을 입력해주세요!")
				return false;
				}
			else {
				$(askCheck).submit();
				//return true;
			}
		});
	});
</script>



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
	
	<div class="container">
		
		
		<div class="row mt-5">
				
				 <div class="col align-self-start">
				 
				 </div>
			
				<!-- 빨래 널자(회사) 로고 이미지가 들어갈 위치 -->
				<div class="col align-self-center mt-3">
					<a href="${appRoot }/member/main">
						<img src="${appRoot }/resources/image/others/brand_logo_300px.png" alt="...">
					</a>
				</div>
			
				<!-- 간단한 검색을 할 수 있는 검색창 구현 -->
				<div class="col align-self-end">
			
					<form class="d-flex">
     	 				<input class="form-control mr-2" type="search" placeholder="Search" aria-label="Search">
      					<button class="btn btn-outline-success" type="submit">Search</button>
    				</form>
				</div>
			</div>
		
		<div>
			<h1 class="text-center mt-5">1:1 문의 글 작성</h1>
		</div>

		<div>
			<form id="ask-form" name="ask" action="${appRoot }/help/register" method="post" enctype="multipart/form-data">

				<div class="form-group">
					<label for="input1">제목</label> 
					<input id="input1" class="form-control" name="title">
				</div>

				<div class="form-group">
					<label for="textarea1">내용</label>
					<textarea id="textarea1" class="form-control" name="content"></textarea>
				</div>
				
				<div class="form-group">
					<label for="input3">파일</label> 
					<input id="input3" class="form-control" type="file" name="file" accept="image/*" multiple="multiple" />
				</div>

				<div class="form-group">
					<label for="input2">작성자</label> 
					<input id="input2" hidden value="${pinfo.member.userid }" readonly class="form-control" name="writer">
					<input value="${pinfo.member.userName }" readonly class="form-control" >
				</div>
				
				<input class="btn btn-primary" type="submit" id="ask-submit-btn" value="작성"/> 
				
				<input hidden name="pageNum" value="${pag.pageNum }" />	
				<input hidden name = "amount" value="${pag.amount }" />			
				<input hidden name="type" value="${pag.type }">
				<input hidden name="keyword" value="${pag.keyword }" />
				
			</form>
		</div>
		
	<bot:botnav></bot:botnav>
		
	</div>
</body>
</html>