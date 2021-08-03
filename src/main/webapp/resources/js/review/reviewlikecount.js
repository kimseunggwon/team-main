$(document).ready(function () {

    const $reviewLikeUp = $("#review-like-up");
    const reBno = $reviewLikeUp.attr("data-reBno");
    
    $reviewLikeUp.click(function () {
        $.ajax({
            type: "post",
            url: appRoot + "/review/get",
            data: {
                reBno: reBno,
                userid: userid
            },
            success: function (cnt, status) {
                console.log(status);
                $("#review-total-count").text(cnt);
                $('#staticBackdrop1').modal('hide');
            },
            error: function (xhr, status) {
                console.log(status);
                console.log("error!!!");
                alert("이미 추천하였습니다.");
                $('#staticBackdrop1').modal('hide');
            }
        })
    });

});




