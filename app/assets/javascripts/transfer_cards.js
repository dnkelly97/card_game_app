let TransferCardsPopup = {
    setup: function() {
        let popupDive = $('<div id="transferCardsPopup" class="popup"></div>');
        popupDive.hide().appendTo($('body'));
        $(document).on('change', '#pile_source_pile_id', TransferCardsPopup.showSourcePileCards);
        $(document).on('click', '#initiate_transfer_button', TransferCardsPopup.getCardInfo);
    },
    showSourcePileCards: function(){
        var source_pile = $('#pile_source_pile_id').val();
        console.log(source_pile);
        var pile_id = "pile_table_".concat(source_pile);
        // todo: hide all tables that aren't the selected one
        var piles = document.querySelectorAll(".card-table")
        for (var i = 0; i < piles.length; i ++) {
            piles[i].parentElement.style.display = "none";
        }
        document.getElementById(pile_id).parentElement.style.display = "block";
    },
    getCardInfo: function (){
        $.ajax({
            type: 'GET',
            url: $(this).attr('action'),
            timeout: 50000,
            success: TransferCardsPopup.showCards,
            error: function(xhrObj, testStatus, exception) { console.log(exception); }
        });
        return(false);
    },
    showCards: function (data, requestStatus, xhrObject) {
        console.log("Hello")
        let oneFourth = Math.ceil($(window).width()/4);
        let drop = Math.ceil($(window).height()/8);
        $('#MainWindow').css({'opacity': 0.4})
        $('#transferCardsPopup').html(data).show();
        $(document).on('click', '#cancel', TransferCardsPopup.hideTransfer);
        $('#pile_details').prop("disabled", true);
        $(document).on('submit', '#transfer_cards_form', TransferCardsPopup.hideTransfer);
        return(false);
    },
    hideTransfer: function() {
        $('#transferCardsPopup').hide();
        $('#MainWindow').css({'opacity': 1.0})
        $('#pile_details').prop("disabled", false);
        return(false);
    }
};
