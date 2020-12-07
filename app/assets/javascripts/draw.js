
let DrawsPopup = {
    setup: function() {
        let popupDive = $('<div id="drawPopup"></div>');
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
        let oneFourth = Math.ceil($(window).width()/4);
        $('#MainWindow').css({'opacity': 0.4})
        $('#drawPopup').
        css({'left': oneFourth,'width': 2*oneFourth, 'top':250, 'opacity': 1.0}).html(data).show();
        $(document).on('click', '#cancel', DrawsPopup.hideForm);
        $('#draw_button').prop("disabled", true);
        return(false);

    },
    hideForm: function() {
        $('#drawPopup').hide();
        $('#MainWindow').css({'opacity': 1.0})
        $('#draw_button').prop("disabled", false);
        return(false);
    }
};
jQuery(DrawsPopup.setup);