let TransferCardsPopup = {
    setup: function() {
        let popupDive = $('<div id="transferCardsPopup"></div>');
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
        let oneFourth = Math.ceil($(window).width()/4);
        $('#MainWindow').css({'opacity': 0.4})
        $('#transferCardsPopup').
        css({'left': oneFourth,'width': 2*oneFourth, 'top':250, 'opacity': 1.0}).html(data).show();
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