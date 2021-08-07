<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<meta charset="UTF-8">
<title>Subscription Information File</title>
<style TYPE="text/css">
@font-face {
	font-family: 'GongGothicMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'GongGothicMedium';
}

#logo {
	padding: 50px;
}

body {
	scrollbar-face-color: #F6F6F6;
	scrollbar-highlight-color: #bbbbbb;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #bbbbbb;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #bbbbbb;
	margin-left: "0px";
	margin-right: "0px";
	margin-top: "0px";
	margin-bottom: "0px";
}

td {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

th {
	font-family: "돋움";
	font-size: 9pt;
	color: #000000;
}

select {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

A:link {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:visited {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:active {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

A:hover {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

.day {
	width: 100px;
	height: 30px;
	font-weight: bold;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
}

.sat {
	color: #529dbc;
}

.sun {
	color: red;
}

.today_button_div {
	float: right;
}

.today_button {
	width: 100px;
	height: 30px;
}

.calendar {
	width: 80%;
	margin: auto;
}

.navigation {
	margin-top: 100px;
	margin-bottom: 30px;
	text-align: center;
	font-size: 25px;
	vertical-align: middle;
}

.calendar_body {
	width: 100%;
	background-color: #FFFFFF;
	border: 1px solid white;
	margin-bottom: 50px;
	border-collapse: collapse;
}

.calendar_body .today {
	border: 1px solid white;
	height: 120px;
	background-color: #88c9f2;
	text-align: left;
	vertical-align: top;
}

.calendar_body .date {
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .sat_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sat_day .sat {
	color: #529dbc;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .sun_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sun_day .sun {
	color: red;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .normal_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	vertical-align: top;
	text-align: left;
}

.before_after_month {
	margin: 10px;
	font-weight: bold;
}

.before_after_year {
	font-weight: bold;
}

.this_month {
	margin: 10px;
}

.subdate, .normal_day.subdate {
	text-decoration: underline;
	background-color: #FFC0D5;
}

.shadow-container {
	box-shadow: 5px 3px 20px gray;
}
</style>
<!-- script src="${appRoot }/resources/js/subscribe/subscribe-calendar.js" -->
</head>
<body>
	<div class="container">
		<%-- 진아가 
		여기는 [구독 최종 확인] 페이지입니다.
		--%>
		
		<div class="container">
			<div class="row justify-content-center">
				<a href="${appRoot }/member/main"> <img id="logo" alt="jinah-logo"
					src="${appRoot }/resources/image/others/brand_logo_400px.png">
				</a>
			</div>
			<br><br>
			<div class="row justify-content-center">
				<span><h2>스케줄 설계 완료</h2></span>
			</div>
		</div>

		
		<form name="calendarFrm" id="calendarFrm" action="" method="GET">

			<div class="calendar">

				<!--날짜 네비게이션  -->
				<div class="navigation">
					<a class="before_after_year"
						href="${appRoot }/subscribe/finalinfo?year=${today_info.search_year - 1}&month=${today_info.search_month - 1}">
						&lt;&lt; <!-- 이전해 -->
					</a> <a class="before_after_month"
						href="${appRoot }/subscribe/finalinfo?year=${today_info.before_year}&month=${today_info.before_month}">
						&lt; <!-- 이전달 -->
					</a> <span class="this_month"> &nbsp;${today_info.search_year}.
						<c:if test="${today_info.search_month < 10}">0</c:if>${today_info.search_month}
					</span> <a class="before_after_month"
						href="${appRoot }/subscribe/finalinfo?year=${today_info.after_year}&month=${today_info.after_month}">
						<!-- 다음달 --> &gt;
					</a> <a class="before_after_year"
						href="${appRoot }/subscribe/finalinfo?year=${today_info.search_year + 1}&month=${today_info.search_month - 1}">
						<!-- 다음해 --> &gt;&gt;
					</a>
				</div>

				<!-- <div class="today_button_div"> -->
				<!-- <input type="button" class="today_button" onclick="javascript:location.href='/calendar.do'" value="go today"/> -->
				<!-- </div> -->
				<div class="shadow-container">
				<table class="calendar_body">

					<thead>
						<tr bgcolor="#0583f2">
							<td class="day sun">일</td>
							<td style="color: white;" class="day">월</td>
							<td style="color: white;" class="day">화</td>
							<td style="color: white;" class="day">수</td>
							<td style="color: white;" class="day">목</td>
							<td style="color: white;" class="day">금</td>
							<td style="color: white;" class="day sat">토</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:forEach var="dateList" items="${dateList}"
								varStatus="date_status">
								<c:choose>
									<c:when test="${dateList.value =='today'}">
										<td class="today">
											<div id="today" value="${dateList.date }" class="date">${dateList.date}</div>
											<div></div>
										</td>
									</c:when>
									<c:when test="${date_status.index % 7 == 6}">
										<td class="sat_day">
											<div class="sat datelist-date">${dateList.date}</div>
											<div></div>
										</td>
									</c:when>
									<c:when test="${date_status.index % 7 == 0}">
										<td class="sun_day">
											<div class="sun datelist-date">${dateList.date}</div>
											<div></div>
										</td>
									</c:when>
									<c:otherwise>
										<td
											id="normal-day"
											class="normal_day 
												<c:if test='${subDateList.contains(dateList.fullDate)}'>
												  subdate
												</c:if>		
											">
											<div
												class="date
												<c:if test='${subDateList.contains(dateList.fullDate)}'>
												  subdate
												</c:if>
											
											">${dateList.date}</div>
											<input hidden class="datelist-date" value="${dateList.date }">
									</c:otherwise>
								</c:choose>
								<c:if test="${date_status.index% 7 == 6}">
								<%-- 토요일에 tr 끝 --%>
						</tr>
						<tr>
							</c:if>
							</c:forEach>
						</tr>
				</table>
				</div>

				<div class="row">
					
					<div class="col">
					<ul>
						<c:forEach var="subDate" items="${subDateList }" varStatus="status">
								<li>${subDate }</li>
								
							<c:if test="${Math.floor(fn:length(subDateList) / 2 -1 ) == status.index }"	>
								</ul>
								</div>
								<div class="col">
								<ul>
							</c:if>
								
						</c:forEach>
					</div>
					</ul>
				</div>
			</div>
		</form>
	</div>

		<!-- 구독회원의 구독 최종 결과 정보 -->
		<div id="re-write-content" class="container">
			<div class="row justify-content-center">
				<div class="col-8">
						<div class="item form-group">
							<label for="sub-input1">이름</label> 
							<input id="sub-input1" class="form-control" value="${subInfo.subsName }" readonly>
						</div>
						
						<!-- data : userid -->
						<input type="hidden" name="userid"
						value="${pinfo.member.userid }" readonly>
						
						<div class="item form-group">
							<label for="sub-input2">나의 주소</label> 
							<input id="sub-input2" class="form-control" value="${subInfo.userAddress }" readonly>
						</div>
						
						<div class="item form-group">
							<label for="sub-input3">연락처</label> 
							<input id="sub-input3" class="form-control" value="${subInfo.userPhonenum }" readonly>
						</div>
						
						<div class="item form-group">
							<label for="sub-input4">닉네임</label> 
							<input id="sub-input4" class="form-control" value="${subInfo.userNickname }" readonly>
						</div>
						
						
						<hr><br>
						
						<!-- 결제 금액 -->
					<!-- subsAmount -->
						<div class="item form-group">
							<label for="sub-inpu5">결제 금액</label> 
							<input id="sub-input5" class="form-control" value="${subInfo.subsAmount }" readonly>
						</div>
						
						<!-- 결제 옵션 -->
						<div class="item form-group">
							<label for="sub-input6">선택한 구독 옵션</label> 
							<input id="sub-input6" class="form-control" value="${subInfo.subsOptions }" readonly>
						</div>
						<hr><br>
						<!-- 이용한 세탁소 위치 정보 -->
						<div class="item form-group">
							<label for="sub-input7">구독 세탁소 이름</label> 
							<input id="sub-input7" class="form-control" value="${subInfo.storeName }" readonly>
						</div>
						
						<div class="item form-group">
							<label for="sub-input8">구독 세탁소 주소</label> 
							<input id="sub-input8" class="form-control" value="${subInfo.storeAddress }" readonly>
						</div>
						
						<div class="item form-group">
							<label for="sub-input9">구독 세탁소 연락처</label> 
							<input id="sub-input9" class="form-control" value="${subInfo.storePhonenum }" readonly>
						</div>
				</div>
			</div>
		</div>
</body>
</html>