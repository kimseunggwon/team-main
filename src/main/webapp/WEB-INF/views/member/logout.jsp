<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
 
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<style type="text/css">
.jumbotron{
 
  background-color:#50C2FF;
  
}
.btn-group-vertical{
 float:left;
  
}
</style>
<div class="container">	
 
 <ul class="nav justify-content-end">
  <li class="nav-item1">
    <a class="nav-link active" href="#">고객센터</a>
  </li>
  <li class="nav-item2"> 
    <a class="nav-link" href="${appRoot }/member/login">로그인</a>
  </li> 
   <form class="form-inline">
    <input class="form-control mr-sm-2" type="search" placeholder="검색" >
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
  </form> 
</ul>   

<div class="btn-group-vertical" id="button1">
  <button type="button" class="btn btn-info">회원정보</button>
  <button type="button" class="btn btn-info">구독정보</button>
  <button type="button" class="btn btn-info">진행상황</button>
  <button type="button" class="btn btn-info">매장찾기</button>
  <button type="button" class="btn btn-info">1:1문의</button>
  <button type="button" class="btn btn-info">사용자후기</button>
  </div>
 
 
  
  <div class="jumbotron"> 
  <h1 class="display-4">안녕하세요 고객님!</h1>
  <p class="lead">로그인을 완료하고 저희 구독 서비시를 이용해보세요.<br>
   혹시 아직 서비스를 이용하지 않고 계신가요~? <br>
   서둘러 밑에 구독하기 버튼을 눌러주세요.! 
  </p>
  <hr class="my-4">
  
  <!--  구독  -->
  
 <div class="row">
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">싱글 구독</h5>
        <p class="card-text">혼자 사는 싱글들을 위한 맞춤형 구독</p>
        <a href="#" class="btn btn-info">1인 가구 구독</a>
      </div>
    </div> 
  </div>
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body"> 
        <h5 class="card-title">대형 구독</h5>
        <p class="card-text">가족 구성원들과 함께 이용하는 구독 서비스</p>
        <a href="#" class="btn btn-info">다세대 가구 구독</a>
      </div>
    </div>
  </div>
</div>
  
  <!--  <p></p>
  <a class="btn btn-light" href="#" role="button">구독하기</a> -->
</div>
  
 
  
  
  


  
</div>

</body>
</html>






