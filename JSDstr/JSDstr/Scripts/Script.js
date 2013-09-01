$(document).ready(function () {
    var errorClass = 'has-error';
    var errorAlertClass = 'alert-danger';
    var successAlertClass = 'alert-success';

    function addError(source, msg) {
        if (source != '')
            source += '</br>';
        return source + msg;
    }

    $('#btnSignIn').click(function () {
        var error = '';
        var $email = $('#txtSignInEmail');
        var email = $email.val();
        var $pwd = $('#txtSignInPwd');
        var pwd = $pwd.val();
        var $remember = $('#chkRemember');
        var remember = true; //$remember.attr('checked') == true;
        var $alert = $("#errSignIn");
        if (email == '' || !validation.isEmail(email)) {
            error = addError(error, Resources.InvalidEmail);
            $email.parent().addClass(errorClass);
            $email.focus();
        }
        else
            $email.parent().removeClass(errorClass);
        if (pwd == '') {
            if (error == '')
                $pwd.focus();
            error = addError(error, Resources.InvalidPassword);
            $pwd.parent().addClass(errorClass);
        }
        else
            $pwd.parent().removeClass(errorClass);
        if (error == '') {
            $.post('/processing/signin?email=' + email + '&pwd=' + pwd + '&remember=' + remember, function (d) {
                if (d) {
                    $alert.removeClass(errorAlertClass);
                    $alert.addClass(successAlertClass);
                    $alert.html(Resources.SuccessAuthorization);
                    setTimeout(function () { window.location.reload(); }, 1000);
                }
                else {
                    $alert.addClass(errorAlertClass);
                    $alert.removeClass(successAlertClass);
                    $alert.html(Resources.InvalidCredentials);
                    $email.focus();
                }
                $alert.removeClass('hide');
            });
            return false;
        }
        $alert.addClass('alert-danger');
        $alert.html(error);
        $alert.removeClass('hide');
        return false;
    });

    $('#btnSignUp').click(function () {
        var error = '';
        var $email = $('#txtSignUpEmail');
        var email = $email.val();
        var $pwd = $('#txtSignUpPwd');
        var pwd = $pwd.val();
        var $accept = $('#chkAccept');
        var accept = true; //$accept.attr('checked') == true;
        var $alert = $("#errSignUp");
        if (email == '' || !validation.isEmail(email)) {
            error = addError(error, Resources.InvalidEmail);
            $email.parent().addClass(errorClass);
            $email.focus();
        }
        else
            $email.parent().removeClass(errorClass);
        if (pwd == '') {
            if (error == '')
                $pwd.focus();
            error = addError(error, Resources.InvalidPassword);
            $pwd.parent().addClass(errorClass);
        }
        else
            $pwd.parent().removeClass(errorClass);
        if (!accept) {
            error = addError(error, Resources.NotAcceptedTerms);
        }
        if (error == '') {
            $.post('/processing/signup?email=' + email + '&pwd=' + pwd, function (d) {
                if (d) {
                    $alert.removeClass(errorAlertClass);
                    $alert.addClass(successAlertClass);
                    $alert.html(Resources.SuccessAuthentification);
                    setTimeout(function () { window.location.reload(); }, 1000);
                }
                else {
                    $alert.addClass(errorAlertClass);
                    $alert.removeClass(successAlertClass);
                    $alert.html(Resources.ErrorAuthentification);
                    $email.focus();
                }
                $alert.removeClass('hide');
            });
            return false;
        }
        $alert.addClass('alert-danger');
        $alert.html(error);
        $alert.removeClass('hide');
        return false;
    });
});

var validation = {
    isEmail: function (email) {
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return regex.test(email);
    }
};