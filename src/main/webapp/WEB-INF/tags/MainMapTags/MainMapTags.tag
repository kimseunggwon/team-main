<%@ tag language="java" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="pinfo" scope="request"/>
</sec:authorize>
	



<nav class="Tags"> 
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5&submodules=geocoder"></script>

<div id="map" style="width: 50%; height: 400px;"></div>
<script type="text/javascript">

</script>

<input type="text" id="userlat" value="${pinfo.member.lat }">
<input type="text" id="userlag" value="${pinfo.member.lag }">
</nav>

