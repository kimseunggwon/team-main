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
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
	font-family: 'GongGothicMedium';
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
</style>
<!-- script src="${appRoot }/resources/js/subscribe/subscribe-calendar.js" -->
</head>
<body>
	<div class="container">
		<%-- 진아가 
		여기는 [구독 최종 확인] 페이지입니다.
		1. 구독자ID = subsId
		2. 구독자 주소 = subAddress
		3. 구독자가 선택한 구독 옵션 = subsOptions
		4. 구독 시작 날짜 ~ 빨래 받는 날짜 = 구독 기간 = subsStartDate
		5. 결제 금액 방식 = subsAmount
		6. 이전으로 / 구독 취소하기(메인 GO)
		7. 추후 논의 (리뷰 보기 + 마이페이지 등등)
		--%>
		<form name="calendarFrm" id="calendarFrm" action="" method="GET">

			<div class="calendar">

				<!--날짜 네비게이션  -->
				<div class="navigation">
					<a class="before_after_year"
						href="${appRoot }/subscribe/finalinfo?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
						&lt;&lt; <!-- 이전해 -->
					</a> <a class="before_after_month"
						href="${appRoot }/subscribe/finalinfo?year=${today_info.before_year}&month=${today_info.before_month}">
						&lt; <!-- 이전달 -->
					</a> <span class="this_month"> &nbsp;${today_info.search_year}.
						<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
					</span> <a class="before_after_month"
						href="${appRoot }/subscribe/finalinfo?year=${today_info.after_year}&month=${today_info.after_month}">
						<!-- 다음달 --> &gt;
					</a> <a class="before_after_year"
						href="${appRoot }/subscribe/finalinfo?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
						<!-- 다음해 --> &gt;&gt;
					</a>
				</div>

				<!-- <div class="today_button_div"> -->
				<!-- <input type="button" class="today_button" onclick="javascript:location.href='/calendar.do'" value="go today"/> -->
				<!-- </div> -->
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
											<input hidden class="date-index" value="${date_status.index % 7 }">
											<div></div>
										</td>
									</c:when>
									<c:when test="${date_status.index % 7 == 0}">
										<td class="sun_day">
											<div class="sun datelist-date">${dateList.date}</div>
											<input hidden class="date-index" value="${date_status.index % 7 }">
											<div></div>
										</td>
									</c:when>
									<c:otherwise>
										<td id="normal-day" class="normal_day">
											<div class="date">${dateList.date}</div>
											<input hidden class="datelist-date" value="${dateList.date }">
											<input hidden class="date-index" value="${date_status.index % 7 }"> 
											<div></div>
										</td>
									</c:otherwise>
								</c:choose>
								<c:if test="${date_status.index% 7 == 6}">
									<%-- 토요일에 tr 끝 --%>
									</tr><tr>
								</c:if>
							</c:forEach>
						</tr>
				</table>
			</div>
		</form>
	</div>

	<ul class="list-unstyled" id="subscribe-date-container">

	</ul>
</body>
</html>