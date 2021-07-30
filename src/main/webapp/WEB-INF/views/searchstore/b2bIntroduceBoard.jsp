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
.box {
	width: 500px;
	height: 800px;
	display: block;
	text-align: center;
	 margin: 0 auto;

}

.box_1 {
	height: 10%;
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
</style>
<!-- 미리보기 -->
<script type="text/javascript">
	$(function() {
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

/* 	$(function() {
		$("#preview-modal-btn").click(function() {
			var comment = $("#introduce").val();
			$("#introduce_comment").val(comment);
			$("#prePage").show();
		})
	}) */
</script>
<script type="text/javascript">
	$(function() {
		$("#register").click(function() {
			var id = "${pinfo.member.id}"
			var form = new FormData();
			form.append("file", $("#introduceImage")[0].files[0]);
			form.append("id", id);
			form.append("storeinfo",$("#storeinfo").val());
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
					<a href="${appRoot }/member/main">
						<img src="${appRoot }/resources/image/others/brand_logo_300px.png" alt="...">
					</a>
				</div>
	<div class="box">
		<div class="box_1">사장님 가게 홍보  <img onclick="" alt="" src="${appRoot }/resources/image/den.jpg"> </div>
		<div class="box_2">
			<label for="introduceImage">홍보배너이미지</label> <br> 
			<input type="file" class="form-control" accept="image/*" id="introduceImage">
		</div>
		<div class="box_3">
			<label for="storeinfo">가게 정보:</label> <br>
			<textarea id="storeinfo" class="form-control" style="height: 230px;"
				placeholder="운영시간/휴무일/상호명 등"></textarea>
		</div>
		<div class="box_4">
			<label for="introduce">가게 홍보 멘트</label> <br>
			<textarea id="introduce" class="form-control" style="height: 300px"
				placeholder="가게 소개 멘트/수상내역/세탁기스펙/경력 등"></textarea>
		</div>
		<div class="box_5">
			<button id="preview-modal-btn" class="button" type="button"
					data-toggle="modal" data-target="#preview-modal">미리보기</button>
			<button id="register">등록</button>
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
						<div>
						 <img id="preImage" src="#"/>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div style="display: none">
		본 계시판은 구독시 고객님에게 보여지는 정보를 등록하는 곳입니다.
		*사진이 없으면 등록되지 않습니다.
		*사진 기분 규격은 (600 x 450) 을 권장합니다.
		*허위 및 과장 광고 시 벌금이 부과됩니다.
		</div>

</body>
</html>