let DiscardCardsPopup = {
    setup: function() {
        let popupDive = $('<div id="discardCardsPopup"></div>');
        popupDive.hide().appendTo($('body'));
        $(document).on('click', '#discard_button', DiscardCardsPopup.getCardInfo)
    },
    getCardInfo: function (){
        $.ajax({
            type: 'GET',
            url: $(this).parent().attr('action'),
            timeout: 50000,
            success: DiscardCardsPopup.showCards,
            error: function(xhrObj, testStatus, exception) { console.log(exception); }
        });
        return(false);
    },
    showCards: function (data, requestStatus, xhrObject) {
        let oneFourth = Math.ceil($(window).width()/4);
        $('#MainWindow').css({'opacity': 0.4})
        $('#discardCardsPopup').
        css({'left': oneFourth,'width': 2*oneFourth, 'top':250, 'opacity': 1.0}).html(data).show();
        $(document).on('click', '#cancel', DiscardCardsPopup.hideTransfer);
        $('#discard_button').prop("disabled", true);
        return(false);

    },
    hideTransfer: function() {
        $('#discardCardsPopup').hide();
        $('#MainWindow').css({'opacity': 1.0})
        $('#discard_button').prop("disabled", false);
        return(false);
    }
};
jQuery(DiscardCardsPopup.setup);