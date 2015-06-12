$(document).ready(function() {
    var url = window.location.href.split("RelayState=")[1];

    function failToLogin() {
        $(".loginIpt").css("display", "block");
        $(".error-message").css("display", "block");
        $("#btnLogin").css("display", "block");
        $(".success-message").css("display", "none");
        $(".valid-message").css("display", "none");
    }

    function tryToLogin() {
        if (tryToLogin.tries++ >= tryToLogin.MaxTries) {
            return failToLogin();
        }
        $.ajax({
            url: 'https://gw.wmcloud-stg.com/cloud/identity.jsonp',
            type: 'GET',
            dataType: 'jsonp',
            timeout: 5000,
            success: function(data) {
                if (!data || data.anonymous) {
                    return failToLogin();
                }
                window.location.assign(decodeURIComponent(url || '/cloud-portal/') + "?" + new Date().getTime());
                $(".loginIpt").css("display", "none");
                $(".error-message").css("display", "none");
                $("#btnLogin").css("display", "none");
                $(".valid-message").css("display", "none");
                $(".success-message").css("display", "block");
            },
            error: tryToLogin
        });
    }
    tryToLogin.tries = 0;
    tryToLogin.MaxTries = 3;

    tryToLogin();
});
