function showUploadedFile(uploadResultArr) {
    const $uploadResult = $(".uploadResult ul").empty();
    let str = "";

    $(uploadResultArr).each(function (i, obj) {
            str += "<li>" + obj.name + "</li>";
    });
    $uploadResult.append(str);
}

$(document).ready(function () {

    //
    $("#re-input2").change(function () {
        console.log("change...")
        console.log(this);
        console.log(this.files);
        showUploadedFile(this.files);
    })

    $.ajax({
        url: appRoot + "/review/write",
        processData: false,
        contentType: false,
        data: FormData,
        type: "get",
        dataType: "json",
        success: function (result) {
            console.log(result);
            showUploadedFile(result);
            $("#uploadDiv").html(cloneObj.html());
        },
        error: function () {
            console.log("error");
        }
        
    });
});