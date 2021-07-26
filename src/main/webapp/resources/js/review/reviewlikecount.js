$(document).ready(function () {
// 회원이 '추천해요' 버튼을 눌렀을 때 좋아요 수 설정하기 (setReviewLikeCount)
// 회원들이 누른 '추천해요' 개수 얻어오기 (getReviewLikeCount)
    const $reviewLikeUp = $("#review-like-up");
    const reBno = $reviewLikeUp.attr("data-reBno");
    
    // $reviewLikeUp.click(function() {
    //     $.ajax ({
    //         type: "post",
    //         url: appRoot + "/review/get?reBno=" + reBno,
    //         success: function(cnt, status) {
    //             console.log(status);
    //             $("#review-total-count").text(cnt);
    //             $('#staticBackdrop1').modal('hide');
    //         },
    //         error: function(xhr, status) {
    //             console.log(status);
    //             console.log("error!!!");
    //         }
    //     })
    // });

    // if (history.state == null) {
        
    //     $reviewLikeUp.click(function() {
    //         $.ajax ({
    //             type: "post",
    //             url: appRoot + "/review/get?reBno=" + reBno,
    //             success: function(cnt, status) {
    //                 console.log(status);
    //                 $("#review-total-count").text(cnt);
    //                 history.replaceState($userid, null);
    //                 $('#staticBackdrop1').modal('hide');
    //             },
    //             error: function(xhr, status) {
    //                 console.log(status);
    //                 console.log("error!!!");
    //             }
    //         })
    //     });
    // } else if (history.state == $userid) {
    //     console.log("check state");
    //     alert("이미 추천한 게시물입니다.");
    // }

    $reviewLikeUp.click(function(e) {
        $.ajax ({
            type: "post",
            url: appRoot + "/review/get?reBno=" + reBno,
            success: function(cnt, status) {
                console.log(status);
                if (history.state == $userid) {
                    e.preventDefault();
                    alert("이미 추천한 게시물입니다.");
                    $('#staticBackdrop1').modal('hide');
                } else {
                    $("#review-total-count").text(cnt);
                    history.replaceState($userid, null);
                    $('#staticBackdrop1').modal('hide');
                }
            },
            error: function(xhr, status) {
                console.log(status);
                console.log("error!!!");
            }
        })
    });

});




 
