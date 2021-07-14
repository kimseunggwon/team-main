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
		<nav class="navbar navbar-light bg-light">
			
			<!-- 빨래 널자(회사) 로고 이미지가 들어갈 위치 -->
			<img src="${appRoot }/resources/image/logo.jpg" class="rounded mx-auto d-block" alt="...">
			
			
			<!-- 간단한 검색을 할 수 있는 검색창 구현 -->
			<form class="d-flex">
     	 		<input class="form-control mr-2" type="search" placeholder="Search" aria-label="Search">
      			<button class="btn btn-outline-success" type="submit">Search</button>
    		</form>
		</nav>
		
		<div >
			<h1 class="text-center mt-4">고객 센터</h1>
			
			
			<!-- 로그인 -->
			<div class="row justify-content-end">
    		<form action="#" class="mr-2">
			 	<input class="btn btn-warning" type="submit" value="로그아웃">
			 </form>
    		<form action="#">
			 	<input class="btn btn-warning" type="submit" value="Mypage">
			 </form>
  		</div>

		</div>

		

		<table class="table table-striped">
			<thead>
				<tr>
					<th><h3 class="text-center mt-2">자주 묻는 질문</h3></th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<th>빨래 수거와 배송은 어떻게 이루어지나요?</th>
				</tr>

				<tr>
					<th>빨래 세척 시 사용하는 제품(세제 / 섬유유연제)이 궁금해요.</th>
				</tr>

				<tr>
					<th>만약 실수로 드라이클리닝과 같은 특수 세탁이 필요한 빨래를 세탁 가방에 집어넣었다면 어떻게 하죠?</th>
				</tr>

				<tr>
					<th>수거 시간과 배송 시간은 변경이 가능한가요?</th>
				</tr>

				<tr>
					<th>빨래 널자에서 제 세탁물을 어떻게 관리하나요?</th>
				</tr>

				<tr>
					<th>만약 추가로 빨래가방을 요청하면 요금이 달라지나요?</th>
				</tr>

				<tr>
					<th>특수 세탁물과 이불(커튼)은 맡길 수 없나요?</th>
				</tr>

				<tr>
					<th>셔츠를 맡길 때 드라이 클리닉과 다림질이 제공되나요?</th>
				</tr>

			</tbody>
		</table>
		
		<!-- 1:1 문의 글 작성 페이지로 이동되는 버튼 생성 -->
		<div class="row justify-content-center">
			<form action="${appRoot }/help/ask">
			 	<input class="btn btn-danger" type="submit" value="1:1 문의">
			 </form>
		</div>
		
		 <div class="row justify-content-around">
		 
		 </div>
		


	</div>
</body>
</html>