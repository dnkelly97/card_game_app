$("#room_id").load(function() {
    App.lobby = App.cable.subscriptions.create({
            channel: "LobbyChannel",
            room: $("#room_id").innerText
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
                console.log(data);
            }
        }
    );
});