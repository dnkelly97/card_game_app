function show_cards(id){
    let arr = document.querySelectorAll(".cardsTable tr")
    for(let i=0; i<arr.length; i++){
        arr.item(i).style.display = "none"
    }
    id = parseInt(id)
    document.getElementById(id).style.display = "block"
}

function display_pile(id){
    var html_str = "<h6>Pile: " + id + "</h6>"
    var panel = document.getElementById("show-pile-panel");
    panel.innerHTML = html_str
}