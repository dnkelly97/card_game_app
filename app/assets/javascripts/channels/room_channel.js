import consumer from "./consumer"

consumer.subscriptions.create(
    {
        channel: "RoomChannel",
        id: window.location.href.split("/")[-1]
    },
    {
        connected: function(data) {
            console.log("Connected to socket. Reading " + data)
        },
        received: function(data) {
            console.log("Received: " + data);
            _onMessage ( data )
        }
    }
)