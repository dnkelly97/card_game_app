function show_hand(){
    $.ajax({
        type: 'GET',
        url: $(this).parent().attr('action'),
        timeout: 5000,
        success: console.log("Success"),
        error: function(xhrObj, testStatus, exception) { alert('Error!'); }
    });
}