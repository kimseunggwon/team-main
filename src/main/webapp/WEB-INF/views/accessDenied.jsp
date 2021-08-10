<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<link href="${appRoot }/resources/favicon/brand_logo.png" rel="shortcut icon" type="image/x-icon">

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>
<style type="text/css">
@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
	font-family: 'GongGothicMedium';
}
</style>

<title>Access Denied</title>
</head>
<body>
<div style="text-align: center; margin-top: 15%" class="container">
	<h1 style="font-weight: bolder; font-size: 4em">접근 권한이 없는 페이지 입니다.</h1>
	<h3 style="margin-top: 40px;">궁금하신 사항은 <a style="text-decoration: none;" href="${appRoot}/help/helpdesk">고객센터</a>로 문의해 주시기 바랍니다.</h3>
	
	<h5 style="margin-top: 110px;"><a style="text-decoration: none;" color: black;" href="${appRoot}/member/main">메인화면</a>으로 가기</h5>
</div>
</body>
</html>