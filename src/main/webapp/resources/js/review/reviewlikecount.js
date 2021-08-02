$(document).ready(function () {
// 회원이 '추천해요' 버튼을 눌렀을 때 좋아요 수 설정하기 (setReviewLikeCount)
// 회원들이 누른 '추천해요' 개수 얻어오기 (getReviewLikeCount)
    
    
    // reBno번 게시물의 likers(좋아요를 누른 사람들) 조회

    
    $reviewLikeUp.click(function() {
        $.ajax ({
            type: "post",
            url: appRoot + "/review/get",
            data: {
                reBno: reBno,
                userid: userid
            },
            success: function(cnt, status) {
                console.log(status);
                $("#review-total-count").text(cnt);
                $('#staticBackdrop1').modal('hide');
            },
            error: function(xhr, status) {
                console.log(status);
                console.log("error!!!");
                alert("이미 추천하였습니다.");
                $('#staticBackdrop1').modal('hide');
            }
        })
    });

});




 
