<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>b2b사장님 가게홍보 게시판</title>
<head>

<style>
@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

html {
	font-family: 'GongGothicMedium'
}
.box {
	width: 500px;
	height: 950px;
	display: block;
	text-align: center;
	margin: 0 auto;
}

.box_1 {
	height: 90px;
	padding-top: 20px;
	font-size: 32px;
}

.box_2 {
	height: 10%;
}

.box_3 {
	height: 30%;
}

.box_4 {
	height: 30%;
}

.box_5 {
	margin-top: 100px;
	height: 100px;
	display: inline-block;
}

.hhhHTML {
	font-style: normal;
	font-weight: 1000;
	font-size: 16px;
}

.modal-content {
	width: 600px;
	height: auto;
}

.wrapper-modal {
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
	padding-left: 8px;
    padding-top: 3px;
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
 body {	
   font-family: 'GongGothicMedium';
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
	width:200px;
    font-family: 'GongGothicMedium';
}
.button_sang:hover {
	background: #0583F2;
}

</style>
<!-- 미리보기 -->
<script type="text/javascript">

	$(function() {
		let id = "${pinfo.member.id}";
		$.ajax({
			type : "GET",
			url : "${appRoot}/searchstore/getStoreInfo" ,
			data : { id : id },
			success : function(data) {
				var storeNameVal = data.storeName;
				var test = storeNameVal.includes("빨래방");
				$("#storeName").text(test ? storeNameVal : storeNameVal + "빨래방");
				$("#storeAddress").text("가게주소 :" +data.storeUserAddress);
				$("#storePhoneNum").text("가게번호 :" +data.storePhonenum);
			},
			error : function() {
				console.log("실패");
			}
		})
		
		
		$("#introduceImage").on('change', function() {
			readURL(this);
		})
	})

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preImage').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

</script>
<script type="text/javascript">
	$(function() {
		 $("#preview-modal-btn").click(function() {
			let storeinfo = $("#storeinfo").val();
			let introduce = $("#introduce").val();
			/* 가게소개/가게정보 넣기 */
			$("#storeinfo-modal").text(storeinfo);
			$("#introduce-modal").text(introduce);
		}) 
		
		$("#register").click(function() {
			let id = "${pinfo.member.id}"
			
			var form = new FormData();
			form.append("file", $("#introduceImage")[0].files[0]);
			form.append("id", id);
			form.append("storeinfo", $("#storeinfo").val());
			form.append("introduce", $("#introduce").val());

			$.ajax({
				type : "POST",
				url : "${appRoot}/searchstore/b2bIntroduceBoard",
				data : form,
				enctype : "multipart/form-data",
				processData : false,
				contentType : false,
				cache : false,
				success : function() {
					alert("등록성공 !! " + "이쁘게 홍보해드릴게여^*^");
				},
				error : function() {
					console.log("등록실패");
				}
			})
		})
	})
</script>

</head>
<body style="display: block; width: 100%; margin-top: 20px">
	<div style="text-align: center;">
		<a href="${appRoot }/member/main"> <img
			src="${appRoot }/resources/image/others/brand_logo_300px.png"
			alt="...">
		</a>
	</div>
	<div class="box">
		<div class="box_1">
			사장님 가게 홍보 <img onmouseover="$('.hhhHTML').show();"
				onmouseout="$('.hhhHTML').hide();" alt=""
				src="${appRoot }/resources/image/den.jpg">
		</div>
		<div class="hhhHTML" style="display: none; ">
			본 계시판은 구독시 고객님에게 보여지는 정보를 등록하는 곳입니다.<br>
			* 사진과 내용을 입력 후, 미리보기를 눌러 확인 후 등록해주세요 <br>
			 *사진이 없으면 등록되지 않습니다.<br>
			*사진 기분 규격은 (600 x 450) 을 권장합니다.<br> *허위 및 과장 광고 시 벌금이 부과됩니다.
		</div>
		<div class="box_2">
			<label for="introduceImage">홍보배너이미지</label> <br> <input
				type="file" class="form-control" accept="image/*"
				id="introduceImage">
		</div>
		<div class="box_3">
			<label for="storeinfo">가게 정보</label> <br>
			<textarea id="storeinfo" class="form-control" style="height: 230px;"
				placeholder="운영시간/휴무일/상호명 등"></textarea>
		</div>
		<div class="box_4">
			<label for="introduce">가게 홍보 멘트</label> <br>
			<textarea id="introduce" class="form-control" style="height: 300px"
				placeholder="가게 소개 멘트/수상내역/세탁기스펙/경력 등"></textarea>
		</div>
		<div class="box_5">
			<button id="preview-modal-btn" class="button_sang" type="button"
				data-toggle="modal" data-target="#preview-modal" >미리보기</button>
			<button id="register" class="button_sang">등록</button>
		</div>
	</div>


	<!-- 미리보기 모달 -->
	<div class="modal" id="preview-modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">미리보기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="wrapper-modal">
						<div class="imgPage">
							<img style="max-width: 100%; height: auto;" id="preImage" src="#" />
						</div>
						<!-- <div class="like"></div>  -->
						<div class="storeInfo">
							<div id="storeName" class="storeName" style="font-size: 30px; color: #9E3D00">등록된 가게 이름</div>
							<div id="storeAddress" style="color: #787878; padding-left: 8px; padding-top: 3px;">등록된 가게 주소</div>
							<div id="storePhoneNum" style="color: #787878;padding-left: 8px;padding-top: 3px;">등록된 가게 번호</div>
							<div id="storeinfo-modal"style="padding-left: 8px;padding-top: 3px;"></div>
						</div>
						<div id="introduce-modal" class="introduce"style="padding-left: 8px;padding-top: 3px;"></div>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>