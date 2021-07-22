<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>b2b사장님 가게홍보 게시판</title>
<style type="text/css">
/*  .container {
	float:left;
}
  */
.form-group {
	width:100%;
}
 .preview {
 	float:left;
 	margin: 0 auto;
	
	
} 

</style>
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
	
$(function() {
	$("#preview-btn").click(function() {
		var comment = $("#introduce").val();
		$("#introduce_comment").val(comment);
		$("#prePage").show();
			})
	})
	
</script>

<script type="text/javascript">
$(function() {
	("#register").click(function() {
		
		var b2bid = $("#b2bid").val();
		var introduce = $("#introduce"),val();
		
		data = {
			b2bid = b2bid
			introduce = introduce
		}
		$.ajax({
			type : "post",
			url : "${appRoot}/won/register",
			enctype : "multipart/form-data"
			data: ,
			success: function() {
				
			}
				
			
		})
	})
})

</script>
</head>
<body>
	<div class="container">
			<div style="float:left">
				<div class="form-group ">
					<label for="b2bid">b2bid (*회원정보에서 확인해주세요)</label>
					 <input type="text" class="form-control" id="b2bid" value="${pinfo.id }">
				</div>
				<div class="form-group">
					<label for="introduceImage">홍보배너이미지</label>
					<input type="file" accept="image/*" class="form-control" id="introduceImage">
				</div>
				<div class="form-group">
					<label for="introduce">가게 홍보 멘트</label>
					<textarea class="form-control" id="introduce" style=" height: 400px"></textarea>
				</div>
				<button id="preview-btn">미리보기</button>
				<button id="register">등록</button>
			</div>

			<div id="prePage" style="display: none" class="preview">
					<div>
					<h1>미리보기</h1>
					</div>
					<div style="float:left">
						<img id="preImage" src="#"/>
					</div>
					<div style="float:left">
						<ul>
							
							<li>가게 이름<input type="text" value="#" readonly></li>
							<li>주소<input type="text" value="#" readonly></li>
							<l1>(홍보글)<textarea id="introduce_comment" value="#" readonly></textarea></l1>
							<li>평점:</li>
							<li><a href="https://www.naver.com/">리뷰보기</a></li>
						</ul>
					</div>
			</div>
		</div>

</body>
</html>