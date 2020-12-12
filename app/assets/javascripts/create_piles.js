
let CreatePilesPopup = {
    setup: function() {
        let popupDive = $('<div id="createPilesPopup" class="popup"></div>');
        popupDive.hide().appendTo($('body'));
        $(document).on('click', '#create_pile', CreatePilesPopup.showPileForm)
    },
    showPileForm: function (){
        $.ajax({
            type: 'POST',
            url: $(this).parent().attr('action'),
            timeout: 50000,
            success: CreatePilesPopup.fillForm,
            error: function(xhrObj, testStatus, exception) { alert('Error! ):'); }
        });
        return(false);
    },
    fillForm: function (data, requestStatus, xhrObject) {
        $('#MainWindow').css({'opacity': 0.4})
        $('#createPilesPopup').html(data).show();
        $(document).on('click', '#cancel', CreatePilesPopup.hideForm);
        $('#create_pile').prop("disabled", true);
        return(false);

    },
    hideForm: function() {
        $('#createPilesPopup').hide();
        $('#MainWindow').css({'opacity': 1.0})
        $('#create_pile').prop("disabled", false);
        return(false);
    }
};
