$(document).ready(function () {

    let $today = $("#today").val();
    let $justDate = $("#datelist-date").val();
    let $subscribeDate = $(".datelist-date").val();
    let $dataIndex = $(".date-index").val();

    // let dates = $("#subscribe-date-container").empty();
    // for (const date of $justDate) {
    //     dates.append(date);
    // }
    console.log($today);
    // console.log(dates);

    switch ($dataIndex) {
        case $dataIndex == 0:
            $subscribeDate = $today + 1;
            break;
        case $dataIndex == 1:
            $subscribeDate = $today + 7;
            break;
        case $dataIndex == 2:
            $subscribeDate = $today + 6;
            break;
        case $dataIndex == 3:
            $subscribeDate = $today + 5;
            break;
        case $dataIndex == 4:
            $subscribeDate = $today + 4;
            break;
        case $dataIndex == 5:
            $subscribeDate = $today + 3;
            break;
        case $dataIndex == 6:
            $subscribeDate = $today + 2;
            break;


        default:
            console.log($subscribeDate);
            showSubscribeDates();

    }

    // subscribe date container = 구독 날짜 모음... 
    // append 시켜서 ul 태그로 보여주기
    // 그리고 css style 변경해\\\\기
    function showSubscribeDates() {
        // let subscribeDateContainer = $("#subscribe-date-container");
        let subscribe_date_list = [
            $subscribeDate,
            $subscribeDate + 2,
            $subscribeDate + 4,
            $subscribeDate + 7,
            $subscribeDate + 9,
            $subscribeDate + 11
        ];

        console.log(subscribe_date_list);

        for (const subDates of subscribe_date_list) {
            if ($justDate == subDates) {
                console.log($justDate);
                console.log(subDates);
                $("#datelist-date").parent().parent().css("background-color", "pink");
                // subscribeDateContainer.append
            }
        }

    }

    // style 바꾸는 function


    // 작업이 이뤄지는 6일 확인하기

})