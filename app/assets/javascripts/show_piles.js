function show_cards(id){
    id = parseInt(id)
    if (document.getElementById(id).style.display == "block") {
        document.getElementById(id).style.display = "none"
    } else{
        document.getElementById(id).style.display = "block"
    }
}

function display_pile(id){
    var html_str = "<h6>Pile: " + id + "</h6>"
    var panel = document.getElementById("show-pile-panel");
    panel.innerHTML = html_str
}