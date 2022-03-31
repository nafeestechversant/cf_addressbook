$(document).ready(function() {
    $("#login_form").validate({
        rules: {
            fld_userName: {
                required: true
            },
            fld_userPwd: {
                required: true,
            }
        }
    });
    $("#register_form").validate({
        rules: {
            fld_fullName: "required",
            fld_userName: {
                required: true
            },
            fld_userPwd: {
                required: true,
                minlength: 5
            },
            fld_userCnfPwd: {
                required: true,
                minlength: 5,
                equalTo: "#fld_userPwd"
            },
            fld_userEmail: {
                required: true,
                email: true
            }
        }
    });
});