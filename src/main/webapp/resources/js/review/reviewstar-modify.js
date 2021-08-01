$(document).ready(function () {

    const $reviewModifyBtn = $('#review-star-modify-btn');

        $(".review-star-child").click(function() {
            console.log("!!!!!!!")
            $(".review-star-child").find("[data-fa-i2svg]").removeClass("fas").addClass("far");
            $(this).prevAll().find("[data-fa-i2svg]").removeClass("far").addClass("fas");
            $(this).find("[data-fa-i2svg]").removeClass("far").addClass("fas");
        });

    $reviewModifyBtn.click(function () {
        console.log("star!");
        $.ajax({
            type: "post",
            url: appRoot + "/review/modify",
            data: {
              reBno: reBno  
            },
            success: function (cnt) {
                        cnt = $('[data-fa-i2svg][data-prefix=fas]').length;
                        $("#new-restars").text(cnt);
                        console.log(cnt);
                        $("#stars-submit").val(cnt);
                        console.log($("#stars-submit").val());
            },
            error: function () {
                cnt = $('[data-fa-i2svg][data-prefix=fas]').length;
                console.log("error - reviewstar");
                console.log(cnt);
                console.log($("#new-restars").val());

            }
        });
    })
});

