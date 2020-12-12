let ShowHand = {
    setup: function() {
        $(document).on('ajax:success', '#show_hand_form', ShowHand.toggleShowHandButton)
    },
    toggleShowHandButton: function (data, xhrObject, requestStatus){
        console.log("ajax was successful")
        $('#show_hand_form').replaceWith(xhrObject);
        return(false);
    }
};
jQuery(ShowHand.setup);