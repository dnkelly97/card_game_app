let my_room_number;
const subscribe_to_room = function(room_number) {
    console.log("Hi, welcome to " + room_number);
    my_room_number = room_number;
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
                let transferReload = document.getElementById('transferCardsPopup').style.display === "";
                // console.log(data['pile'])
                // console.log($('#transfer_cards_details_header').attr('data-source-pile'))
                let transferID = String(data['pile'])===$('#transfer_cards_details_header').attr('data-source-pile')
                if(transferReload && transferID){
                    $.ajax({
                        type: 'GET',
                        url: $('#initiate_transfer_button').attr('action'),
                        timeout: 50000,
                        success: updateTransferPopup,
                        error: function(xhrObj, testStatus, exception) { alert('Error!'); }
                    });
                } else {
                    $.ajax({
                        type: 'GET',
                        url: "/rooms/" + String(room_number),
                        timeout: 50000,
                        success: updateLobby,
                        error: function (xhrObj, testStatus, exception) {
                            alert('Error!');
                        }
                    });
                }

            }
        }
    );
};
let updateLobby = function(data, xhrObj, testStatus){
    //------------- PreCondition ---------------
    console.log("in updateLobby")
    // Show cards center-top table
    let saveValue = -1
    for (let i = 0; i < $('#card-table tr').length; i++) {
        if(String($("tr#"+String(i)).css("display")) === "block"){
            saveValue = i;
            break;
        }
    }

    // General Popups
    let stateReload = null;
    let stateId = null;
    jQuery('.popup').each((index, element)=>{
        if(element !== undefined){
            if($(element).css('display') === "" || $(element).css('display') === "block"){
                stateReload = $(element).html();
                stateId = element.id;
            }
        }
    });

    // Check transfer specific select box
    let index = null;
    let destIndex = null;
    let table = [];
    let table_name = [];
    let div_to_scroll;

    if(stateId === "transferCardsPopup"){
        index = document.getElementById('pile_source_pile_id').options.selectedIndex
        destIndex = document.getElementById('pile_destination_pile_id').options.selectedIndex
        $("#transfer_cards_form input:checkbox").each((index, element)=>{
            if($(element).is(":checked")){table.push(index); table_name.push($(element).attr('id'))}
        });
        // Reset Scrollbar
        $("#transfer_cards_form div").each((index, element)=>{
            $(element).css('display') === "block" ? div_to_scroll = element.scrollTop : ""
        })

    }


    // Center piles
    let center_table_id = $(".cardsTable tr:visible").attr('id')


    //------------ Reset game room ----------------
    $("#game-room").empty().html(data);


    //------------ Post Condition -------------

    // Show piles
    if(saveValue !== -1){
        $("tr#"+String(saveValue)).css("display", "block")
    }


    // General Popup
    if(stateReload != null){
        $('#'+stateId).html(stateReload)
        document.getElementById(stateId).style.display="";
    }

    // Maintain transfer select state
    if(index != null){
        document.getElementById('pile_source_pile_id').options.selectedIndex = index
        document.getElementById('pile_destination_pile_id').options.selectedIndex = destIndex
        $("#transfer_cards_form input:checkbox").each((index, element)=>{
            table.includes(index) && table_name.includes($(element).attr('id')) ? $(element).prop("checked", true) : $(element).prop("checked", false)
        });
        $("#transfer_cards_form div").each((index, element)=>{
            $(element).css('display') === "block" ? element.scrollTop = div_to_scroll : ""
        })
    }

    // Center pile reload
    if(center_table_id !== null && center_table_id !== undefined) {
        $(".cardsTable tr#"+center_table_id).css('display', 'block')
    }


}

// Maintain transfer select state with card updates
let updateTransferPopup = (data, xhrObj, testStatus) => {
    let table = [];
    let table_name = [];
    $("#transfer_cards_form input:checkbox").each((index, element)=>{
        if($(element).is(":checked")){table.push(index); table_name.push($(element).attr('id'))}
    });
    let destIndex = document.getElementById('pile_destination_pile_id').options.selectedIndex
    let index = document.getElementById('pile_source_pile_id').options.selectedIndex


    let div_to_scroll;
    $("#transfer_cards_form div").each((index, element)=>{
        $(element).css('display') === "block" ? div_to_scroll = element.scrollTop : ""
    })

    $('#transferCardsPopup').empty().html(data).show();
    document.getElementById('pile_source_pile_id').options.selectedIndex = index
    document.getElementById('pile_destination_pile_id').options.selectedIndex = destIndex

    $("#transfer_cards_form input:checkbox").each((index, element)=>{
        table.includes(index) && table_name.includes($(element).attr('id')) ? $(element).prop("checked", true) : $(element).prop("checked", false)
    });
    TransferCardsPopup.showSourcePileCards()
    $("#transfer_cards_form div").each((index, element)=>{
        $(element).css('display') === "block" ? element.scrollTop = div_to_scroll : ""
    })

}
