$(document).ready(function () {
     


// 좋아요 수 설정하기 (setReviewLikeCount)
// 좋아요 수 얻어오기 (getReviewLikeCount)
    const $reviewLikeUp = $("#review-like-up");
    const reBno = $reviewLikeUp.attr("data-reBno");

    $reviewLikeUp.click(function() {
        $.ajax ({
            type: "post",
            url: appRoot + "/review/get?reBno=" + reBno,
            success: function(cnt) {
                $("#review-total-count").text(cnt);
                $('#staticBackdrop').modal('hide')
            },
            error: function() {
                console.log("error!!!");
            }
        })
    });
});


