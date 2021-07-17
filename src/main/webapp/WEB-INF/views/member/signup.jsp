<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>

<script type="text/javascript">
$(function() {
	
	
	// 아이디 중복 확인
	$("#id-dup-btn").click(function() {
		var idVal = $("#sang-id").val();
		var messageElem = $("#id-message");
		canUseId = false;
		toggleEnableSubmit();
		
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
						canUseId = true;
						var ans = confirm("사용 가능한 아이디 입니다. 사용하시겠습니까?");
						
							if(ans){
								$("#id-message").removeClass("text-danger");
								$("#id-message").addClass("text-success");
								messageElem.text("사용가능한 아이디 입니다.");											
								$("#signup-input1").attr("readonly", "readonly");
							}
							
					} else if (data == "exist") {
						console.log("사용 불가능한 아이디");
						$("#id-message").removeClass("text-success");
						$("#id-message").addClass("text-danger");
						messageElem.text("이미 있는 아이디 입니다.");
					}
					
					toggleEnableSubmit();
				}, 
				error: function() {
					console.log("아이디 중복 체크 실패");
				}
				
			});
		}
	})
	
	
	
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
	
	$("#sang-authnum").click(function() {
		var idE = $("#sang-email").val();
		/* var idP = $("#sang-pnum").val(); */
		
		$.post(authurl, {idE: idE/* ,idP: idP */}, function(data) {
			if (data == 'ok1') {
				$("#sang-inz-input, #sang-inz-btn").removeAttr("hidden");
			} else {
			
			}
		});
	});
	
	$("#sang-authnum").click(function(){
		
		$("#sang-inz-btn").click(function(){
			var idI = $("#sang-inz-input").val();
			$.post(authurl, {idI: idI}, function(data) {
				if (data == 'ok2') {
					$("#signup").removeAttr("hidden");
				} else {
				
				}
			});
		});
	});
	
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
	
});
</script>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5&submodules=geocoder"></script>
<script type="text/javascript">
$(function() {
      $("#signup").click(function(e) {
		e.preventDefault();
         var postcode = $("#sample6_postcode").val();
         var address = $("#sample6_address").val();
         var detailAddress = $("#sample6_detailAddress").val();
         var extraAddress = $("#sample6_extraAddress").val();
         var fullAddress = postcode.concat(address,detailAddress,detailAddress);
         
         var storepostcode = $("#store-postcode").val();
         var storeaddress = $("#store-address").val();
         var storedetailAddress = $("#store-detailAddress").val();
         var storeextraAddress = $("#store-extraAddress").val();
         var storefullAddress = storepostcode.concat(storeaddress,storedetailAddress,storedetailAddress);
             
         
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
                 
                }
        	$("#sang-signup-form").submit();
         	});
         }else{
        	 
        
         
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
              
             }
            /* var data = {
               address : address,
               fullAddress : fullAddress,
               lat : lat,
               lag : lag
               
            }
            $.ajax({
               type : "post",
               url : "${appRoot}/member/signup",
               data : JSON.stringify(data),
               contentType : "application/json",
               success : function() {
                  console.log("성공");
               },
               error : function() {
                  console.log("실패");
               }
            }) */
            
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
             
            $("#sang-signup-form").submit();
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
<div class="container">
	<div class="row">
		<div class="col-12">
			<div class="conainer mt-5">
				<h1>회원 가입</h1>
				
				<a style="text-decoration: none;" href="">
					<img id="sang-normal-img" alt="눌러줭" src="${appRoot }/resources/image/회원가입2.png">
				</a>
				<a style="text-decoration: none;" href="">
					<img id="sang-b2b-img" alt="눌러줭" src="${appRoot }/resources/image/사업자1.png">
				</a>
				
			</div>
			<form id="sang-signup-form" action="${appRoot }/member/signup" method="post">
				<div class="row">
					<div class="col-8">
						<label for="sang-id">id</label> <!-- 이 아래줄 부터 맘에 안들면 삭제 ㄱㄱ -->
						<input id="sang-id" name="userid" type="text">
							<span id="span1"></span>
						
					</div>
					<div class="col-4">
						<button class="" type="button" id="id-dup-btn">아이디 중복 체크</button>
						<small id="id-message" class="form-text"></small>
					</div>
					
					
					<!-- <button class="btn btn-primary" id="button1" type="button">중복 확인</button>
					<span id="span1"></span> -->
				
				</div>
	
				<div>
					<label for="sang-pw">pw</label>
					<input type="password" name="userpw" id="sang-pw">
				</div>
				<div>
					<label for="sang-pw-conform">pw conform</label>
					<input type="password" name="password" id="sang-pw-conform">
					<small id="password-message" class="form-text text-danger"></small>
				</div>
				<div>
					<label for="sang-name">name</label>
					<input type="text" name="userName" id="sang-name" class="">
				</div>
				<div>
					<label for="sang-name">address</label>
					
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_postcode" placeholder="우편번호"> 
					<input name="address" value="" type="text" id="sample6_address" placeholder="주소"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" n placeholder="참고항목">
				
					<input hidden type="text" name="userAddress" id="sang-userAddress" >
					<input hidden type="text" name="lat" id="sang-lat" >
					<input hidden type="text" name="lag" id="sang-lag">
				</div>
				<div class="">
					<label for="sang-pnum">nickname</label>
					<input type="text" name="userNickname" id="sang-nickname" class="">
				</div>
				<div class="">
					<label for="sang-birth">birth day</label>
					<input type="date" name="birthDate" id="sang-birth" class="">
				</div>
				<div class="">
					<label for="sang-email">E-mail</label>
					<input type="text" name="userEmail" id="sang-email" class="">
					<button class="" id="sang-authnum" type="button">인증번호 전송</button>
				</div>
				<div class="">
					<label for="sang-pnum">P-number</label>
					<input type="text" name="userPhonenum" id="sang-pnum" class="">
				</div>
				
				<div class="">
					<select id="" name="userSex" class="">
						<option selected="selected" value="1">남자</option>
						<option value="2">여자</option>
					</select>
				</div>
				
				
				<hr>
				
				<div class="b2bsignup" hidden>
					<label for="sang-pnum">store name</label>
					<input type="text" name="storeName" id="sang-storename" class="">
				</div>
				<div class="b2bsignup" hidden>
					<label for="sang-storeaddress">store address</label>
					
					<input type="button" onclick="sample7_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="store-postcode" placeholder="우편번호"> 
					<input name="storeAddress" value="" type="text" id="store-address" placeholder="주소"><br>
					<input type="text" id="store-detailAddress" placeholder="상세주소">
					<input type="text" id="store-extraAddress" n placeholder="참고항목">
				
					<input hidden type="text" name="storeUserAddress" id="sang-storeAddress" >
					<input hidden type="text" name="storelat" id="sang-storelat" >
					<input hidden type="text" name="storelag" id="sang-storelag">
					
				</div>
				<div class="b2bsignup" hidden>
					<label for="sang-pnum">store phonenumber</label>
					<input type="text" name="storePhonenum" id="sang-storepnum" class="">
				</div>
				<div class="b2bsignup" hidden>
					<label for="sang-pnum">business number</label>
					<input type="text" name="businessNum" id="sang-businessnum" class="">
				</div>
				
				
		
	
			
			<input class="col-3" hidden name="inz" id="sang-inz-input"/>
			<button hidden class="" id="sang-inz-btn" type="button">인증</button>
	
	<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
			<div class="container mt-5">
				<input id="signup" type="submit" value="가입" class="" >
			</div>
			
			</form>
		</div>
	</div>
</div>
</body>
</html>