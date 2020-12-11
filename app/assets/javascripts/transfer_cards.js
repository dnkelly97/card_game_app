let TransferCardsPopup = {
    setup: function() {
        let popupDive = $('<div id="transferCardsPopup" class="popup"></div>');
        popupDive.hide().appendTo($('body'));
        $(document).on('click', '#pile_details', TransferCardsPopup.getCardInfo)
    },
    getCardInfo: function (){
        $.ajax({
            type: 'GET',
            url: $(this).parent().attr('action'),
            timeout: 50000,
            success: TransferCardsPopup.showCards,
            error: function(xhrObj, testStatus, exception) { console.log(exception); }
        });
        return(false);
    },
    showCards: function (data, requestStatus, xhrObject) {
        console.log("Hello")
        $('#MainWindow').css({'opacity': 0.4})
        $('#transferCardsPopup').html(data).show();
        $(document).on('click', '#cancel', TransferCardsPopup.hideTransfer);
        $('#pile_details').prop("disabled", true);
        return(false);

    },
    hideTransfer: function() {
        $('#transferCardsPopup').hide();
        $('#MainWindow').css({'opacity': 1.0})
        $('#pile_details').prop("disabled", false);
        return(false);
    }
};
jQuery(TransferCardsPopup.setup);