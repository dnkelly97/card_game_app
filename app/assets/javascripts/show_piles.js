function show_pile(id){
    let arr = document.querySelectorAll(".cardsTable tr")
    for(let i=0; i<arr.length; i++){
        arr.item(i).style.display = "none"
    }
    id = parseInt(id)
    document.getElementById(id).style.display = "block"
}