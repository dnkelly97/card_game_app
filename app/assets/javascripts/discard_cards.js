let DiscardCardsPopup = {
    setup: function() {
        let popupDive = $('<div id="discardCardsPopup" class="popup"></div>');
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
        $('#MainWindow').css({'opacity': 0.4})
        $('#discardCardsPopup').html(data).show();
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
