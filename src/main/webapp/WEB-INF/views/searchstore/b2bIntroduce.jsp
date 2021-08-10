<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<!DOCTYPE html>
<html>
<head>

<link href="${appRoot }/resources/favicon/brand_logo.png" rel="shortcut icon" type="image/x-icon">

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>우리가게는요~</title>
</head>
<style>
@font-face {
	font-family: 'GongGothicMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	width: 600px;
	height: 950px;
	font-family: 'GongGothicMedium';
}

.wrapper {
	display: inline-block;
	box-shadow: 0px 0px 6px 2px black;
	width: 100%;
	height: 100%;
}

.storeName {
	border-bottom-color: gray;
	border-bottom-width: 2px;
	border-bottom-style: solid;
	height: 50px;
}

.imgPage {
	border-bottom-color: gray;
	border-bottom-width: 2px;
	border-bottom-style: solid;
	height: 450px;
}

.like {
	border-bottom-color: gray;
	border-bottom-width: 2px;
	border-bottom-style: solid;
	height: 50px;
}

.storeInfo {
	border-bottom-color: gray;
	border-bottom-width: 2px;
	border-bottom-style: solid;
	height: 200px;
}

.introduce {
	height: 200px;
}

.info {
	padding-left: 8px;
    padding-top: 3px;
	color: #787878;
}
.img {
	width: auto;
    height: 50px;
    margin: 1.5%;
}
#info1 {
	padding-left: 8px;
    padding-top: 3px;
}
.like {
	font-size: 30px;
}
</style>
<script type="text/javascript">
	$(function() {
		var storename = "${storename}";
		var test = storename.includes("빨래방");
		$('.storeName').text(test ? storename : storename + " 빨래방");
		
		var likeAVG = "${avg}";
		$('.like').text(likeAVG == "" ? "평점 " + "0.00" : "평점 " + likeAVG);
	})
</script>

<body>
	<div class="wrapper">
		<div>
			<img class="img" src="${appRoot }/resources/image/others/brand_logo_300px.png"
				alt="...">

		</div>
		<div class="imgPage">
			<img style="max-width: 100%; height: 100%;"
				src="${imgIntroRoot}${fileName }" />
		</div>
		<div class="like"></div>
		<div class="storeInfo">
			<div class="storeName" style="font-size: 30px; color: #9E3D00;padding: 3px;"></div>
			<div class="info">주소: ${storeaddress }</div>
			<div class="info">번호: ${storePhonenum }</div>
			<div id="info1">${storeinfo }</div>
		</div>
		<div id="info1" class="introduce">${introduce }</div>

	</div>


</body>
</html>