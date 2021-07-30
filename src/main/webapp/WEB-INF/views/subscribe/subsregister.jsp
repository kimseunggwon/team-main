<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



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
.otherStoreList {
	display: block;
	box-shadow: 0px 0px 6px 10px rgb(32 33 36/ 28%);
	border-radius:30px;
	margin:25px;
}

.ListBox {
	display: block;
	padding: 20px;
}
.storeInfoBTN {
	
}
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

.button {
	width: 25%;
	display: inline-block;
	border: 1px solid #bbb;
	height: 90px;
	color: black;
	background: #B4DDF5;
	margin: 2.5%;
	box-shadow: 0px 0px 6px 10px rgb(32 33 36/ 28%);
	border-color: rgba(223, 225, 229, 0);
	text-align: center;
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
	font-size: 120%
}

.box_sub3 {
	display: block;
	height: 300px;
	width: 100%;
}
</style>
<!-- 테스트용 -->
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

<!-- 지도 추천 -->
<script type="text/javascript">
	$(function() {
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
															zoom : 14
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
														content : [ `<div><img src="${appRoot}/resources/image/laundry_home.png"></div>`

														].join('')

													},
													animation : naver.maps.Animation.BOUNCE
												};
												let marker = new naver.maps.Marker(
														laundrymarker);
												
											}
											
												$("#box_sub2-1").append(` 	<div> 가게 이름: \${data[0].storename}</div>
																			<div class="text4_sub">가게 주소: \${data[0].storeaddress}</div>
																			<div>가게 번호: \${data[0].storePhonenum}</div>
																			<div class="storeInfoBTN">가게 정보 : </div>`); 
												$("#box_sub2-2").append(`	<div> 가게 이름: \${data[1].storename}</div>
																			<div class="text4_sub">가게 주소: \${data[1].storeaddress}</div>
																			<div>가게 번호: \${data[1].storePhonenum}</div>
																			<div>가게 정보 : </div>`); 
												$("#box_sub2-3").append(`	<div> 가게 이름: \${data[2].storename}</div>
																			<div class="text4_sub">가게 주소: \${data[1].storeaddress}</div>
																			<div>가게 번호: \${data[2].storePhonenum}</div>
																			<div>가게 정보 : </div>`); 
			
											/* 주소종류 클릭 모션 */
											function clickAddressType(elem2) {
												$(".box2").css("box-shadow", "0px 0px 6px 10px rgb(32 33 36/ 28%)");
												$(elem2).css("box-shadow", "0px 0px 6px 10px #B4DDF5");
												let finalAddress = $(elem2).find(".text4_sub").text().substr(6);

												$("#finalAddress").val(finalAddress);
												
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

											}
										}
										
									})
									
						})
	})
</script>

<body>
	<div class="wrapper">
		<div class="col">
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
		</div>


		<div class="col">
			<div class="box2" id="box2-1">
				<div class="box_sub1">사진</div>
				<div class="box_sub2" id="box_sub2-1"></div>
				<div class="box_sub3">
					<div id="map1" style="width: 100%; height: 300px;"></div>
				</div>
			</div>
			<div class="box2" id="box2-2">
				<div class="box_sub1">사진</div>
				<div class="box_sub2" id="box_sub2-2"></div>
				<div class="box_sub3">
					<div id="map2" style="width: 100%; height: 300px;"></div>
				</div>
			</div>
			<div class="box2" id="box2-3">
				<div class="box_sub1">사진</div>
				<div class="box_sub2" id="box_sub2-3"></div>
				<div class="box_sub3">
					<div id="map3" style="width: 100%; height: 300px;"></div>
				</div>
			</div>

			<div>
				<button id="addressList_modal_btn" class="button" type="button"
					data-toggle="modal" data-target="#addressList-modal">다른
					빨래방 찾아보기</button>
			</div>
			<input id="finalAddress" type="text" readonly="readonly" hidden>
		</div>
	</div>
	<div class="col">
		<div class="title">
			<input type="button" id="payPage" value="결제하기">
		</div>
	</div>


<!-- 모달 열기 -->
	<script type="text/javascript">
$(function() {
	$("#addressList_modal_btn").click(function() {
		$.ajax({
			type : "GET",
			url : "${appRoot}/subscribe/getStoreList",
			success : function(list) {
				let StoreListContainer = $("#storeList").empty();
				
				for (StoreAddress of list) {
					let storeListHTML = `<div class="otherStoreList">
										<div class="ListBox">
											<div id="\${StoreAddress.id}"></div>
											<div> 가게이름 :\${StoreAddress.storename}</div>
											<div class="modal_store_name"> 가게주소 : \${StoreAddress.storeaddress}</div>  
											<div><a href="">가게 정보보기</a></div>
										</div>
										</div>`
					
						StoreListContainer.append(storeListHTML);

 					if (StoreAddress.auth == "ROLE_B2BUSER"){
						$("#"+`\${StoreAddress.id}`).text("♥개인");

					} else if (StoreAddress.auth == "ROLE_EMPUSER"){
						$("#"+`\${StoreAddress.id}`).text("★본사");
					} 
				}
				
			
				/* 선택시 기능 */
				function clickModalAddress(elem3) {
					let modal_finalAddress = $(elem3).find(".modal_store_name").text().substr(7);
					$(".otherStoreList").css("box-shadow", "0px 0px 6px 10px rgb(32 33 36/ 28%)");
					$(elem3).css("box-shadow", "0px 0px 6px 10px #B4DDF5");
					$("#finalAddress").val(modal_finalAddress);		
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
	
})

</script>

<!-- 검색창 -->
<script type="text/javascript">
$(function() {
	$(".Searchbtn").click(function() {
		let type = $("#select1 option:selected").val();
		let keyword = $(".keyword1").val();
		
		console.log(type);
		console.log(keyword);
	
	let data = {
			type : type,
			keyword : keyword
	}
	
	$.ajax({
			type : "POST",
			data : data,
			url : "${appRoot}/subscribe/getStoreListBySearch",
			success : function(list1) {
				console.log(list1);
				
				let StoreListContainer1 = $("#storeList").empty();
						
						for (StoreAddress of list1) {
							let storeListHTML1 = `<div class="otherStoreList">
								<div class="ListBox">
									<div id="\${StoreAddress.id}"></div>
									<div> 가게이름 :\${StoreAddress.storename}</div>
									<div class="modal_store_name"> 가게주소 : \${StoreAddress.storeaddress}</div>  
									<div><a href="">가게 정보보기</a></div>
								</div>
								</div>`;
								
							StoreListContainer1.append(storeListHTML1);
							
							if (StoreAddress.auth == "ROLE_B2BUSER"){
								$("#"+`\${StoreAddress.id}`).text("♥개인");

							} else if (StoreAddress.auth == "ROLE_EMPUSER"){
								$("#"+`\${StoreAddress.id}`).text("★본사");
							}
						}
						
						function SeachClickModalAddress(elem4) {
							let modal_finalAddress = $(elem4).find(".modal_store_name").text().substr(7);
							$(".otherStoreList").css("box-shadow", "0px 0px 6px 10px rgb(32 33 36/ 28%)");
							$(elem4).css("box-shadow", "0px 0px 6px 10px #B4DDF5");
							$("#finalAddress").val(modal_finalAddress);
							
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
					</select>
					<input class="keyword1" type="text" placeholder="Search">
					<button class="Searchbtn" type="submit">Search</button>
					<button id="selectBTN">선택완료</button>
				</div>
				<div class="modal-body">
					<div id="storeList"></div>
				</div>
			</div>
		</div>
	</div>



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

		var checkMsg;
		checkMsg = "이름 : " + subsName;
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
	                  		storeAddress : storeAddress,
	                  		subsOptions : subsOption,
	                  		subsAmount : subsAmount
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
