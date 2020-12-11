function show_hand(){
    $.ajax({
        type: 'GET',
        url: $(this).parent().attr('action'),
        timeout: 10000,
        success: function(data, requestStatus, xhrObject){
            console.log(data);
            $('#show_hand_form').html(data);
        },
        error: function(xhrObj, testStatus, exception) { console.log('show_hand.js error!'); }
    });
}