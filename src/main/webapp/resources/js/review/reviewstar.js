$(document).ready(function () {

    const $reviewResult = $('.review-result');

    $('.review-star-child').click(function () {
        console.log("star!");
        $.ajax({
            type: "get",
            url: appRoot + "/review/write",
            success: function (cnt) {
                    // cnt는 fas 클래스 개수
                    cnt = $('.fas').length;
                    
                    // 별을 클릭했을 때, 채워진 별로 바뀐다. (ex- 3번째 클릭 >> 왼쪽 별 부터 3개 모두 채워지기)
                    // $(this).parent().children('i').removeClass('far');
                    console.log("!!!!!!!")
                    $(".review-star-child").find("[data-fa-i2svg]").removeClass("fas").addClass("far");
                    $(this).prevAll().find("[data-fa-i2svg]").removeClass("far").addClass("fas");
                    $(this).find("[data-fa-i2svg]").removeClass("far").addClass("fas");

                    // 근데 등록하기를 눌렀을 때만 DB에 정상적으로 등록되어야 한다.
                    if ($reviewResult.click) {
                        $("#reStars").text(cnt);
                    }
            },
            error: function () {
                console.log("error - reviewstar");

            }
        });
    })
});

