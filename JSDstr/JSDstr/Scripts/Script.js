$(document).ready(function () {
    var errorClass = 'has-error';
    var errorAlertClass = 'alert-danger';
    var successAlertClass = 'alert-success';

    var pwdMinLength = 5;
    var messageDelay = 2000;

    function addError(source, msg) {
        if (source != '')
            source += '</br>';
        return source + msg;
    }

    function returnBack() {
        var returnUrl = helpers.getParameterByName("returnUrl");
        if (returnUrl == "")
            window.location = "/";
        else
            window.location = returnUrl;
    }

    function setAlertState($alert, msg, success) {
        if ($alert) {
            if (success) {
                $alert.removeClass(errorAlertClass);
                $alert.addClass(successAlertClass);
            }
            else {
                $alert.removeClass(successAlertClass);
                $alert.addClass(errorAlertClass);
            }
            $alert.html(msg);
            $alert.removeClass('hide');
        }
    }

    $('#btnSignIn').click(function () {
        var error = '';
        var $email = $('#txtSignInEmail');
        var email = $email.val();
        var $pwd = $('#txtSignInPwd');
        var pwd = $pwd.val();
        var $remember = $('#chkRemember');
        var remember = $remember.prop('checked') == true;
        var $alert = $("#msgSignIn");
        var $btn = $(this);

        if (email == '' || !validation.isEmail(email)) {
            error = addError(error, Resources.Error_Email);
            $email.parent().addClass(errorClass);
            $email.focus();
        }
        else
            $email.parent().removeClass(errorClass);
        if (pwd == '' || pwd.length < pwdMinLength) {
            if (error == '')
                $pwd.focus();
            error = addError(error, Resources.Error_Password);
            $pwd.parent().addClass(errorClass);
        }
        else
            $pwd.parent().removeClass(errorClass);
        if (error == '') {
            $btn.button('loading');
            $.post('/account/signin?email=' + email + '&pwd=' + pwd + '&remember=' + remember, function (d) {
                if (d == "True") {
                    setAlertState($alert, Resources.Success_SignIn, true);
                    setTimeout(returnBack, messageDelay);
                }
                else {
                    setAlertState($alert, Resources.Error_SignIn, false);
                    $email.focus();
                }
                $btn.button('reset');
            }).fail(function () {
                $btn.button('reset');
                setAlertState($alert, Resources.Error_General, false);
            });
        }
        else
            setAlertState($alert, error, false);
        return false;
    });

    $('#btnSignUp').click(function () {
        var error = '';
        var $email = $('#txtSignUpEmail');
        var email = $email.val();
        var $pwd = $('#txtSignUpPwd');
        var pwd = $pwd.val();
        var $accept = $('#chkAccept');
        var accept = $accept.prop('checked') == true;
        var $alert = $("#msgSignUp");
        var $btn = $(this);

        if (email == '' || !validation.isEmail(email)) {
            error = addError(error, Resources.Error_Email);
            $email.parent().addClass(errorClass);
            $email.focus();
        }
        else
            $email.parent().removeClass(errorClass);
        if (pwd == '' || pwd.length < pwdMinLength) {
            if (error == '')
                $pwd.focus();
            error = addError(error, Resources.Error_Password);
            $pwd.parent().addClass(errorClass);
        }
        else
            $pwd.parent().removeClass(errorClass);
        if (!accept) {
            error = addError(error, Resources.Error_NotAcceptedTerms);
        }
        if (error == '') {
            $btn.button('loading');
            $.post('/account/signup?email=' + email + '&pwd=' + pwd, function (d) {
                if (d == "True") {
                    setAlertState($alert, Resources.Success_SignUp, true);
                    setTimeout(returnBack, messageDelay);
                }
                else {
                    setAlertState($alert, Resources.Error_SignUp, false);
                    $email.focus();
                }
                $btn.button('reset');
            }).fail(function () {
                $btn.button('reset');
                setAlertState($alert, Resources.Error_General, false);
            });
        }
        else
            setAlertState($alert, error, false);
        return false;
    });

    $('#btnSignInAnonym').click(function () {
        var $alert = $("#msgSignInAnonym");
        var $btn = $(this);
        $btn.button('loading');
        $.post('/account/signinanonym', function (d) {
            if (d == 'True') {
                setAlertState($alert, Resources.Success_SignInAnonym, true);
                setTimeout(returnBack, messageDelay);
            }
            else {
                setAlertState($alert, Resources.Error_SignInAnonym, false);
            }
            $btn.button('reset');
        }).fail(function () {
            $btn.button('reset');
            setAlertState($alert, Resources.Error_General, false);
        });
        return false;
    });
});

var validation = {
    isEmail: function (email) {
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return regex.test(email);
    }
};

var helpers = {
    getParameterByName: function (name) {
        name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }
};