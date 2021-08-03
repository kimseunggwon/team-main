<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>매장 찾기</title>

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5&submodules=geocoder"></script>
<script type="text/javascript">
	function showhidebtn1() {
		$("#searchName").show();
		$("#searchAddress").hide();
	}

	function showhidebtn2() {
		$("#searchAddress").show();
		$("#searchName").hide();
	}
</script>

<script type="text/javascript">


	$(function() {
		$("#searchName-btn").click(function() {

			var storename = $("#name-store").val()
			
			var data = {
				storename : storename
			}

			$.ajax({
				type : "post",
				url : "${appRoot}/won/searchstore",
				data : data,
				success : function(data) {
					console.log(data);
				for(var store of data) {
					let markerHTML = `<div style="text-align: left;" onmouseover="$(this).find('.ad1').show();" onmouseout="$(this).find('.ad1').hide();">
										<div><img src="${appRoot}/resources/image/home_button.png"></div>
										<div class="ad1" style="padding-top:5px; padding-bottom:5px; padding-left:5px; padding-right:5px;
						        		background-color:#88C9F2; color:black; border:1px; border-radius:14px; opacity:75%; display:none"> 
										<div>\${store.storename}</div>
										<div>\${store.storeaddress}</div>
										<div>\${store.storePhonenum}</div>
										<div data-id="\${store.id}">가게정보 보기</div>
										</div>
										</div>` ;
							
					
					var laundrymarker = {
							position: new naver.maps.LatLng(store.storelag, store.storelat),
						    map: map1,
						    icon: {
						    	content: [ markerHTML
			        		].join('')

						    }
						};
						 var marker = new naver.maps.Marker(laundrymarker);
					}
				}
			})
		})
	})

</script>
<!-- 다음 주소검색 api -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

/* 2번 지도 */


	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {


						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("extraAddress").value = extraAddr;

						} else {
							document.getElementById("extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode;
						document.getElementById("address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("detailAddress")
								.focus();
						
						console.log(addr);
/* ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- */						
						/* 주소 위경도 전환 코드 */
						naver.maps.Service.geocode({
					        query: addr // /* String 타입의 주소값 */
					   		 }, function(status, response) {
						       if (status !== naver.maps.Service.Status.OK) {
						            // 실행이 되지 않을 경우 
				                    return alert('Something wrong!');
			                    
					         }
						        
					        var result = response.v2,
					        items = result.addresses;
			
					        var lat = parseFloat(items[0].x);
					        var lag = parseFloat(items[0].y);
					        
					        console.log(lat);
					        console.log(lag);
					        
/* ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
					         /* 2번 지도 */
					    	 var mapOptions2 = {
					    		center : new naver.maps.LatLng(lag, lat),
					    		zoom : 15
					    	};

					    	var map2 = new naver.maps.Map('map2', mapOptions2);  
/* ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
					        /* 검색한(우리집) 주소 마커 */
					        
							var markerOptions = {
								position: new naver.maps.LatLng(lag, lat),
							    map: map2,
							    icon: {
						        content: [	
							        		`<div style="text-align: left;" onmouseover="$(this).find('.ad1').show();" onmouseout="$(this).find('.ad1').hide();">` +
								        		`<div><img src="${appRoot}/resources/image/home_button.png"></div>`+
								        		`<div class="ad1" style="padding-top:5px; padding-bottom:5px; padding-left:5px; padding-right:5px;
								        		background-color:#88C9F2; color:white; text-align:center; border:1px;
								        		border-radius:14px; opacity:75%; display:none">우리집><주소: \${addr}</div>`+
							        		`</div>`
						        	
						        	].join(''),
						        	
						        size: new naver.maps.Size(22, 35),
						        anchor: new naver.maps.Point(15, 35)
						    }
						   
						};
						var marker = new naver.maps.Marker(markerOptions);
/* ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
						 /* 집 주변 빨래방 정보 갖고오기 */ 
						 var data = {
									storelat : lat,
									storelag : lag
										}
										
								$.ajax({
									type: 'post',
									url: '${appRoot}/won/searchaddress',
									data : JSON.stringify(data),
									contentType : "application/json",
									success : function(list) {
										console.log("성공");
										
										for(let address of list) {
											let markerHTML = `<div style="text-align: left;" onmouseover="$(this).find('.ad1').show();" onmouseout="$(this).find('.ad1').hide();">
												<div><img src="${appRoot}/resources/image/home_button.png"></div>
												<div class="ad1" style="padding-top:5px; padding-bottom:5px; padding-left:5px; padding-right:5px;
								        		background-color:#88C9F2; color:black; border:1px; border-radius:14px; opacity:75%; display:none"> 
												<div>\${address.storename}</div>
												<div>\${address.storeaddress}</div>
												<div>\${address.storePhonenum}</div>
												<div data-id="\${address.id}">가게정보 보기</div>
												</div>
												</div>` ;
											
											let laundrymarker = {
													position: new naver.maps.LatLng(address.storelag, address.storelat),
												    map: map2,
												    icon: {
												        content: [	markerHTML
																 ].join('')
												    },
												    animation: naver.maps.Animation.BOUNCE
												};
												 let marker = new naver.maps.Marker(laundrymarker);
										}
									},
									error: function() {
										console.log("실패");
									}
							})
					})
				}
			}).open();
	}
</script>

<style type="text/css">
@font-face {
	font-family: 'GongGothicMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'GongGothicMedium';
	display: inline-block;
	text-align: center;
	width: 100%;
}

.item3 {
	display: inline-block;
	text-align: center;
}
</style>
</head>
<body>
	<div>
		<a href="${appRoot }/member/main"> <img
			src="${appRoot }/resources/image/others/brand_logo_300px.png"
			alt="...">
		</a>
		<h1>가게 제목으로 빨래방 찾기</h1>
		<div class="item item2">
			<!-- 가게 제목으로 찾기 -->
			<button id="storeName" onclick="showhidebtn1()">●가게제목</button>

			<!-- 내집 주소로 주변 찾기 -->
			<button id="myAddress" onclick="showhidebtn2()">●우리집 주소로 찾기</button>
		</div>

		<!-- 가게 제목으로 검색할때 -->
		<div id="searchName">
			<div class="item item3">
				<div>
					<input id="name-store" type="text" placeholder="가게 이름">
					<button id="searchName-btn" type="submit">찾기</button>
				</div>
				<div>
					<div id="map1" style="width: 1000px; height: 600px;"></div>
					<!-- 가게정보 -->
					<div id="storeinfo1" style="display: none"></div>
				</div>
			</div>
		</div>

		<!-- 우리집 주소로 검색할때 -->
		<div id="searchAddress" style="display: none;">
			<div class="item item4">
				<div>
					<input type="button" onclick="sample6_execDaumPostcode()"
						value="우편번호 찾기"><br> <input type="text" id="postcode"
						placeholder="우편번호"> <input type="text" id="address"
						placeholder="주소"><br> <input type="text"
						id="detailAddress" placeholder="상세주소"> <input type="text"
						id="extraAddress" placeholder="참고항목">
				</div>
				<div style="display: inline-block;">
					<div id="map2" style="width: 1000px; height: 600px;"></div>
				</div>
			</div>
		</div>
	</div>

</body>



<script>
	/* 1번 지도 */
	var mapOptions1 = {
		center : new naver.maps.LatLng(37.3595704, 127.105399),
		zoom : 13
	};

	var map1 = new naver.maps.Map('map1', mapOptions1);

	/* 2번 지도 */
	var mapOptions2 = {
			center : new naver.maps.LatLng(37.3595704, 127.105399),
			zoom : 13
		};
	var map2 = new naver.maps.Map('map2', mapOptions2);
</script>



</html>






