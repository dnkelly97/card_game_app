const subscribe_to_room = function(room_number) {
    console.log("Hi, welcome to " + room_number);
    App.lobby = App.cable.subscriptions.create({
            channel: "LobbyChannel",
            room: room_number
        },
        {
            connected() {
                // Called when the subscription is ready for use on the server

            },
            disconnected() {
                // Called when the subscription has been terminated by the server

            },
            received(data) {
                // Called when there's incoming data on the websocket for this channel
                // for each data['pile'], updated cards
                $.ajax({
                    type: 'GET',
                    url: "/rooms/"+String(room_number)+"/show_piles",
                    timeout: 5000,
                    success: test,
                    error: function(xhrObj, testStatus, exception) { alert('Error!'); }
                });
            }
        }
    );
};
let test = function(data, xhrObj, testStatus){
    let saveValue = -1
    for (let i = 0; i < $('#card-table tr').length; i++) {
        if(String($("tr#"+String(i)).css("display")) === "block"){
            saveValue = i;
            break;
        }
    }

    $(".top-center-panel").empty().html(data);
    if(saveValue !== -1){
        $("tr#"+String(saveValue)).css("display", "block")
    }
}