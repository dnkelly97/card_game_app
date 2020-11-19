let LoginPopup = {
    setup: function() {
        let popupDive = $('<div id="loginPopup"></div>>');
        popupDive.hide().appendTo($('body'));
        $(document).on('click', '#signupLogin', LoginPopup.getLoginInfo)
    },
    getLoginInfo: function (){
        $.ajax({
            type: 'GET',
            url: $(this).attr('href'),
            timeout: 5000,
            success: LoginPopup.showLogin,
            error: function(xhrObj, testStatus, exception) { alert('Error!'); }
        });
        return(false)
    },
    showLogin: function (data, requestStatus, xhrObject) {
        let oneFourth = Math.ceil($(window).width()/4);
        $('#loginPipup').
            css({'let': oneFourth,'width': 2*oneFourth, 'top':250}).html(data).show();
        $('')
    }
};