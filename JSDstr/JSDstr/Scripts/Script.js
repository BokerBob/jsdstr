(function () {
    var helpers = {
        returnUrlParameter: "ReturnUrl",
        defaultReturnUrl: "/",
        pwdMinLength: 5,

        getUrlParameterByName: function(name) {
            name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        },

        returnBack: function () {
            var returnUrl = helpers.getUrlParameterByName(helpers.returnUrlParameter);
            if (returnUrl != "")
                window.location = returnUrl;
            else
                window.location = helpers.defaultReturnUrl;
        }
    };

    var validation = {
        isEmail: function (email) {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return regex.test(email);
        }
    };

    var ui = {
        errorClass: 'has-error',
        errorAlertClass: 'alert-danger',
        successAlertClass: 'alert-success',

        addError: function (source, msg) {
            if (source != '')
                source += '</br>';
            return source + msg;
        },

        setAlertState: function ($alert, msg, success) {
            if ($alert != null) {
                if (success) {
                    $alert.addClass(ui.successAlertClass);
                    $alert.removeClass(ui.errorAlertClass);
                }
                else {
                    $alert.addClass(ui.errorAlertClass);
                    $alert.removeClass(ui.successAlertClass);
                }
                $alert.html(msg);
                $alert.removeClass('hide');
            }
        }
    };

    var resources = {};

    var processing = {
        createSession: function (success, fail) {
            $.post('/processing/createsession', function (d) {
                if (d != '') {
                    if($.isFunction(success))
                        success(d);
                }
                else if ($.isFunction(fail))
                    fail();
            });
        }
    };

    var ready = function () {
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
                error = ui.addError(error, resources.Error_Email);
                $email.parent().addClass(ui.errorClass);
                $email.focus();
            }
            else
                $email.parent().removeClass(ui.errorClass);
            if (pwd == '' || pwd.length < helpers.pwdMinLength) {
                if (error == '')
                    $pwd.focus();
                error = ui.addError(error, resources.Error_Password);
                $pwd.parent().addClass(ui.errorClass);
            }
            else
                $pwd.parent().removeClass(ui.errorClass);
            if (error == '') {
                $btn.button('loading');
                $.post('/account/signin?email=' + email + '&pwd=' + pwd + '&remember=' + remember, function (d) {
                    if (d == "True") {
                        ui.setAlertState($alert, resources.Success_SignIn, true);
                        setTimeout(helpers.returnBack, ui.messageDelay);
                    }
                    else {
                        ui.setAlertState($alert, resources.Error_SignIn, false);
                        $email.focus();
                    }
                    $btn.button('reset');
                }).fail(function () {
                    $btn.button('reset');
                    ui.setAlertState($alert, resources.Error_General, false);
                });
            }
            else
                ui.setAlertState($alert, error, false);
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
                error = ui.addError(error, resources.Error_Email);
                $email.parent().addClass(ui.errorClass);
                $email.focus();
            }
            else
                $email.parent().removeClass(ui.errorClass);
            if (pwd == '' || pwd.length < helpers.pwdMinLength) {
                if (error == '')
                    $pwd.focus();
                error = ui.addError(error, resources.Error_Password);
                $pwd.parent().addClass(ui.errorClass);
            }
            else
                $pwd.parent().removeClass(ui.errorClass);
            if (!accept) {
                error = ui.addError(error, resources.Error_NotAcceptedTerms);
            }
            if (error == '') {
                $btn.button('loading');
                $.post('/account/signup?email=' + email + '&pwd=' + pwd, function (d) {
                    if (d == "True") {
                        ui.setAlertState($alert, resources.Success_SignUp, true);
                        setTimeout(helpers.returnBack, ui.messageDelay);
                    }
                    else {
                        ui.setAlertState($alert, resources.Error_SignUp, false);
                        $email.focus();
                    }
                    $btn.button('reset');
                }).fail(function () {
                    $btn.button('reset');
                    ui.setAlertState($alert, resources.Error_General, false);
                });
            }
            else
                ui.setAlertState($alert, error, false);
            return false;
        });

        $('#btnSignInAnonym').click(function () {
            var $alert = $("#msgSignInAnonym");
            var $btn = $(this);
            $btn.button('loading');
            $.post('/account/signinanonym', function (d) {
                if (d == 'True') {
                    ui.setAlertState($alert, resources.Success_SignInAnonym, true);
                    setTimeout(helpers.returnBack, ui.messageDelay);
                }
                else {
                    ui.setAlertState($alert, resources.Error_SignInAnonym, false);
                }
                $btn.button('reset');
            }).fail(function () {
                $btn.button('reset');
                ui.setAlertState($alert, resources.Error_General, false);
            });
            return false;
        });

        $('#btnProcessing').click(function () {
            var $btn = $(this);
            var $alert = $('#msgProcessing');
            $btn.button('starting');
            processing.createSession(function (guid) {
                $btn.button('reset');
                $btn.html(resources.Button_StopSession);
                $btn.removeClass('btn-success');
                $btn.addClass('btn-danger');
                alert(guid);
            }, function () {
                $btn.button('reset');
                ui.setAlertState($alert, resources.Error_StartSession, false);
            });
        });
    };

    JSD = function () {
        this.helpers = helpers;
        this.validation = validation;
        this.resources = resources;
        this.processing = processing;

        $(document).ready(ready);
    };

    window.jsd = new JSD();
})();