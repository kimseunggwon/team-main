<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	 uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="rev" tagdir="/WEB-INF/tags/member"%>
<%@ taglib prefix="bot" tagdir="/WEB-INF/tags/botnav"%>

<!DOCTYPE html>
<html>
<head>

<link href="${appRoot }/resources/favicon/brand_logo.png" rel="shortcut icon" type="image/x-icon">

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>회원가입</title>


<style type="text/css">
	@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	h5 {
	font-family: GongGothicMedium;
	font-size: 15px;
	}
	.ps_box {
    display: inline-block;
    position: relative;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 110px 10px 14px;
    background: #fff;
    box-sizing: border-box;
    vertical-align: top;
	}
	.ps_box2 {
    display: inline-block;
    position: relative;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 10px 10px 14px;
    background: #fff;
    box-sizing: border-box;
    vertical-align: top;
	}
	.add_a, .add_b, .add_c, .add_d {
    display: inline-block;
    table-layout: fixed;
    width: 220px;
    vertical-align: middle;
    *display: block;
    *float: left;
	}
	.sel {
    width: 100%;
    height: 29px;
    padding: 7px 8px 6px 7px\9;
    font-size: 15px;
    line-height: 18px;
    color: #000;
    border: none;
    border-radius: 0;
    *height: auto;
    -webkit-appearance: none;
	}
	:root .sel {
    background: #fff url(https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif) 100% 50% no-repeat;
    background-size: 20px 8px;
	}
	.addressbtn {
	font-size: 12px;
	border: solid 1px #dadada;
	background-color:white; 
	-webkit-border-radius: 40px;
	-moz-border-radius: 40px;
	border-radius: 40px;
	}
	.emailbtn {
	border: solid 1px #dadada;
	background-color:white; 
	-webkit-border-radius: 40px;
	-moz-border-radius: 40px;
	border-radius: 40px;
	}
	.signbutton {
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
	width:420px;
	font-family: GongGothicMedium;
	}
	.signbutton:hover {
		background: #0583F2;
	}
	body{
	font-family: GongGothicMedium;
	}
</style>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5&submodules=geocoder"></script>
<script type="text/javascript">

var passwordfin = false;

// 아이디 중복 확인 focusout
$(function() {
	/* .on("propertychange change keyup paste input",function(){ */
	$("#sang-id").focusout(function(){
		var idVal = $("#sang-id").val();
		var messageElem = $("#id-message");
		if (idVal == "") {
			// 아이디가 입력되지 않았을 때
			$("#id-message").removeClass("text-success");
			$("#id-message").addClass("text-danger");
			messageElem.text("아이디를 입력해주세요.");
			
		} else {
			// 아이디가 입력되어있을 때
			var data = {id : idVal};
			$.ajax({
				type: "get",
				url: "${appRoot}/member/dup",
				data: data,
				success: function (data) {
					if (data == "success") {
						console.log("사용 가능한 아이디");
						
						messageElem.text("사용 가능한 아이디입니다.");
						$("#id-message").removeClass("text-danger");
						$("#id-message").addClass("text-success");
							
					} else if (data == "exist") {
						console.log("사용 불가능한 아이디");
						$("#id-message").removeClass("text-success");
						$("#id-message").addClass("text-danger");
						messageElem.text("이미 있는 아이디 입니다.");
					}
					
				}, 
				error: function() {
					console.log("아이디 중복 체크 실패");
				}
				
			});
		}
	});
	
	// 패스워드 확인 일치 유무
	$("#sang-pw-conform, #sang-pw").keyup(function() {
		var pw1 = $("#sang-pw").val();
		var pw2 = $("#sang-pw-conform").val();
		var submitBtn = $("#signup-btn1");
		passwordConfirm = false;
		
		if (pw1 != pw2) {
			passwordConfirm = false;
			$("#password-message").removeClass("text-success");
			$("#password-message").addClass("text-danger");
			$("#password-message").text("패스워드가 일치하지 않습니다.");	
		} else {
			
			if(pw1 == ""){
				passwordConfirm = false;
				$("#password-message").text("패스워드를 입력해 주세요.");
			}else{
				passwordConfirm = true;
				$("#password-message").removeClass("text-danger");
				$("#password-message").addClass("text-success");
				$("#password-message").text("패스워드가 일치합니다.");
				passwordfin = true;
			}
		}
	});
	
	/* $("#sang-authnum").click(function() {
		var idE = $("#sang-email").val();
		var idI = $("#sang-inz-input").val();
		
		$.ajax({
			type: "post",
			url: "${appRoot}/member/authNumber",
			data: JSON.stringify(idE, idI),
			contentType: "application/json",
			success: function() {
				console.log("성공");
				$("#sang-inz-btn, #sang-inz-input").removeAttr("hidden");
			},
			error: function() {
				console.log("실패");
			}
		});
		
		alert("전송 완료.");
	}); */
	
	var authurl = "${appRoot}"+"/member/authNumber";
	
	// 이메일의 정규식
	$("#sang-authnum").click(function() {
		var idE = $("#sang-email").val();
		/* var idP = $("#sang-pnum").val(); */
		
		$re=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;	
		if(!$re.test(idE)){
			alert("정확한 형식의 Email을 입력해 주세요");
			$("#sang-email").focus();
			return false;
		}
		
		$.post(authurl, {idE: idE/* ,idP: idP */}, function(data) {
			if (data == 'ok1') {
				$("#sang-inz-div").removeAttr("hidden");
			} else {
			
			}
		});
	});
	
	// 인증번호 확인
	$("#sang-inz-btn").click(function(){
		var idI = $("#sang-inz-input").val();
		$.post(authurl, {idI: idI}, function(data) {
			if (data == 'ok2') {
				console.log("인증번호 맞습니다!");
				alert("인증되었습니다!");
				$("#signup").removeAttr("hidden");
			} else {
				console.log("인증번호 틀립니다 ㅠ");
				alert("틀린 인증번호 입니다.");
				$("#sang-inz-input").focus();
			}
		});
	});
	
	// 어떤 이미지를 선택하느냐에 따른 이미지 변화
	$("#sang-normal-img").click(function(e){
		e.preventDefault();
		
		var path = '${appRoot }/member/signup';
		$("#sang-signup-form").attr("action", path);
		
		$(".b2bsignup").attr("hidden", "hidden");
		
		$("#sang-normal-img").attr("src", "${appRoot}/resources/image/회원가입2.png");
		$("#sang-b2b-img").attr("src", "${appRoot}/resources/image/사업자1.png");
	})
	
	$("#sang-b2b-img").click(function(e){
		e.preventDefault();
		
		var path = '${appRoot}/member/b2bsignup';
		$("#sang-signup-form").attr("action", path);
		
		$(".b2bsignup").removeAttr("hidden");
		
		$("#sang-normal-img").attr("src", "${appRoot}/resources/image/회원가입1.png");
		$("#sang-b2b-img").attr("src", "${appRoot}/resources/image/사업자2.png");
	})
	
	// 사업자 번호가 1111일 때 경로 변경
	$("#sang-businessnum").keyup(function(){
		var businessnum = $("#sang-businessnum").val();
		var companynum = "1111";
		if(businessnum == companynum){
			var path = '${appRoot}/member/empsignup';
			$("#sang-signup-form").attr("action", path);
		}else{
			var path = '${appRoot}/member/b2bsignup';
			$("#sang-signup-form").attr("action", path);
		}
	})
	
    // 전화번호에 숫자만 사용
    $("#sang-pnum, #sang-storepnum").keyup(function(){
		var userp = $("#sang-pnum").val();
		var b2bp = $("#sang-storepnum").val();
    	
		$re1=/^[0-9]*$/;		
		if(!$re1.test(userp)){
			alert("숫자만 사용해주세요.");
			$("#sang-pnum").val("");
		}else if(!$re1.test(b2bp)){
			alert("숫자만 사용해주세요.");
			$("#sang-storepnum").val("");
		}else{
			
		}
		
		/* 
		if(userp.indexOf('-') != -1) {

			alert("숫자만 사용해주세요.");
			$("#sang-pnum").val("");
		
		}

		else if(b2bp.indexOf('-') != -1) {
			
			alert("숫자만 사용해주세요.");
			$("#sang-storepnum").val("");

		} 
		*/
   	
    });

	
});
$(function() {
    $("#signup").click(function(e) {
    	e.preventDefault();
    
    	<%-- 회원가입 양식, 정규식 --%>
		if($("#sang-id").val().trim() == ""){
			console.log("#sang-id");
			alert("아이디는 필수 입력 사항입니다.");
			$("#sang-id").focus();
			return false;
		}
		
		if($("#sang-pw").val().trim() == "") {
			alert("비밀번호는 필수 입력 사항입니다.");
			$("#sang-pw").focus();
			return false;
		}
		if($("#sang-name").val().trim() == "") { 
			alert("이름은 필수 입력 사항입니다.");
			$("#sang-name").focus();
			return false;
		}
		if($("#sample6_detailAddress").val().trim() == ""){
			alert("상세주소는 필수 입력 사항입니다.");
			$("#sample6_detailAddress").focus();
			return false;
		}
		if($("#sang-nickname").val().trim() == ""){
			alert("별명은 필수 입력 사항입니다.");
			$("#sang-nickname").focus();
			return false;
		}
		if($("#sang-birth").val() == ""){
			alert("생일은 필수 입력 사항입니다.");
			$("#sang-birth").focus();
			return false;
		}
		if($("#sang-email").val().trim() == ""){
			alert("Email은 필수 입력 사항입니다.");
			$("#sang-email").focus();
			return false;
		}
		if($("#sang-pnum").val().trim() == ""){
			alert("전화번호는 필수 입력 사항입니다.");
			$("#sang-pnum").focus();
			return false;
		}
		if($("#userSex").val() == '0'){
			alert("성별을 선택해 주세요.");
			$("#userSex").focus();
			return false;
		}
		if(passwordfin == true){
			
		}else{
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return false;
		}
    
       var postcode = $("#sample6_postcode").val();
       var address = $("#sample6_address").val();
       var detailAddress = $("#sample6_detailAddress").val();
       var extraAddress = $("#sample6_extraAddress").val();
       var fullAddress = postcode.concat(address,detailAddress,extraAddress);
       
       var storepostcode = $("#store-postcode").val();
       var storeaddress = $("#store-address").val();
       var storedetailAddress = $("#store-detailAddress").val();
       var storeextraAddress = $("#store-extraAddress").val();
       var storefullAddress = storepostcode.concat(storeaddress,storedetailAddress,storeextraAddress);
           
       
       var a = $("#sang-signup-form").attr("action");
       var b = "${appRoot}/member/signup";
       if(a == b){
          naver.maps.Service.geocode({
               query: address // String 타입의 주소값
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
               
               $("#sample6_address").val(address);
               $("#sang-userAddress").val(fullAddress);
               $("#sang-lat").val(lat);
               $("#sang-lag").val(lag);
               
         $("#sang-signup-form").submit();
              });
      
       }else{
    	    let normalAddressProcessDone = false;
    	    let storeAddressProcessDone = false;
    	    
    	    let signUpFormsubmit = function () {
				if (normalAddressProcessDone && storeAddressProcessDone) {
					$("#sang-signup-form").submit();
				}
    	    }
    	    
    		if($("#sang-storename").val().trim() == ""){
    			alert("가게 이름은 필수 입력사항입니다.");
    			$("#sang-storename").focus();
    			return false;
    		}
    		if($("#store-detailAddress").val().trim() == ""){
    			alert("가게 상세주소는 필수 입력사항입니다.");
    			$("#store-detailAddress").focus();
    			return false;
    		}
    		if($("#sang-storepnum").val().trim() == ""){
    			alert("가게 전화번호는 필수 입력사항입니다.");
    			$("#sang-storepnum").focus();
    			return false;
    		}
    		if($("#sang-businessnum").val().trim() == ""){
    			alert("사업자 번호는 필수 입력 사항입니다.");
    			$("#sang-businessnum").focus();
    			return false;
    		}
         
		// 네이버 주소 검색
       naver.maps.Service.geocode({
            query: address // String 타입의 주소값
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
            
            $("#sample6_address").val(address);
            $("#sang-userAddress").val(fullAddress);
            $("#sang-lat").val(lat);
            $("#sang-lag").val(lag);
            
            normalAddressProcessDone = true;
            signUpFormsubmit();
            
        });
       
       naver.maps.Service.geocode({
           query: storeaddress // String 타입의 주소값
       }, function(status, response) {
           if (status !== naver.maps.Service.Status.OK) {
               // 실행이 되지 않을 경우 
                 return alert('Something wrong!');
                 
           }
           var result = response.v2,
           items1 = result.addresses;

           var storelat = parseFloat(items1[0].x);
           var storelag = parseFloat(items1[0].y);
           
           console.log(storelat);
           console.log(storelag);
           
           $("#store-address").val(storeaddress);
           $("#sang-storeAddress").val(storefullAddress);
           $("#sang-storelat").val(storelat);
           $("#sang-storelag").val(storelag);
           
   	       storeAddressProcessDone = true;
   	       signUpFormsubmit();
          /*$("#sang-signup-form").submit();*/
          });
         
    }
    
    });
 });
</script>


<!-- 다음 주소검색 api -->
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   function sample6_execDaumPostcode() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수

                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
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
                     document.getElementById("sample6_extraAddress").value = extraAddr;

                  } else {
                     document.getElementById("sample6_extraAddress").value = '';
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('sample6_postcode').value = data.zonecode;
                  document.getElementById("sample6_address").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("sample6_detailAddress")
                        .focus();
               }
            }).open();
   }
   function sample7_execDaumPostcode() {
	      new daum.Postcode(
	              {
	                 oncomplete : function(data) {
	                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                    var addr = ''; // 주소 변수
	                    var extraAddr = ''; // 참고항목 변수

	                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
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
	                       document.getElementById("store-extraAddress").value = extraAddr;

	                    } else {
	                       document.getElementById("store-extraAddress").value = '';
	                    }

	                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                    document.getElementById('store-postcode').value = data.zonecode;
	                    document.getElementById("store-address").value = addr;
	                    // 커서를 상세주소 필드로 이동한다.
	                    document.getElementById("store-detailAddress")
	                          .focus();
	                 }
	              }).open();
	     }
   
</script>



</head>
<body>
<rev:navbar></rev:navbar>
<div class="container">
	<div style="text-align: center;" class="row">
		<div class="col-12 ">
			<div style="margin-top: 150px" class="conainer">
			
				<div class="row justify-content-center mt-5">
					<a style="text-decoration: none;" href="${appRoot }/member/main">
						<img id="" alt="" src="${appRoot }/resources/image/others/brand_logo_400px.png">
					</a>
				</div>
				<div class="row mt-5">
				</div>
				
				<a style="text-decoration: none;" href="">
					<img id="sang-normal-img" alt="눌러줭" src="${appRoot }/resources/image/회원가입2.png">
				</a>
				<a style="text-decoration: none;" href="">
					<img id="sang-b2b-img" alt="눌러줭" src="${appRoot }/resources/image/사업자1.png">
				</a>
				
			</div>
			<form id="sang-signup-form" action="${appRoot }/member/signup" method="post" class="was-validated">
			
			<div style="margin-top: 50px">
			
			</div>
				
				<div style="margin: 0 auto;" class="col-5">
				<div style="text-align: left;">
					<h5>
						아이디
					</h5>
				</div>
				</div>
				<div class="ps_box col-5">
					<input style="border:none; outline: none; width: 330px;" type="text" id="sang-id" name="userid" class="" title="ID" maxlength="30">
                </div>
				<small style="white-space: pre-wrap;" id="id-message" class="form-text"> </small>
				
				<div style="margin: 0 auto;" class="col-5">
				<div style="text-align: left;">
					<h5>
						비밀번호
					</h5>
				</div>
				</div>
				<div class="ps_box col-5">
					<input style="border:none; outline: none; width: 330px;" type="password" id="sang-pw" name="userpw" class="" title="PW" maxlength="30">
                </div>
                <div style="margin-top: 25px"></div>
				
				<div style="margin: 0 auto;" class="col-5">
				<div style="text-align: left;">
					<h5>
						비밀번호 확인
					</h5>
				</div>
				</div>
				<div class="ps_box col-5">
					<input style="border:none; outline: none; width: 330px;" type="password" id="sang-pw-conform" name="password" class="" title="PW" maxlength="30">
                </div>
				<small style="white-space: pre-wrap;" id="password-message" class="form-text text-danger"> </small>
				
				<div style="margin: 0 auto;" class="col-5">
				<div style="text-align: left;">
					<h5>
						이름
					</h5>
				</div>
				</div>
				<div class="ps_box col-5">
					<input style="border:none; outline: none; width: 330px;" type="text" id="sang-name" name="userName" class="" title="NAME" maxlength="30">
                </div>
                <div style="margin-top: 25px"></div>
				
				<div style="margin: 0 auto;" class="col-5">
				<div style="text-align: left;">
					<h5>
						집 주소
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="addressbtn"><br>
					</h5>
				</div>
				</div>
				<div class="row justify-content-center">
				<div class="col-5">
					<div class="add_a">
					<div class="ps_box">
						<input style="border:none; outline: none; width: 200px;" placeholder="우편번호" type="text" id="sample6_postcode" class="" title="NAME" maxlength="30">
					</div>
					</div>
					<div class="add_b">
					<div class="ps_box">
						<input style="border:none; outline: none; width: 200px;" placeholder="주소" type="text" id="sample6_address" name="address" class="" title="NAME" maxlength="30">
					</div>
	                </div>
				</div>
				</div>
				<div class="row justify-content-center">
				<div class="col-5">
					<div class="add_a">
					<div class="ps_box">
						<input style="border:none; outline: none; width: 200px;" placeholder="상세주소" type="text" id="sample6_detailAddress" class="" title="NAME" maxlength="30">
					</div>
					</div>
					<div class="add_b">
					<div class="ps_box">
						<input style="border:none; outline: none; width: 200px;" placeholder="참고항목" type="text" id="sample6_extraAddress" class="" title="NAME" maxlength="30">
					</div>
	                </div>
				</div>
				</div>
				<input hidden type="text" name="userAddress" id="sang-userAddress" >
				<input hidden type="text" name="lat" id="sang-lat" >
				<input hidden type="text" name="lag" id="sang-lag">
				<div style="margin-top: 25px"></div>
				
				<div style="margin: 0 auto;" class="col-5">
				<div style="text-align: left;">
					<h5>
						별명
					</h5>
				</div>
				</div>
				<div class="ps_box col-5">
					<input style="border:none; outline: none; width: 330px;" type="text" id="sang-nickname" name="userNickname" class="" title="NICKNAME" maxlength="30">
                </div>
                <div style="margin-top: 25px"></div>
				
				<div style="margin: 0 auto;" class="col-5">
				<div style="text-align: left;">
					<h5>
						생일
					</h5>
				</div>
				</div>
				<div class="ps_box2 col-5">
					<input style="border:none; outline: none; width: 330px;" type="date" id="sang-birth" name="birthDate" class="" title="Birth" maxlength="30">
                </div>
                <div style="margin-top: 25px"></div>
				
				<div style="margin: 0 auto;" class="col-5">
				<div style="text-align: left;">
					<h5>
						E-mail
					</h5>
				</div>
				</div>
				<div class="ps_box2 col-5">
					<input style="border:none; outline: none; width: 230px;" type="text" id="sang-email" name="userEmail" class="" title="Email" maxlength="30">
					<button style="display: inline;" class="emailbtn" id="sang-authnum" type="button">인증번호 전송</button>
                </div>
                <div style="margin-top: 25px"></div>
                
                <div hidden class="ps_box2 col-5" id="sang-inz-div">
	                <input style="border:none; outline: none; width: 230px;" type="text" class="" name="inz" id="sang-inz-input" maxlength="30"/>
					<button class="emailbtn" id="sang-inz-btn" type="button">인증</button>
                </div>
                <div style="margin-top: 25px"></div>
				
				<div style="margin: 0 auto;" class="col-5">
				<div style="text-align: left;">
					<h5>
						핸드폰 번호
					</h5>
				</div>
				</div>
				<div class="ps_box col-5">
					<input style="border:none; outline: none; width: 330px;" type="text" id="sang-pnum" name="userPhonenum" class="" title="Email" maxlength="30">
                </div>
                <div style="margin-top: 25px"></div>
				
				<div style="margin: 0 auto;" class="col-5">
				<div style="text-align: left;">
					<h5>
						성별
					</h5>
				</div>
				</div>
				<div class="ps_box2 col-5">
					<select id="userSex" name="userSex" class="sel">
						<option selected="selected" value="0">성별</option>
						<option value="1">남자</option>
						<option value="2">여자</option>
						<option value="3">선택 안함</option>
					</select>
                </div>
                <div style="margin-top: 25px"></div>
				
				<hr>
				
				<div hidden style="margin: 0 auto;" class="col-5 b2bsignup">
				<div style="text-align: left;">
					<h5>
						가게 이름
					</h5>
				</div>
				</div>
				<div hidden class="ps_box col-5 b2bsignup">
					<input style="border:none; outline: none; width: 330px;" type="text" id="sang-storename" name="storeName" class="" title="STORENAME" maxlength="30">
                </div>
                <div style="margin-top: 25px"></div>

				<div hidden style="margin: 0 auto;" class="col-5 b2bsignup">
				<div style="text-align: left;">
					<h5>
						가게 주소
						<input type="button" onclick="sample7_execDaumPostcode()" value="우편번호 찾기" class="addressbtn"><br>
					</h5>
				</div>
				</div>
				<div hidden class="row justify-content-center b2bsignup">
				<div class="col-5">
					<div class="add_a">
					<div class="ps_box">
						<input style="border:none; outline: none; width: 200px;" placeholder="우편번호" type="text" id="store-postcode" class="" title="SPOST" maxlength="30">
					</div>
					</div>
					<div class="add_b">
					<div class="ps_box">
						<input style="border:none; outline: none; width: 200px;" placeholder="주소" type="text" id="store-address" name="storeAddress" class="" title="SADDRESS" maxlength="30">
					</div>
	                </div>
				</div>
				</div>
				<div hidden class="row justify-content-center b2bsignup">
				<div class="col-5">
					<div class="add_a">
					<div class="ps_box">
						<input style="border:none; outline: none; width: 200px;" placeholder="상세주소" type="text" id="store-detailAddress" class="" title="SDADDRESS" maxlength="30">
					</div>
					</div>
					<div class="add_b">
					<div class="ps_box">
						<input style="border:none; outline: none; width: 200px;" placeholder="참고항목" type="text" id="store-extraAddress" class="" title="SUNIC" maxlength="30">
					</div>
	                </div>
				</div>
				</div>
				<input hidden type="text" name="storeUserAddress" id="sang-storeAddress" >
				<input hidden type="text" name="storelat" id="sang-storelat" >
				<input hidden type="text" name="storelag" id="sang-storelag">
				<div style="margin-top: 25px"></div>
				
				<div hidden style="margin: 0 auto;" class="col-5 b2bsignup">
				<div style="text-align: left;">
					<h5>
						가게 전화번호
					</h5>
				</div>
				</div>
				<div hidden class="ps_box col-5 b2bsignup">
					<input style="border:none; outline: none; width: 330px;" type="text" id="sang-storepnum" name="storePhonenum" class="" title="STORENUM" maxlength="30">
                </div>
                <div style="margin-top: 25px"></div>
				
				<div hidden style="margin: 0 auto;" class="col-5 b2bsignup">
				<div style="text-align: left;">
					<h5>
						사업자 번호
					</h5>
				</div>
				</div>
				<div hidden class="ps_box col-5 b2bsignup">
					<input style="border:none; outline: none; width: 330px;" type="text" id="sang-businessnum" name="businessNum" class="" title="STOREBUSINUM" maxlength="30">
                </div>
                <div style="margin-top: 25px"></div>
				
				
		
	
			
			
	
	<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
			<input hidden id="signup" type="submit" value="가입" class="signbutton" >
			
			</form>
		</div>
	</div>
	<bot:botnav></bot:botnav>
</div>
</body>
</html>