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
		
			
			<div class="row">
				
				 <div class="col align-self-start">
				 
				 </div>
			
				<!-- 빨래 널자(회사) 로고 이미지가 들어갈 위치 -->
				<div class="col align-self-center">
					<img src="${appRoot }/resources/image/logo.jpg" alt="...">
				</div>
			
				<!-- 간단한 검색을 할 수 있는 검색창 구현 -->
				<div class="col align-self-end">
			
					<form class="d-flex">
     	 				<input class="form-control mr-2" type="search" placeholder="Search" aria-label="Search">
      					<button class="btn btn-outline-success" type="submit">Search</button>
    				</form>
				</div>
			</div>
		
		<div >
			<h1 class="text-center mt-4">고객 센터</h1>
			
			
			<!-- 로그인 -->
			<div class="row justify-content-end">
    		<form action="${appRoot }/member/main" class="mr-2 mb-2">
			 	<input class="btn btn-warning" type="submit" value="로그아웃">
			 </form>
    		<form action="${appRoot }/member/mypage" class="mr-2 mb-2">
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
					<th>
						<div class="accordion" id="accordionExample">
  							<div class="card">
    							<div class="card-header" id="headingOne">
      								<h2 class="mb-0">
        								<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          										빨래 수거와 배송은 어떻게 과정으로 이루어지나요?
        								</button>
      								</h2>
    							</div>
    							
    							    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
     									 <div class="card-body">
        								  1. 빨래널자에서 제공하는 세탁물 가방에 세탁물을 넣어주세요.
        								  <br>
        								  2. 주문접수 버튼을 클릭하여 지정된 시간에 맞춰서 집 앞에 세탁물 가방을 놓아주세요.
        								  <br>
        								  3. 빨래널자에서 세탁물을 수거하고 세탁하여 고객님께 연락을 드립니다.
        								  <br> 
        								  4. 세탁 완료 후 지정된 시간에 배달되는 세탁물 가방을 확인해주세요
        								  <br>
        								  5. 빨래 끝~!
      									</div>
    								</div>
    								
    								<div class="card-header" id="headingOne">
      								<h2 class="mb-0">
        								<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          										빨래 세척 시 사용하는 제품(세제 / 섬유유연제)이 궁금해요.
        								</button>
      								</h2>
    							</div>
    							
    							    <div id="collapseTwo" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
     									 <div class="card-body">
        								  1. 빨래널자에서 제공하는 세탁물 가방에 세탁물을 넣어주세요.
        								  <br>
        								  2. 주문접수 버튼을 클릭하여 지정된 시간에 맞춰서 집 앞에 세탁물 가방을 놓아주세요.
        								  <br>
        								  3. 빨래널자에서 세탁물을 수거하고 세탁하여 고객님께 연락을 드립니다.
        								  <br> 
        								  4. 세탁 완료 후 지정된 시간에 배달되는 세탁물 가방을 확인해주세요
        								  <br>
        								  5. 빨래 끝~!
      									</div>
    								</div>
    								
    								<div class="card-header" id="headingOne">
      								<h2 class="mb-0">
        								<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
          										만약 실수로 드라이클리닝과 같은 특수 세탁이 필요한 빨래를 세탁 가방에 집어넣었다면 어떻게 하죠?
        								</button>
      								</h2>
    							</div>
    							
    							    <div id="collapseThree" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
     									 <div class="card-body">
        								  1. 빨래널자에서 제공하는 세탁물 가방에 세탁물을 넣어주세요.
        								  <br>
        								  2. 주문접수 버튼을 클릭하여 지정된 시간에 맞춰서 집 앞에 세탁물 가방을 놓아주세요.
        								  <br>
        								  3. 빨래널자에서 세탁물을 수거하고 세탁하여 고객님께 연락을 드립니다.
        								  <br> 
        								  4. 세탁 완료 후 지정된 시간에 배달되는 세탁물 가방을 확인해주세요
        								  <br>
        								  5. 빨래 끝~!
      									</div>
    								</div>
    								
    								<div class="card-header" id="headingOne">
      								<h2 class="mb-0">
        								<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
          										수거 시간과 배송 시간은 변경이 가능한가요?
        								</button>
      								</h2>
    							</div>
    							
    							    <div id="collapseFour" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
     									 <div class="card-body">
        								  1. 빨래널자에서 제공하는 세탁물 가방에 세탁물을 넣어주세요.
        								  <br>
        								  2. 주문접수 버튼을 클릭하여 지정된 시간에 맞춰서 집 앞에 세탁물 가방을 놓아주세요.
        								  <br>
        								  3. 빨래널자에서 세탁물을 수거하고 세탁하여 고객님께 연락을 드립니다.
        								  <br> 
        								  4. 세탁 완료 후 지정된 시간에 배달되는 세탁물 가방을 확인해주세요
        								  <br>
        								  5. 빨래 끝~!
      									</div>
    								</div>
    								
    								<div class="card-header" id="headingOne">
      								<h2 class="mb-0">
        								<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="true" aria-controls="collapseFive">
          										빨래 널자에서 제 세탁물을 어떻게 관리하나요?
        								</button>
      								</h2>
    							</div>
    							
    							    <div id="collapseFive" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
     									 <div class="card-body">
        								  1. 빨래널자에서 제공하는 세탁물 가방에 세탁물을 넣어주세요.
        								  <br>
        								  2. 주문접수 버튼을 클릭하여 지정된 시간에 맞춰서 집 앞에 세탁물 가방을 놓아주세요.
        								  <br>
        								  3. 빨래널자에서 세탁물을 수거하고 세탁하여 고객님께 연락을 드립니다.
        								  <br> 
        								  4. 세탁 완료 후 지정된 시간에 배달되는 세탁물 가방을 확인해주세요
        								  <br>
        								  5. 빨래 끝~!
      									</div>
    								</div>
    								
    								<div class="card-header" id="headingOne">
      								<h2 class="mb-0">
        								<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseSix" aria-expanded="true" aria-controls="collapseSix">
          										만약 추가로 빨래가방을 요청하면 요금이 달라지나요?
        								</button>
      								</h2>
    							</div>
    							
    							    <div id="collapseSix" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
     									 <div class="card-body">
        								  1. 빨래널자에서 제공하는 세탁물 가방에 세탁물을 넣어주세요.
        								  <br>
        								  2. 주문접수 버튼을 클릭하여 지정된 시간에 맞춰서 집 앞에 세탁물 가방을 놓아주세요.
        								  <br>
        								  3. 빨래널자에서 세탁물을 수거하고 세탁하여 고객님께 연락을 드립니다.
        								  <br> 
        								  4. 세탁 완료 후 지정된 시간에 배달되는 세탁물 가방을 확인해주세요
        								  <br>
        								  5. 빨래 끝~!
      									</div>
    								</div>
    								
    								<div class="card-header" id="headingOne">
      								<h2 class="mb-0">
        								<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseSeven" aria-expanded="true" aria-controls="collapseSeven">
          										특수 세탁물과 이불(커튼)은 맡길 수 없나요?
        								</button>
      								</h2>
    							</div>
    							
    							    <div id="collapseSeven" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
     									 <div class="card-body">
        								  1. 빨래널자에서 제공하는 세탁물 가방에 세탁물을 넣어주세요.
        								  <br>
        								  2. 주문접수 버튼을 클릭하여 지정된 시간에 맞춰서 집 앞에 세탁물 가방을 놓아주세요.
        								  <br>
        								  3. 빨래널자에서 세탁물을 수거하고 세탁하여 고객님께 연락을 드립니다.
        								  <br> 
        								  4. 세탁 완료 후 지정된 시간에 배달되는 세탁물 가방을 확인해주세요
        								  <br>
        								  5. 빨래 끝~!
      									</div>
    								</div>
    								
    								<div class="card-header" id="headingOne">
      								<h2 class="mb-0">
        								<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseEight" aria-expanded="true" aria-controls="collapseEight">
          										셔츠를 맡길 때 드라이 클리닉과 다림질이 제공되나요?
        								</button>
      								</h2>
    							</div>
    							
    							    <div id="collapseEight" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
     									 <div class="card-body">
        								  1. 빨래널자에서 제공하는 세탁물 가방에 세탁물을 넣어주세요.
        								  <br>
        								  2. 주문접수 버튼을 클릭하여 지정된 시간에 맞춰서 집 앞에 세탁물 가방을 놓아주세요.
        								  <br>
        								  3. 빨래널자에서 세탁물을 수거하고 세탁하여 고객님께 연락을 드립니다.
        								  <br> 
        								  4. 세탁 완료 후 지정된 시간에 배달되는 세탁물 가방을 확인해주세요
        								  <br>
        								  5. 빨래 끝~!
      									</div>
    								</div>
    						</div>
    					</div>			
			</tbody>
		</table>
		
		<!-- 1:1 문의 글 작성 페이지로 이동되는 버튼 생성 -->
		<div class="row justify-content-center">
			<form action="${appRoot }/help/ask">
			 	<input class="btn btn-danger" type="submit" value="1:1 문의">
			 </form>
		</div>
		
		<div class="row justify-content-center">
			
			<h1>
				1588 - 0000
			</h1>
			
		</div>
		
		<div class="row justify-content-center">
			고객 센터 운영 시간
			 평일(월~금) 09:00 ~ 18:30
			 / 주말(토) 09:00 ~ 13:00
		</div>
		
		<br>
		
		<hr>
		
		 <div class="row justify-content-around">
		 	<div class="row">
		 
		 		<div class="mr-10">
		 			<img src="${appRoot }/resources/image/logo.jpg" alt="...">
		 		</div>
		 	
		 	</div>
		 	
		 	<div class="row">
		 		<div>
		 			서울시 강남구 삼성동 1234 우 : 123-1234
		 			<br>
					TEL:02-123-1234 Email:email@domain.com
					<br>
					COPYRIGHT (C) 빨래널자 ALL RIHGTS RESERVED
					<br>
				</div>
		 	</div>
		 	
		 	<div class="row">
		 		<span >
		 			<a href="#">
		 			 	<img src="${appRoot }/resources/image/blog.jpg">
		 			</a>
		 			<a href="#">
		 				<img  src="${appRoot }/resources/image/facebook.gif">
		 			</a>
		 			<a href="#">
		 				<img  src="${appRoot }/resources/image/twitter.gif">
		 			</a>
		 		</span>
		 	</div>
		 		
		 </div>
		
	</div>
</body>
</html>