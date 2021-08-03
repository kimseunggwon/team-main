$(document).ready(function () {

    const $reviewResult = $('.review-result');

    // cnt는 채워진 별 개수
    // let cnt = $('[data-fa-i2svg].fas').length;

        $(".review-star-child").click(function() {
            console.log("!!!!!!!")
            $(".review-star-child").find("[data-fa-i2svg]").removeClass("fas").addClass("far");
            $(this).prevAll().find("[data-fa-i2svg]").removeClass("far").addClass("fas");
            $(this).find("[data-fa-i2svg]").removeClass("far").addClass("fas");
        });

    $reviewResult.click(function () {
        console.log("star!");
        $.ajax({
            type: "get",
            url: appRoot + "/review/write",
            success: function (cnt) {
                        cnt = $('[data-fa-i2svg][data-prefix=fas]').length;
                        $("#reStars").text(cnt);
                        console.log(cnt);
                        $("#stars-submit").val(cnt);
                        console.log($("#stars-submit").val());
            },
            error: function () {
                console.log("error - reviewstar");

            }
        });
    })
});

