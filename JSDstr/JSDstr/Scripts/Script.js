(function () {
    Date.prototype.format = function(format) //author: meizz
    {
        var o = {
            "M+": this.getMonth() + 1, //month
            "d+": this.getDate(),    //day
            "h+": this.getHours(),   //hour
            "m+": this.getMinutes(), //minute
            "s+": this.getSeconds(), //second
            "q+": Math.floor((this.getMonth() + 3) / 3),  //quarter
            "S": this.getMilliseconds() //millisecond
        };

        if (/(y+)/.test(format))
            format = format.replace(RegExp.$1,
                (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(format))
                format = format.replace(RegExp.$1,
                    RegExp.$1.length == 1 ? o[k] :
                        ("00" + o[k]).substr(("" + o[k]).length));
        return format;
    };
    
    var helpers = {
        returnUrlParameter: "ReturnUrl",
        defaultReturnUrl: "/",
        pwdMinLength: 5,

        getUrlParameterByName: function (name) {
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
        },
        
        parseDate: function (jsonDate) {
            return new Date(parseInt(jsonDate.substr(6)));
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
        dateTimeFormat: "dd.MM.yyyy hh:mm:ss",

        addError: function (source, msg) {
            if (source != '')
                source += '</br>';
            return source + msg;
        },

        setAlertState: function ($alert, msg, success) {
            if ($alert != null && msg != '') {
                if (success) {
                    $alert.addClass(ui.successAlertClass);
                    $alert.removeClass(ui.errorAlertClass);
                } else {
                    $alert.addClass(ui.errorAlertClass);
                    $alert.removeClass(ui.successAlertClass);
                }
                $alert.html(msg);
                $alert.removeClass('hide');
            }
        }
    };

    var resources = {};

    var Processing = function () {
        var handlers = {
            successCreateSession: $.Callbacks(),
            failCreateSession: $.Callbacks(),
            successPingSession: $.Callbacks(),
            failPingSession: $.Callbacks(),
            successCancelSession: $.Callbacks(),
            failCancelSession: $.Callbacks(),

            failSessionClientNull: $.Callbacks(),
            failSessionServerNull: $.Callbacks(),
            failSessionInvalidState: $.Callbacks()
        };

        var currentSession;
        
        var createSession = function () {
            $.post('/processing/createsession', function (session) {
                if (!$.isPlainObject(session)) {
                    currentSession = null;
                    handlers.failSessionServerNull.fire();
                } else if (session.State != Processing.sessionState.Started) {
                    currentSession = null;
                    handlers.failSessionInvalidState.fire(session);
                } else {
                    currentSession = session;
                    handlers.successCreateSession.fire(session);
                    timerStarted = true;
                    startPing();
                }
            }).fail(function () {
                currentSession = null;
                handlers.failCreateSession.fire();
            });
        };
        
        var pingSession = function () {
            if (!$.isPlainObject(currentSession)) {
                handlers.failSessionClientNull.fire();
                return;
            }
            if (!pingExecuted) {
                pingExecuted = true;
                $.post('/processing/pingsession?sessionjson=' + JSON.stringify(currentSession), function (session) {
                    if (!$.isPlainObject(session)) {
                        currentSession = null;
                        timerStarted = false;
                        handlers.failSessionServerNull.fire();
                    } else if (session.State != currentSession.State) {
                        currentSession = null;
                        timerStarted = false;
                        handlers.failSessionInvalidState.fire(session);
                    } else {
                        currentSession = session;
                        handlers.successPingSession.fire(session);
                    }
                    pingExecuted = false;
                }).fail(function () {
                    currentSession = null;
                    timerStarted = false;
                    handlers.failPingSession.fire();
                });
            }
        };
        
        var cancelSession = function () {
            timerStarted = false;
            if (!$.isPlainObject(currentSession)) {
                handlers.failSessionClientNull.fire();
                return;
            }
            $.post('/processing/cancelsession?sessionjson=' + JSON.stringify(currentSession), function (session) {
                if (!$.isPlainObject(session)) {
                    currentSession = null;
                    handlers.failSessionServerNull.fire();
                } else if (session.State != Processing.sessionState.Stopped) {
                    currentSession = null;
                    handlers.failSessionInvalidState.fire(session);
                } else {
                    currentSession = null;
                    handlers.successCancelSession.fire(session);
                }
            }).fail(function () {
                currentSession = null;
                handlers.failCancelSession.fire();
            });
        };
        
        var timerStarted = false;
        var pingExecuted = false;
        var timerInterval = 500;
        
        var startPing = function () {
            if (timerStarted) {
                pingSession();
                setTimeout(startPing, timerInterval);
            }
        };
        
        this.startProcessing = createSession;
        this.stopProcessing = cancelSession;
        this.handlers = handlers;
        this.currentSession = currentSession;
    };
    Processing.sessionState = {
        Started: 1,
        Stopped: 2,
        Completed: 3
    };

    var account = {
        signIn: function (email, pwd, remember, success, fail) {
            $.post('/account/signin?email=' + email + '&pwd=' + pwd + '&remember=' + remember, success).fail(fail);
        },
        signInAnonym: function (success, fail) {
            $.post('/account/signinanonym', success).fail(fail);
        },
        signUp: function (email, pwd, success, fail) {
            $.post('/account/signup?email=' + email + '&pwd=' + pwd, success).fail(fail);
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
            } else
                $email.parent().removeClass(ui.errorClass);
            if (pwd == '' || pwd.length < helpers.pwdMinLength) {
                if (error == '')
                    $pwd.focus();
                error = ui.addError(error, resources.Error_Password);
                $pwd.parent().addClass(ui.errorClass);
            } else
                $pwd.parent().removeClass(ui.errorClass);
            if (error == '') {
                $btn.button('loading');
                account.signIn(email, pwd, remember, function (d) {
                    $btn.button('reset');
                    if (d == "True") {
                        ui.setAlertState($alert, resources.Success_SignIn, true);
                        setTimeout(helpers.returnBack, ui.messageDelay);
                        $btn.button('toggle');
                    } else {
                        ui.setAlertState($alert, resources.Error_SignIn, false);
                        $email.focus();
                    }
                }, function () {
                    $btn.button('reset');
                    ui.setAlertState($alert, resources.Error_General, false);
                });
            } else
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
            } else
                $email.parent().removeClass(ui.errorClass);
            if (pwd == '' || pwd.length < helpers.pwdMinLength) {
                if (error == '')
                    $pwd.focus();
                error = ui.addError(error, resources.Error_Password);
                $pwd.parent().addClass(ui.errorClass);
            } else
                $pwd.parent().removeClass(ui.errorClass);
            if (!accept) {
                error = ui.addError(error, resources.Error_NotAcceptedTerms);
            }
            if (error == '') {
                $btn.button('loading');
                account.signUp(email, pwd, function (d) {
                    $btn.button('reset');
                    if (d == "True") {
                        ui.setAlertState($alert, resources.Success_SignUp, true);
                        setTimeout(helpers.returnBack, ui.messageDelay);
                        $btn.button('toggle');
                    } else {
                        ui.setAlertState($alert, resources.Error_SignUp, false);
                        $email.focus();
                    }
                }, function () {
                    $btn.button('reset');
                    ui.setAlertState($alert, resources.Error_General, false);
                });
            } else
                ui.setAlertState($alert, error, false);
            return false;
        });

        $('#btnSignInAnonym').click(function () {
            var $alert = $("#msgSignInAnonym");
            var $btn = $(this);
            $btn.button('loading');
            account.signInAnonym(function (d) {
                $btn.button('reset');
                if (d == 'True') {
                    ui.setAlertState($alert, resources.Success_SignInAnonym, true);
                    setTimeout(helpers.returnBack, ui.messageDelay);
                    $btn.button('toggle');
                } else {
                    ui.setAlertState($alert, resources.Error_SignInAnonym, false);
                }
            }, function () {
                $btn.button('reset');
                ui.setAlertState($alert, resources.Error_General, false);
            });
            return false;
        });

        var createProcessing = function () {
            var $btn = $('#btnProcessing');
            var $alert = $('#msgProcessing');
            var processing = new Processing();
            processing.handlers.successCreateSession.add(function (session) {
                $btn.button('reset');
                $btn.html(resources.Button_StopSession);
                $btn.removeClass('btn-success');
                $btn.addClass('btn-danger');
                $btn.data('state', 'stop');
                ui.setAlertState($alert, resources.Success_CreateSession, true);
                updateProcessingInfo(session, true);
                console.log('Success create session: ' + JSON.stringify(session));
            });
            processing.handlers.failCreateSession.add(function () {
                $btn.button('reset');
                ui.setAlertState($alert, resources.Error_CreateSession, false);
                updateProcessingInfo(null, false);
                console.log('Fail create session');
            });
            processing.handlers.successPingSession.add(function (session) {
                if (session.state != Processing.sessionState)
                    updateProcessingInfo(session, true);
                console.log('Success ping session: ' + JSON.stringify(session));
            });
            processing.handlers.failPingSession.add(function () {
                updateProcessingInfo(null, false);
                console.log('Fail ping session');
            });
            processing.handlers.successCancelSession.add(function (session) {
                $btn.button('reset');
                $btn.html(resources.Button_StartSession);
                $btn.removeClass('btn-danger');
                $btn.addClass('btn-success');
                $btn.data('state', 'start');
                ui.setAlertState($alert, resources.Success_CancelSession, true);
                updateProcessingInfo(session, true);
                console.log('Success stop session: ' + JSON.stringify(session));
            });
            processing.handlers.failCancelSession.add(function () {
                $btn.button('reset');
                ui.setAlertState($alert, resources.Error_CancelSession, false);
                updateProcessingInfo(null, false);
                console.log('Fail cancel session');
            });
            processing.handlers.failSessionClientNull.add(function () {
                $btn.button('reset');
                ui.setAlertState($alert, resources.Error_SessionClientNull, false);
                updateProcessingInfo(null, false);
                console.log('Fail session client null');
            });
            processing.handlers.failSessionServerNull.add(function () {
                $btn.button('reset');
                ui.setAlertState($alert, resources.Error_SessionServerNull, false);
                updateProcessingInfo(null, false);
                console.log('Fail session server null');
            });
            processing.handlers.failSessionInvalidState.add(function (session) {
                $btn.button('reset');
                ui.setAlertState($alert, resources.Error_SessionInvalidState, false);
                updateProcessingInfo(null, false);
                console.log('Fail session invalid state: ' + JSON.stringify(session));
            });
            return processing;
        };

        var updateProcessingInfo = function (session, show) {
            var $sessionInfo = $('#msgProcessingInfo');
            if (show && $.isPlainObject(session)) {
                var $createdDate = $('#lblCreatedDate');
                var $changedDate = $('#lblChangedDate');
                var $guid = $('#lblGuid');
                var $userName = $('#lblUserName');
                var $state = $('#lblState');
                var $stateMessage = $('#lblStateMessage');

                $createdDate.html(helpers.parseDate(session.CreatedDate).format(ui.dateTimeFormat));
                $changedDate.html(helpers.parseDate(session.ChangedDate).format(ui.dateTimeFormat));
                $guid.html(session.Guid);
                $userName.html(session.UserName);
                var state = "";
                switch (session.State) {
                    case Processing.sessionState.Started:
                        state = resources.Label_StateStarted;
                        break;
                    case Processing.sessionState.Stopped:
                        state = resources.Label_StateStopped;
                        break;
                    case Processing.sessionState.Completed:
                        state = resources.Label_StateCompleted;
                        break;
                }
                $state.html(state);
                $stateMessage.html(session.StateMessage);

                $sessionInfo.removeClass('hide');
            } else {
                $sessionInfo.addClass('hide');
            }
        };

        var currentProcessing = createProcessing();

        $('#btnProcessing').click(function () {
            var $btn = $(this);
            var state = $btn.data('state');
            if (state == null) {
                state = 'start';
                $btn.data('state', state);
            }
            if (state == 'start') {
                $btn.button('starting');
                currentProcessing.startProcessing();
            }
            else if (state == 'stop') {
                $btn.button('stopping');
                currentProcessing.stopProcessing();
            }
        });
    };

    window.JSD = function () {
        //        this.helpers = helpers;
        //        this.validation = validation;
        //        this.processing = processing;
        this.resources = resources;

        $(document).ready(ready);
    };

    window.jsd = new JSD();
})();