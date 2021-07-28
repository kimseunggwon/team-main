// 리뷰 수정하기 (Modify)
// 리뷰 삭제하기 (Remove)
$(document).ready(function() {
    const $reModifyUrl = appRoot + "/review/modify";
    const $reRemoveUrl = appRoot + "/review/remove";

    const $reModifyBtn = $("#review-modify-btn");
    const $reRemoveBtn = $("#review-remove-btn");

    $reModifyBtn.click(function () {  
         //   $("#re-modify-form1").attr("action", $reModifyUrl);
            $("#re-modify-form1").submit();
    })
    $reRemoveBtn.click(function () {
            $("#re-modify-form1").attr("action", $reRemoveUrl);
            $("#re-modify-form1").submit();
    })
})