
let LoginPopup = {
    setup: function() {
      let popupDive = $('<div id="loginPopup"></div>');
      popupDive.hide().appendTo($('body'));
      $(document).on('click', '#signupLogin', LoginPopup.getLoginInfo)
    },
    getLoginInfo: function (){
        $.ajax({
            type: 'GET',
            url: $(this).parent().attr('action'),
            timeout: 5000,
            success: LoginPopup.showLogin,
            error: function(xhrObj, testStatus, exception) { alert('Error!'); }
          });
          return(false);
    },
    showLogin: function (data, requestStatus, xhrObject) {
        console.log("Hello")
        let oneFourth = Math.ceil($(window).width()/4);
        $('#MainWindow').css({'opacity': 0.4})
        $('#loginPopup').
            css({'left': oneFourth,'width': 2*oneFourth, 'top':250, 'opacity': 1.0}).html(data).show();
        $(document).on('click', '#cancelLogin', LoginPopup.hideLogin);
        $('#signupLogin').prop("disabled", true);
        return(false);

    },
    hideLogin: function() {
        $('#loginPopup').hide();
        $('#MainWindow').css({'opacity': 1.0})
        $('#signupLogin').prop("disabled", false);
        return(false);
    }
};
jQuery(LoginPopup.setup);