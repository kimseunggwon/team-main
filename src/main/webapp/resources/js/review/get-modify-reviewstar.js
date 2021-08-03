$(document).ready(function () {
        const $reviewStarResult = $("#review-star-result").val();
        if ($reviewStarResult >= 1) {
            $("#jinah-star1").removeClass("far").addClass("fas");
        }
        if ($reviewStarResult >= 2) {
            $("#jinah-star2").removeClass("far").addClass("fas");
        }
        if ($reviewStarResult >= 3) {
            $("#jinah-star3").removeClass("far").addClass("fas");
        }
        if ($reviewStarResult >= 4) {
            $("#jinah-star4").removeClass("far").addClass("fas");
        }
        if ($reviewStarResult >= 5) {
            $("#jinah-star5").removeClass("far").addClass("fas");
        }


});