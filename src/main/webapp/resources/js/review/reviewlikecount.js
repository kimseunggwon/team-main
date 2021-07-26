$(document).ready(function () {
// 회원이 '추천해요' 버튼을 눌렀을 때 좋아요 수 설정하기 (setReviewLikeCount)
// 회원들이 누른 '추천해요' 개수 얻어오기 (getReviewLikeCount)
    const $reviewLikeUp = $("#review-like-up");
    const reBno = $reviewLikeUp.attr("data-reBno");

    $reviewLikeUp.click(function() {
        $.ajax ({
            type: "post",
            url: appRoot + "/review/get?reBno=" + reBno,
            success: function(cnt, status) {
                console.log(status);
                $("#review-total-count").text(cnt);
                $('#staticBackdrop1').modal('hide')
            },
            error: function(xhr, status) {
                console.log(status);
                console.log("error!!!");
            }
        })
    });
});




 
