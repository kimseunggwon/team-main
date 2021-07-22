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
<div class="container">	
    
    <div class="jumbotron">
  <h1 class="display-4">나의 구독정보</h1>
  <p class="lead"><span class="badge badge-info">실버</span>박진아</p>
  <hr class="my-4"> 
  <p><span class="badge badge-info">실버</span>박진아</p>
  <a class="btn btn-primary btn-lg" href="#" role="button">구독연장</a>
  <a class="btn btn-primary btn-lg" href="#" role="button">나의 이용요금</a>
  <a class="btn btn-primary btn-lg" href="#" role="button">구독자 이벤트</a>
</div>
    
    
   <form>
  <div class="form-group">
    <label for="formControlRange">남은 구독날짜</label>
    <input type="range" class="form-control-range" id="formControlRange">
  </div>
</form>

<br>
<br>
<h1>요일별 사용량</h1> 
<div style="height: 100px; background-color: rgba(255,0,0,0.1);">
  <div class="h-25 d-inline-block" style="width: 120px; background-color: rgba(0,0,255,.1)">월요일 </div>
  <div class="h-50 d-inline-block" style="width: 120px; background-color: rgba(0,0,255,.1)">화요일 </div>
  <div class="h-75 d-inline-block" style="width: 120px; background-color: rgba(0,0,255,.1)">수요일 </div>
  <div class="h-100 d-inline-block" style="width: 120px; background-color: rgba(0,0,255,.1)">목요일 </div>
  <div class="h-25 d-inline-block" style="width: 120px; background-color: rgba(0,0,255,.1)">금요일</div>
  <div class="h-65 d-inline-block" style="width: 120px; background-color: rgba(0,0,255,.1)">토요일</div>
  <div class="h-75 d-inline-block" style="width: 120px; background-color: rgba(0,0,255,.1)">일요일</div>
</div>
 

</div>
</body>
</html>






