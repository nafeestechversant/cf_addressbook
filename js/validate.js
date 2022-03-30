$(document).ready(function() {

    // Validate Username
    $('#usercheck').hide();
    let usernameError = true;
    $('#fld_userName').keyup(function() {
        validateUsername();
    });

    function validateUsername() {
        let usernameValue = $('#fld_userName').val();
        if (usernameValue.length == '') {
            $('#usercheck').show();
            usernameError = false;
            return false;
        } else {
            $('#usercheck').hide();
        }
    }

    $('#fullNamecheck').hide();
    let fullnameError = true;
    $('#fld_fullName').keyup(function() {
        validateFullname();
    });

    function validateFullname() {
        let fullnameValue = $('#fld_fullName').val();
        if (fullnameValue.length == '') {
            $('#fullNamecheck').show();
            fullnameError = false;
            return false;
        } else {
            $('#fullNamecheck').hide();
        }
    }

    // Validate Email
    $('#emailvalid').hide();
    let emailError = true;
    $('#fld_userEmail').keyup(function() {
        validateEmail();
    });

    function validateEmail() {
        let emailValue =
            $('#fld_userEmail').val();
        if (emailValue.length == '') {
            $('#emailvalid').show();
            emailError = false;
            return false;
        } else {
            $('#emailvalid').hide();
        }
    }

    // Validate Password
    $('#passcheck').hide();
    let passwordError = true;
    $('#fld_userPwd').keyup(function() {
        validatePassword();
    });

    function validatePassword() {
        let passwordValue =
            $('#fld_userPwd').val();
        if (passwordValue.length == '') {
            $('#passcheck').show();
            passwordError = false;
            return false;
        } else {
            $('#passcheck').hide();
        }
    }

    // Validate Confirm Password
    $('#conpasscheck').hide();
    let confirmPasswordError = true;
    $('#fld_userCnfPwd').keyup(function() {
        validateConfirmPassword();
    });

    function validateConfirmPassword() {
        let confirmPasswordValue =
            $('#fld_userCnfPwd').val();
        let passwordValue =
            $('#fld_userPwd').val();
        if (confirmPasswordValue.length == '') {
            $('#conpasscheck').show();
            confirmPasswordError = false;
            return false;
        }
        if (passwordValue != confirmPasswordValue) {
            $('#conpasscheck').show();
            $('#conpasscheck').html(
                "**Password didn't Match");
            $('#conpasscheck').css(
                "color", "red");
            confirmPasswordError = false;
            return false;
        } else {
            confirmPasswordError = true;
            $('#conpasscheck').hide();
        }
    }

    // Submit button
    $('#fld_FormSubmit').click(function() {
        validateFullname();
        validateUsername();
        validatePassword();
        validateConfirmPassword();
        validateEmail();
        console.log(usernameError);
        console.log(passwordError);
        console.log(confirmPasswordError);
        console.log(emailError);
        console.log(fullnameError);
        if ((usernameError == true) &&
            (passwordError == true) &&
            (confirmPasswordError == true) &&
            (emailError == true) &&
            (fullnameError == true)) {
            return true;
        } else {
            return false;
        }
    });

    $('#fld_LoginSubmit').click(function() {
        validateUsername();
        validatePassword();
        if ((usernameError == true) &&
            (passwordError == true)) {
            return true;
        } else {
            return false;
        }

    });
});