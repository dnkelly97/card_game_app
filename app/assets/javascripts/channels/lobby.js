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
                    url: "/rooms/"+String(room_number),
                    timeout: 5000,
                    success: updateLobby,
                    error: function(xhrObj, testStatus, exception) { alert('Error!'); }
                });
            }
        }
    );
};
let updateLobby = function(data, xhrObj, testStatus){
    //------------- PreCondition ---------------

    // Show cards center-top table
    let saveValue = -1
    for (let i = 0; i < $('#card-table tr').length; i++) {
        if(String($("tr#"+String(i)).css("display")) === "block"){
            saveValue = i;
            break;
        }
    }
    // Create Piles Popup
    let createPilesReload = document.getElementById('createPilesPopup').style.display === "";
    let CPHtml =  $('#createPilesPopup').html();

    // Draw Popup
    let drawReload = document.getElementById('drawPopup').style.display === "";
    let drawHtml = $('#drawPopup').html();


    let transferReload = document.getElementById('transferCardsPopup').style.display === "";
    let transferHtml = $('#transferCardsPopup').html();

    let stateReload = null;
    let stateId = null;
    $('.popup').each(()=>{
        if($(this).css('display') == "" || $(this).css('display') == "block"){
            stateReload = $(this).html();
            stateId = this.id;
        }
    });

    //------------ Reset game room ----------------
    $("#game-room").empty().html(data);


    //------------ Post Condition -------------

    // Show piles
    if(saveValue !== -1){
        $("tr#"+String(saveValue)).css("display", "block")
    }


    // Create Piles Popup
    if(transferReload){
        // TODO: replace with element's actual show function, or an alias of it
        $('#transferCardsPopup').html(transferHtml);
        document.getElementById('transferCardsPopup').style.display = "";
    } else if(stateReload != null){
        $('#'+stateId).html(stateReload)
        document.getElementById(stateId).style.display="";
    } else if(createPilesReload){
        $('#createPilesPopup').html(CPHtml);
        document.getElementById('createPilesPopup').style.display = "";
    } else if(drawReload){
        $('#drawPopup').html(drawHtml);
        document.getElementById('drawPopup').style.display = "";
    }


}