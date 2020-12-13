
let DrawsPopup = {
    setup: function() {
        let popupDive = $('<div id="drawPopup" class="popup"></div>');
        popupDive.hide().appendTo($('body'));
        $(document).on('click', '#draw_button', DrawsPopup.getNum)
    },
    getNum: function (){
        $.ajax({
            type: 'GET',
            url: $(this).parent().attr('action'),
            timeout: 50000,
            success: DrawsPopup.showNumForm,
            error: function(xhrObj, testStatus, exception) { alert('Error! ):'); }
        });
        return(false);
    },
    showNumForm: function (data, requestStatus, xhrObject) {
        console.log($(this).parent().attr('action'))
        $('#MainWindow').css({'opacity': 0.4})
        $('#drawPopup').html(data).show();
        $(document).on('click', '#cancel', DrawsPopup.hideForm);
        $('#draw_button').prop("disabled", true);
        $(document).on('ajax:complete', '#draw_form', DrawsPopup.hideForm);

        return(false);

    },
    hideForm: function() {
        $('#drawPopup').hide();
        $('#MainWindow').css({'opacity': 1.0})
        $('#draw_button').prop("disabled", false);
        return(false);
    }
};
