<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>우리가게는요~</title>
</head>
<style>
body {
	width: 600px;
	height: 950px;
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
</style>
<body>
	<div class="wrapper">
		<div class="storeName"><div>${storename }</div></div>
		<div class="imgPage">
			<img src="${imgIntroRoot }${id}/${fileName}"
				alt="${imgIntroRoot }readyimg/${fileName}" />
		</div>
		<div class="like"></div>
		<div class="storeInfo">
			<div>${storeaddress }</div>
			<div>${storePhonenum }</div>
			<div>${storeinfo }</div>
		</div>
		<div class="introduce">${introduce }</div>

	</div>


</body>
</html>