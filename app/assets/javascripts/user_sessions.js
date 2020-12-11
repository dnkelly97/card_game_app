
let LoginPopup = {
    setup: function() {
      let popupDive = $('<div id="loginPopup" class="popup"></div>');
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
        $('#MainWindow').css({'opacity': 0.4})
        $('#loginPopup').html(data).show();
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
