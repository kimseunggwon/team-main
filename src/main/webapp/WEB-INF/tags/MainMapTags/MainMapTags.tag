<%@ tag language="java" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="pinfo" scope="request"/>
</sec:authorize>
	
<style>
.storeInfoBtn {
	font-size: 12px;
	border: solid 1px #dadada;
	background-color: white;
	-webkit-border-radius: 40px;
	-moz-border-radius: 40px;
	border-radius: 40px;
}
</style>

<nav class="Tags"> 
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5&submodules=geocoder"></script>

	<div id="map" style="width: 900px; height: 400px;"></div>
<script type="text/javascript">
$(function() {
	let userAddress = "${pinfo.member.address}";
	
	naver.maps.Service
	.geocode({ query : userAddress
			// String 타입의 주소값
			},
			function(status, response) {
				if (status !== naver.maps.Service.Status.OK) {
					// 실행이 되지 않을 경우 
					return alert('Something wrong!');

				}

				var result = response.v2, items = result.addresses;
				let lat = parseFloat(items[0].x);
				let lag = parseFloat(items[0].y);

				
	
	/* 지도 */
	var map = new naver.maps.Map('map', {
		center : new naver.maps.LatLng(lag, lat),
		zoom : 14
	});
	/* 유저 마커 */
	var markerOptions = {
			position: new naver.maps.LatLng(lag, lat),
		    map: map,
		    icon: {		    	
		        content: [	
			        		`<div onmouseover="$('#ad1').show();" onmouseout="$('#ad1').hide();" >` +
				        		`<div><img src="${appRoot}/resources/image/home_button.png"></div>`+
				        		`<div id="ad1" style="font-size:8px;padding-top:5px; padding-bottom:5px; padding-left:5px; padding-right:5px;
				        		background-color:#88C9F2; color:black; text-align:center; border:1px;
				        		border-radius:14px; opacity:75%; display:none;">★우리집<br> 주소:${pinfo.member.userAddress}</div>`+
			        		`</div>`	        	
		        	].join(''),
		    },
		};
		var marker = new naver.maps.Marker(markerOptions);
		
		var data = {
				storelat : lat,
				storelag : lag
		}
		
		$.ajax({
			type: 'POST',
			url: '${appRoot}/won/tagGetB2bStoreInfo',
			data : JSON.stringify(data),
			contentType : "application/json",
			success : function(list) {

				/* 집주변 빨래방 마커 */
				for(let store of list ){
					
					 let markerHTML = `	 						
						<div class="markerid" style="text-align: left;" onmouseover="$(this).find('.ad1').show();" onmouseout="$(this).find('.ad1').hide();">
							<div><img src="${appRoot}/resources/image/laundry-icon1.png"></div>
						<div class="ad1" style="padding-top:5px; padding-bottom:5px; padding-left:5px; padding-right:5px;
		        		background-color:#88C9F2; color:black; border:1px; border-radius:14px; opacity:75%;width:auto;height:auto; display:none"> 
							<div style="font-size:6px;color:#000000"><b>\${store.storename}</b></div>
							<div style="font-size:6px; color:black;">가게 주소: \${store.storeaddress}</div>
							<div style="font-size:6px; color:black;">가게 번호: \${store.storePhonenum}</div>
							<div><button class="storeInfoBtn" data-id="\${store.id}">가게정보</button></div>
						</div>
						</div>` ;  
					
				let laundrymarker = {
						position: new naver.maps.LatLng(store.storelag, store.storelat),
					    map: map,
					    icon: {
					        content: [	markerHTML	].join('')
					        	
					       /*  size: new naver.maps.Size(22, 35),
					        anchor: new naver.maps.Point(15, 35)  */
					    },
					    animation: naver.maps.Animation.BOUNCE
					};
					 let marker = new naver.maps.Marker(laundrymarker);
					}
				
				/* 가게정보 갖고오기(추천) */
				$(".storeInfoBtn").click(function() {
					storeInfoURL(this);
					})
				
				function storeInfoURL(btn) {
					var id = $(btn).attr('data-id');

					
					let url = "${appRoot}/searchstore/b2bIntroduce/" + id
					let name = "빨래스타그램";
					let option = "width = 620, height = 900, top = 100, left = 200, location = no, resizable = yes, toolbars=no, menubar=no"
					
					window.open(url, name, option);
				}
				
				},
				error : function() {
					console.log("실패");
				}
				})
				
				
			})
		})

</script>
</nav>

