$(document).ready(function () {
        const $revieViewCount = $("#review-view-count");
        const $reviewRecordLink = $("#review-record-link");

        $reviewRecordLink.click(function viewCount() {
            $.ajax ({
                type: "post",
                url: appRoot + "/review/get?reBno=" + reBno,
                success: function(cnt) {
                    $revieViewCount.text(cnt);
                },
                error: function() {
                    console.log("error - viewcount");
                }
            });
        });
  });