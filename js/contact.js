$(document).ready(function() {
    $("#cre_contact").validate();
});

function confirmDelete(pageID) {
    if (window.confirm('Are you sure you want to delete this Contact?')) {
        window.location.href = 'index.cfm?From=Delete&ID=' + pageID;
    } else {
        null;
    }
}

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            $('#cnt-img').attr('src', e.target.result).width(150).height(200);
        };

        reader.readAsDataURL(input.files[0]);
    }
}
$('.btn-action-edit').click(function() {
    var contact_id = $(this).data('id');
    $('#contact_head').text("Edit Contact");
    $('#submit_crteCon').val("Edit Contact");
    $.ajax({
        type: "POST",
        url: "login.cfc?method=getContactBy",
        data: "contact_id=" + contact_id,
        dataType: "json",
        cache: false,
        success: function(data) {
            console.log(data[0].CONTACT_IMAGE);
            var Dateofb = new Date(data[0].DATEOF_BIRTH);
            $('#cont_title option[value="' + data[0].TITLE + '"]').prop("selected", true);
            $('#cont_firstname').val(data[0].FIRSTNAME);
            $('#cont_lastname').val(data[0].LASTNAME);
            $('#cont_gender option[value="' + data[0].GENDER + '"]').prop("selected", true);
            $('#cont_dob').val(convertDate(Dateofb, "edit"));
            $('#cont_image').val(data[0].CONTACT_IMAGE);
            $('#cont_addr').val(data[0].ADDRESS);
            $('#cont_street').val(data[0].STREET);
            $('#cont_pin').val(data[0].PINCODE);
            $('#cont_email').val(data[0].CONTACT_EMAIL);
            $('#cont_phone').val(data[0].CONTACT_PHONE);
            $('#cont_id').val(data[0].CONTACT_ID);
            if (data[0].CONTACT_IMAGE != '') {
                $('#cnt-img').attr('src', 'img/contact-img/' + data[0].CONTACT_IMAGE);
            } else {
                $('#cnt-img').attr('src', 'img/RAY.jpg');
            }
        }
    });
});

$('.btn-action-view').click(function() {
    var contact_id = $(this).data('id');
    $.ajax({
        type: "POST",
        url: "login.cfc?method=getContactById",
        data: "contact_id=" + contact_id,
        dataType: "json",
        cache: false,
        success: function(data) {
            var Dateofb = new Date(data[0].DATEOF_BIRTH);
            $('#cnt-title').html(data[0].TITLE);
            $('#cnt-firstname').html(data[0].FIRSTNAME);
            $('#cnt-lastname').html(data[0].LASTNAME);
            $('#cnt-gender').html(data[0].GENDER);
            $('#cnt-dob').html(convertDate(Dateofb, "view"));
            $('#cnt-address').html(data[0].ADDRESS);
            $('#cnt-street').html(data[0].STREET);
            $('#cnt-pincode').html(data[0].PINCODE);
            $('#cnt-email').html(data[0].CONTACT_EMAIL);
            $('#cnt-phone').html(data[0].CONTACT_PHONE);
            if (data[0].CONTACT_IMAGE != '') {
                $('#view-cntimage').attr('src', 'img/contact-img/' + data[0].CONTACT_IMAGE);
            } else {
                $('#view-cntimage').attr('src', 'img/RAY.jpg');
            }
        }
    });
});

function convertDate(date, mode) {
    var yyyy = date.getFullYear().toString();
    var mm = (date.getMonth() + 1).toString();
    var dd = date.getDate().toString();
    var mmChars = mm.split('');
    var ddChars = dd.split('');
    if (mode == "edit") {
        return yyyy + '-' + (mmChars[1] ? mm : "0" + mmChars[0]) + '-' + (ddChars[1] ? dd : "0" + ddChars[0]);
    } else {
        return (ddChars[1] ? dd : "0" + ddChars[0]) + '-' + (mmChars[1] ? mm : "0" + mmChars[0]) + '-' + yyyy;
    }

}

function PrintElem() {
    w = window.open();
    w.document.write($('#print-data').html());
    w.print();
    w.close();
}
$("#fileinfo").submit(function(e) {
    e.preventDefault();
});
$("input[type='image']").click(function() {
    $("input[id='my_file']").click();
});

$("#my_file").on('change', function() {

    var fd = new FormData(document.getElementById("fileinfo"));
    var file = $('#my_file')[0].files[0]
    $.ajax({
            url: "login.cfc?method=updateUserImage",
            type: "POST",
            data: fd,
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false
        }).done(function(data) {
            $('#no-img').attr('src', 'img/profile-img/' + file.name);
        })
        .fail(function(jqXHR, textStatus, errorMessage) {
            console.log(errorMessage);
        })
    return false;
});

$("#id-create-contact").click(function() {
    $('#contact_head').text("Create Contact");
    $('#submit_crteCon').val("Create Contact");
    $('#cre_contact').trigger("reset");
    $('#cnt-img').attr('src', 'img/RAY.jpg');
});

$(document).on('hide.bs.modal', '#CreateModal', function() {
    var validator = $("#cre_contact").validate();
    validator.resetForm();
});