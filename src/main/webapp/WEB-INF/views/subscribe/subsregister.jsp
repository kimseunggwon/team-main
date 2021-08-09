<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="bot" tagdir="/WEB-INF/tags/botnav"%>


<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>구독페이지</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5&submodules=geocoder"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5"></script>
<!-- jQuery 
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
-->
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js"></script>
</head>
<%-- 원혁이가
		여기는 [구독 및 결제] 페이지 입니다.
		1. 구독 종류 선택 - 3가지 (1인가구, 2인가구, 4인가구) 
		2. 주변 세탁방 정보
		3. 휴대폰 인증 (휴대폰 번호, ++)
		4. 결제정보 등록 (카드번호, 카드 만료일, 사용자 이름, 생년월일, 결제금액, 약관동의(의례상))
		5. 구독 완료	
		 --%>
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
	font-family: 'GongGothicMedium';
}

.otherStoreList {
	display: block;
	box-shadow: 0px 0px 6px 10px rgb(32 33 36/ 28%);
	border-radius: 30px;
	margin: 25px;
	height: 160px;
}

.ListBox {
	display: block;
	padding: 20px;
	height: 100px
}
/* .storeInfoBtn {
    width: 100%;
    height: 10px;
    background-color: rgb(32 33 36/ 28%);
    border: rgb(32 33 36/ 28%);
    box-shadow: 0px 0px 6px 11px rgb(32 33 36/ 28%);
    font-size: 11px;
    padding: 20px;
    margin: 0 auto;
    border-radius: 0px 0px 30px 30px;
} */
.col {
	width: 100%;
	margin-bottom: 30px;
	text-align: center;
	margin-top: 40px;
	display: inline-block;
}

.box1 {
	width: 15%;
	display: inline-block;
	border: 1px solid #bbb;
	height: 500px;
	margin: 2.5%;
	box-shadow: 0px 0px 6px 10px rgb(32 33 36/ 28%);
	border-color: rgba(223, 225, 229, 0);
}

.box1:hover {
	box-shadow: 0px 0px 6px 10px #B4DDF5;
}

.box1on {
	box-shadow: 0px 0px 6px 10px #B4DDF5;
}

.text1 {
	font-size: 32px;
	height: 33.33%;
}

.text2 {
	height: 33.33%;
	text-align: left;
}

.text3 {
	font-size: 32px;
	height: 33.33%;
}

.text4_sub {
	font-size: 80%;
}

.box2 {
	width: 20%;
	display: inline-block;
	border: 1px solid #bbb;
	height: 800px;
	margin: 2.5%;
	box-shadow: 0px 0px 6px 10px rgb(32 33 36/ 28%);
	border-color: rgba(223, 225, 229, 0);
}

.box2:hover {
	box-shadow: 0px 0px 6px 10px #B4DDF5;
}

.button:hover {
	box-shadow: 0px 0px 6px 10px #B4DDF5;
}

.box_sub1 {
	display: block;
	height: 300px;
	width: 100%;
}

.box_sub2 {
	display: block;
	height: 200px;
	width: 100%;
	text-align: left;
	padding: 10px;
}

.box_sub3 {
	display: block;
	height: 300px;
	width: 100%;
}

.storeInfoBtn {
	font-size: 12px;
	border: solid 1px #dadada;
	background-color: white;
	-webkit-border-radius: 40px;
	-moz-border-radius: 40px;
	border-radius: 40px;
}

.button_sang {
	background-color: #169EF2;
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	font-size: 18px;
	margin: 4px 2px;
	opacity: 1;
	transition: 0.3s;
	display: inline-block;
	text-decoration: none;
	cursor: pointer;
	-webkit-border-radius: 40px;
	-moz-border-radius: 40px;
	border-radius: 40px;
	width: 200px;
	font-family: 'GongGothicMedium';
}

.button_sang:hover {
	background: #0583F2;
}


.dateBlock {
	display: inline-flex;
    text-align: left;
    margin-left: 33.33%;
	margin-top: 3%;
    margin-bottom: 3%;    
}
.dateStamp {
	width: 300px;
    height: auto;
} 
.Qlqlr {
	width: 500px;
	display: flex;
}
.QlqlrShort {
	padding: 3%;
}
</style>
<script type="text/javascript">
	$(function() {
		/* 구독종류 클릭 모션 */
		function clickSubsType(elem1) {
			$(".box1").css("box-shadow", "0px 0px 6px 10px rgb(32 33 36/ 28%)");
			$(elem1).css("box-shadow", "0px 0px 6px 10px #B4DDF5");
			let finalAmount = $(elem1).find(".text3").text().substr(0,4);
			let subsOptions = $(elem1).find(".text1").text();

			
			$("#finalAmount").val(finalAmount);
			$("#finalSubsOptions").val(subsOptions);

		}
	

		$("#box1-1").click(function() {
			clickSubsType(this);
		})

		$("#box1-2").click(function() {
			clickSubsType(this);
		})

		$("#box1-3").click(function() {
			clickSubsType(this);
		})
		
	})
</script>

<script type="text/javascript">
	$(function() {
		
/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------ */		
	<!-- 지도 추천 -->
		let userAddress = "${pinfo.member.address}";

		naver.maps.Service
				.geocode(
						{
							query : userAddress
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



							let data = {
								lat : lat,
								lag : lag
							}

							$.ajax({
										type : "POST",
										url : "${appRoot}/subscribe/getNearStoreInfo",
										data : data,
										success : function(data) {
											console.log(data);
											

											if (data[0].id == null) {
												
												
											} else {
												
											let map = [];
											let mapn = [ 'map1', 'map2','map3' ];

											for (let i = 0; i < 3; i++) {

												map[i] = new naver.maps.Map( 
														mapn[i],
														{
															center : new naver.maps.LatLng(
																	data[i].storelag,
																	data[i].storelat),
															zoom : 12
														});

												/* 유저 집 마크 */
												var markerOptions = {
													position : new naver.maps.LatLng(
															lag, lat),
													map : map[i],
													icon : {

														content : [ `<div><img src="${appRoot}/resources/image/home_button.png"></div>` ]
																.join(''),
													},
												};
												var markerUser = new naver.maps.Marker(
														markerOptions);

												/* 빨래방 마크 */
												let laundrymarker = {
													position : new naver.maps.LatLng(
															data[i].storelag,
															data[i].storelat),
													map : map[i],
													icon : {
														content : [ `<div><img src="${appRoot}/resources/image/laundry-icon1.png"></div>`

														].join('')

													},
													animation : naver.maps.Animation.BOUNCE
												};
												let marker = new naver.maps.Marker(
														laundrymarker);
											
											}
											/* 매장 사진  */ 
											$("#fileNameId1").attr("src",(data[0].fileName != null ? '${imgIntroRoot}' + `\${data[0].id}` + '/' + `\${data[0].fileName}` : "${appRoot }/resources/image/readyimg.jpg"));
											$("#fileNameId2").attr("src",(data[1].fileName != null ? '${imgIntroRoot}' + `\${data[1].id}` + '/' + `\${data[1].fileName}` : "${appRoot }/resources/image/readyimg.jpg"));
											$("#fileNameId3").attr("src",(data[2].fileName != null ? '${imgIntroRoot}' + `\${data[2].id}` + '/' + `\${data[2].fileName}` : "${appRoot }/resources/image/readyimg.jpg"));
											
											
												$("#box_sub2-1").append(` 	<div class="forStoreId" data-id="\${data[0].id}">
																				<div class="checkAUTH" data-auth="\${data[0].auth}" style="color:#169EF2"></div>
																				<div style="font-size:22px;color:#9E3D00"> 가게 이름: \${data[0].storename}</div>
																				<div class="text4_sub" style="color:#787878">가게 주소: \${data[0].storeaddress}</div>
																				<div style="color:#787878">가게 번호: \${data[0].storePhonenum}</div>
																				<button class="storeInfoBtn">가게정보</button>
																			</div>`); 
												
												$("#box_sub2-2").append(`	<div class="forStoreId" data-id="\${data[1].id}">
																				<div class="checkAUTH" data-auth="\${data[0].auth}" style="color:#169EF2"></div>
																				<div style="font-size:22px;color:#9E3D00"> 가게 이름: \${data[1].storename}</div>
																				<div class="text4_sub" style="color:#787878">가게 주소: \${data[1].storeaddress}</div>
																				<div style="color:#787878">가게 번호: \${data[1].storePhonenum}</div>
																				<button class="storeInfoBtn">가게정보</button>
																			</div>`); 
												
												$("#box_sub2-3").append(`	<div class="forStoreId" data-id="\${data[2].id}">
																				<div class="checkAUTH" data-auth="\${data[0].auth}" style="color:#169EF2"></div>
																				<div style="font-size:22px;color:#9E3D00"> 가게 이름: \${data[2].storename}</div>
																				<div class="text4_sub" style="color:#787878">가게 주소: \${data[1].storeaddress}</div>
																				<div style="color:#787878">가게 번호: \${data[2].storePhonenum}</div>
																				<button class="storeInfoBtn">가게정보</button>
																			</div>`); 
												 
											/* auth별 본사/개인 표시 */
											var checkAUTH = $(".checkAUTH").attr('data-auth');
												if (checkAUTH == "ROLE_B2BUSER"){
													$('.checkAUTH').text("♥개인");

												} else if (checkAUTH == "ROLE_EMPUSER"){
													$('.checkAUTH').text("★본사");
												}
												
											/* 가게정보 갖고오기(추천) */
											$(".storeInfoBtn").click(function() {
												storeInfoURL(this);
												})
											
											function storeInfoURL(btn) {
												var id = $(btn).parent('div').attr('data-id');
												console.log(id);
												
												let url = "${appRoot}/searchstore/b2bIntroduce/" + id
												let name = "빨래스타그램";
												let option = "width = 620, height = 900, top = 100, left = 200, location = no, resizable = yes, toolbars=no, menubar=no"
												
												window.open(url, name, option);
											}
											
												
			 
											/* 주소종류 클릭 모션 */
											function clickAddressType(elem2) {
												$(".box2").css("box-shadow", "0px 0px 6px 10px rgb(32 33 36/ 28%)");
												$(elem2).css("box-shadow", "0px 0px 6px 10px #B4DDF5");
												let finalAddress = $(elem2).find(".text4_sub").text().substr(6);
												let finalStoreId = $(elem2).find('.forStoreId').attr('data-id');
												/* 주소 값 넣기 */
												$("#finalAddress").val(finalAddress);
												/* 주소id넣기 */
												$("#finalStoreId").val(finalStoreId);
											}
											
											$("#box2-1").click(function() {
												clickAddressType(this);
											})
											
											$("#box2-2").click(function() {
												clickAddressType(this);
											})
											
											$("#box2-3").click(function() {
												clickAddressType(this);
											})
											
											$("#addressList_modal_btn").click(function() {
												clickAddressType(this);
											})

											}
										}
										
									})
									
						})
/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------ */						
		<!-- 모달 열기 -->				
		$("#addressList_modal_btn").click(function() {
		$.ajax({
			type : "GET",
			url : "${appRoot}/subscribe/getStoreList",
			success : function(list) {
				let StoreListContainer = $("#storeList").empty();
				
				for (StoreAddress of list) {
					let storeListHTML = `<div class="otherStoreList">
											<div class="ListBox">
												<div id="\${StoreAddress.id}" style="color:#169EF2"></div>
												<div style="font-size:22px;color:#9E3D00"> 가게이름 :\${StoreAddress.storename}</div>
												<div class="modal_store_name" style="color:#787878"> 가게주소 : \${StoreAddress.storeaddress}</div>  
												<div class="modal_storeId" data-id="\${StoreAddress.id}"><button class="storeInfoBtn">가게정보</button></div>
											</div>
										</div>`
					
						StoreListContainer.append(storeListHTML);

					if (StoreAddress.auth == "ROLE_B2BUSER"){
						$("#"+`\${StoreAddress.id}`).text("♥개인");

					} else if (StoreAddress.auth == "ROLE_EMPUSER"){
						$("#"+`\${StoreAddress.id}`).text("★본사");
					}
				}
				
				
				/* 가게정보 갖고오기(모달 처음 리스트) */
				$(".storeInfoBtn").click(function() {
					storeInfoURL(this);
					})
				
				function storeInfoURL(btn) {
					var id = $(btn).parent('div').attr('data-id');
					console.log(id);
					
					let url = "${appRoot}/searchstore/b2bIntroduce/" + id
					let name = "빨래스타그램";
					let option = "width = 620, height = 950, top = 100, left = 200, location = no"
					
					window.open(url, name, option);
				}
			
					
				/* 선택시 기능 */
				function clickModalAddress(elem3) {
					let modal_finalAddress = $(elem3).find(".modal_store_name").text().substr(7);
					let modal_finalStoreId = $(elem3).find('.modal_storeId').attr('data-id');
					console.log(modal_finalStoreId);
					$(".otherStoreList").css("box-shadow", "0px 0px 6px 10px rgb(32 33 36/ 28%)");
					$(elem3).css("box-shadow", "0px 0px 6px 10px #B4DDF5");
					/* 주소 넣기 */
					$("#finalAddress").val(modal_finalAddress);		
					/* 가게id넣기 */
					$("#finalStoreId").val(modal_finalStoreId);	
				}
				
				$(".otherStoreList").click(function() {
					clickModalAddress(this)
				}) 
				
				/* 선택완료 기능 */
				$("#selectBTN").click(function() {
					let aaa = $("#finalAddress").val();
					if(aaa == "") {
						alert("주소를 선택해주세요");
					} else if (aaa != "") {
					$("#addressList-modal").modal('hide');	
					}
				})
			}
			
		})
	})
	
/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------ */	
	<!-- 검색창 -->
	$(".Searchbtn").click(function() {
		let type = $("#select1 option:selected").val();
		let keyword = $(".keyword1").val();
		
		
	
	let data = {
			type : type,
			keyword : keyword
	}
	
	$.ajax({
			type : "POST",
			data : data,
			url : "${appRoot}/subscribe/getStoreListBySearch",
			success : function(list1) {
				
				
				let StoreListContainer1 = $("#storeList").empty();
						
						for (StoreAddress of list1) {
							let storeListHTML1 = `<div class="otherStoreList">
														<div class="ListBox">
															<div id="\${StoreAddress.id}" style="color:#169EF2"></div>
															<div style="font-size:22px;color:#9E3D00"> 가게이름 :\${StoreAddress.storename}</div>
															<div class="modal_store_name" style="color:#787878"> 가게주소 : \${StoreAddress.storeaddress}</div>  
															<div class="modal_storeId" data-id="\${StoreAddress.id}"><button class="storeInfoBtn">가게정보</button></div>
														</div>
													</div>`;
								
							StoreListContainer1.append(storeListHTML1);
							
							if (StoreAddress.auth == "ROLE_B2BUSER"){
								$("#"+`\${StoreAddress.id}`).text("♥개인");

							} else if (StoreAddress.auth == "ROLE_EMPUSER"){
								$("#"+`\${StoreAddress.id}`).text("★본사");
							}
						}
						
						/* 가게정보 갖고오기(모달 검색 리스트) */
						$(".storeInfoBtn").click(function() {
							storeInfoURL(this);
							})
						
						function storeInfoURL(btn) {
							var id = $(btn).parent('div').attr('data-id');
							
							
							let url = "${appRoot}/searchstore/b2bIntroduce/" + id
							let name = "빨래스타그램";
							let option = "width = 620, height = 950, top = 100, left = 200, location = no"
							
							window.open(url, name, option);
						}
						
						function SeachClickModalAddress(elem4) {
							let modal_finalAddress = $(elem4).find(".modal_store_name").text().substr(7);
							let modal_finalStoreId = $(elem4).find('.modal_storeId').attr('data-id');
							console.log(modal_finalStoreId);
							$(".otherStoreList").css("box-shadow", "0px 0px 6px 10px rgb(32 33 36/ 28%)");
							$(elem4).css("box-shadow", "0px 0px 6px 10px #B4DDF5");
							/* 주소넣기 */
							$("#finalAddress").val(modal_finalAddress);
							/* 가게id 넣기 */
							$("#finalStoreId").val(modal_finalStoreId);
							
						}
						
						$(".otherStoreList").click(function() {
							SeachClickModalAddress(this)
						}) 
						
						/* 선택완료 기능 */
					$("#selectBTN").click(function() {
						let aaa = $("#finalAddress").val();
						if(aaa == "") {
							alert("주소를 선택해주세요");
						} else if (aaa != "") {
						$("#addressList-modal").modal('hide');	
						}
					})
			}
		})	
	})
	
	
	
	})
	


</script>

<script type="text/javascript">
$(function() {
		let date = new Date();
		let dateWeek = date.getDay();
		console.log(date);
		let dateString = date.toISOString();
		console.log(dateString);
		if(dateWeek == 0) {
			date.setDate(date.getDate() + 8);
			$("#serviceStartDay").text(date.toISOString().substr(0,10) + "부터");
			$("#serviceEndDay_final").val(date.toISOString().substr(0,10));
		} else if (dateWeek == 1) {
			date.setDate(date.getDate() + 7);
			$("#serviceStartDay").text(date.toISOString().substr(0,10) + "부터");
			$("#serviceEndDay_final").val(date.toISOString().substr(0,10));
		} else if (dateWeek == 2) {
			date.setDate(date.getDate() + 6);
			$("#serviceStartDay").text(date.toISOString().substr(0,10) + "부터");
			$("#serviceEndDay_final").val(date.toISOString().substr(0,10));
		} else if (dateWeek == 3) {
			date.setDate(date.getDate() + 5);
			$("#serviceStartDay").text(date.toISOString().substr(0,10) + "부터");
			$("#serviceEndDay_final").val(date.toISOString().substr(0,10));
		} else if (dateWeek == 4) {
			date.setDate(date.getDate() + 4);
			$("#serviceStartDay").text(date.toISOString().substr(0,10) + "부터");
			$("#serviceEndDay_final").val(date.toISOString().substr(0,10));
		} else if (dateWeek == 5) {
			date.setDate(date.getDate() + 3);
			$("#serviceStartDay").text(date.toISOString().substr(0,10) + "부터");
			$("#serviceEndDay_final").val(date.toISOString().substr(0,10));
		} else if (dateWeek == 6) {
			date.setDate(date.getDate() + 2);
			$("#serviceStartDay").text(date.toISOString().substr(0,10) + "부터");
			$("#serviceEndDay_final").val(date.toISOString().substr(0,10));
		} 
		
		date.setDate(date.getDate() + 15);
		$("#serviceEndDay").text(date.toISOString().substr(0,10)+ "까지 입니다 !!");

})

</script>
<body>
	<div style="text-align: center; margin-top: 50px;">
		<a href="${appRoot }/member/main"> <img
			src="${appRoot }/resources/image/others/brand_logo_300px.png"
			alt="...">
		</a>
			<div style="font-size: 16px">구독결제하기</div>
	</div>
	<div class="wrapper">
	
		<div class="col">
				<div>구독 계약 기간</div>
		<div class="dateBlock">
			<div class="dateStamp">
				<div style="font-size: 32px">오늘 구독하시면</div>
				<div id="userid"><b style="font-size: 25px;color: #AD480E">${pinfo.member.userName}</b>님의 구독기간은</div>
				<div style="font-size: 25px; color:#787878; padding: 1.5% " id="serviceStartDay"></div>
				<div style="font-size: 25px; color:#787878; padding: 1.5% " id="serviceEndDay"></div>
				<input id="serviceEndDay_final" type="text" readonly="readonly" hidden>
			</div>
			<div class="Qlqlr">
			<div><img src="${appRoot }/resources/image/den.jpg" onmouseover="$('.QlqlrShort').show();"
				onmouseout="$('.QlqlrShort').hide();"></div>
					<div class="QlqlrShort" style="display: none">
						<div>*구독 계약기간은 14일입니다</div>
						<div>*15일 째 되는날 해당 금액으로 정기결제가 진행됩니다</div>
						<div>*정기결제를 취소하고싶으시면 <a href="">구독취소게시판</a>에 <br> 양식을 작성해주시기 바랍니다. </div>
						<div>*구독 계약기간은 결제일의 다음주 월요일부터<br>  15일동안 지속됩니다.</div>
						<div>*일요일 결제 시 , 8일후 월요일부터 계약기간이 시작됩니다.</div>
					</div>
				</div>
		</div>
		
			<div class="title" style="text-align: center;">구독 종류 선택</div>
			<div class="box1" id="box1-1">
				<div class="text1">1인 가구</div>
				<div class="text2">설명</div>
				<div class="text3">1000 $</div>
			</div>
			<div class="box1" id="box1-2">
				<div class="text1">2인 가구</div>
				<div class="text2">설명</div>
				<div class="text3">2000 $</div>
			</div>
			<div class="box1" id="box1-3">
				<div class="text1">4인 가구</div>
				<div class="text2">설명</div>
				<div class="text3">3000 $</div>
			</div>
			<input id="finalAmount" value="" type="text" readonly="readonly"
				hidden> <input id="finalSubsOptions" value="" type="text"
				readonly="readonly" hidden>
		</div>

		<div class="col">
			<div class="title" style="text-align: center;">빨래방 선택</div>
			<div class="box2" id="box2-1">
				<div class="box_sub1">
					<img id="fileNameId1" style="max-width: 100%; height: auto;" src="">
				</div>
				<div class="box_sub2" id="box_sub2-1"></div>
				<div class="box_sub3">
					<div id="map1" style="width: 100%; height: 300px;"></div>
				</div>
			</div>
			<div class="box2" id="box2-2">
				<div class="box_sub1">
					<img id="fileNameId2" style="max-width: 100%; height: auto;" src="">
				</div>
				<div class="box_sub2" id="box_sub2-2"></div>
				<div class="box_sub3">
					<div id="map2" style="width: 100%; height: 300px;"></div>
				</div>
			</div>
			<div class="box2" id="box2-3">
				<div class="box_sub1">
					<img id="fileNameId3" style="max-width: 100%; height: auto;" src="">
				</div>
				<div class="box_sub2" id="box_sub2-3"></div>
				<div class="box_sub3">
					<div id="map3" style="width: 100%; height: 300px;"></div>
				</div>
			</div>

			<div>
				<button id="addressList_modal_btn" class="button_sang" type="button"
					data-toggle="modal" data-target="#addressList-modal">
					다른 빨래방 <br>찾아보기
				</button>
			</div>
			<input id="finalAddress" type="text" readonly="readonly" hidden>
			<input id="finalStoreId" type="text" readonly="readonly" hidden>
		</div>
	</div>
	<div class="col">
		<div class="title">
			<input class="button_sang" type="button" id="payPage" value="결제하기">
		</div>
	</div>



	<!-- 원하는 빨래방 검색 모달 -->
	<div class="modal" id="addressList-modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">다른 빨래방 찾아보기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div style="margin-left: 25px; margin-top: 10px;">
					<select id="select1">
						<option value="">--</option>
						<option value="S">가게명검색</option>
						<option value="A">주소검색</option>
					</select> <input class="keyword1" type="text" placeholder="Search">
					<button class="Searchbtn" type="submit">Search</button>
					<button id="selectBTN">선택완료</button>
				</div>
				<div class="modal-body">
					<div id="storeList"></div>
				</div>
			</div>
		</div>
	</div>
<bot:botnav></bot:botnav>


</body>

<script type="text/javascript">

/*  결제 api */
$(function() {
	$("#payPage").click(function() {
		let subsId = "${pinfo.member.userid}";
		let subsName = "${pinfo.member.userName}";
		let subsAddress ="${pinfo.member.userAddress}";
		let storeAddress = $("#finalAddress").val();
		let subsOption = $("#finalSubsOptions").val();
		let subsAmount = $("#finalAmount").val();
		let storeid = $("#finalStoreId").val();
		let serviceStartDate = $("#serviceEndDay_final").val();
		
		var checkMsg;
		checkMsg = "이름 : " + subsName;
		checkMsg = "구독 시작일 :" + serviceStartDate;
		checkMsg += "\n구독자 주소: " + subsAddress;
		checkMsg += "\n선택한 빨래방 주소: " + storeAddress;	
		checkMsg += "\n구독종류 : " + subsOption ;
		checkMsg += "\n결제금액 : " + subsAmount;
		var check = confirm(checkMsg);
		
		if(check) {
		 var IMP = window.IMP; // 생략가능
	        IMP.init('imp01897248'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	        var msg;
	        
	      new IMP.request_pay({
	            pg : 'danal_tpay',
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            buyer_name : subsName,
	            name : subsOption,
	            amount : subsAmount
	          
	            //m_redirect_url : 'http://www.naver.com'
	        }, function(rsp) {
	            if ( rsp.success ) {
	                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	                jQuery.ajax({
	                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	                    type: 'POST',
	                    dataType: 'json',
	                    data: {
	                        imp_uid : rsp.imp_uid
	                        //기타 필요한 데이터가 있으면 추가 전달
	                    }
	                }).done(function(data) {
	                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	                    if ( everythings_fine ) {
	                        msg = '결제가 완료되었습니다.';
	                        msg += '\n고유ID : ' + rsp.imp_uid;
	                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                        msg += '\결제 금액 : ' + rsp.paid_amount;
	                        msg += '카드 승인번호 : ' + rsp.apply_num;
	                        alert(msg);
	                        
	                     
	                        
	                    } else {
	                        //[3] 아직 제대로 결제가 되지 않았습니다.
	                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	                    }
	                });
	                let subsdata = {
	                  		subsId : subsId,
	                  		subsName : subsName,
	                  		subsAddress : subsAddress,
	                  		storeid : storeid,
	                  		subsOptions : subsOption,
	                  		subsAmount : subsAmount,
	                  		serviceStartDate : serviceStartDate
	                  } 
	                  
	                  $.ajax({
	                  	type: "POST",
	                  	url : '${appRoot}/subscribe/saveSubsInfo',
	                  	data: JSON.stringify(subsdata),
	                  	contentType : "application/json",
	                  	success : function() {
	                  		console.log("DB저장 성공");
	                  	}
	                  })
	                //성공시 이동할 페이지
	                location.href='${appRoot}/member/main';
	            } else {
	                msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	                
	                function close() {
	                	window.close();
	                }
	                //실패시 이동할 페이지
	               <%--  location.href="<%=request.getContextPath()%>/order/payFail"; --%>
	                alert(msg);
	            }
	        });
	    
			} else {
				alert("결제 승인 취소")
			}
		})

})
</script>
</html>
