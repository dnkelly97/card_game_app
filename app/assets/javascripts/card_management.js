function changeCards(){
    if(document.getElementById('users-cards').getAttribute('class') === 'hand'){
        document.getElementById('users-cards').setAttribute('class', 'table')
    } else {
        document.getElementById('users-cards').setAttribute('class', 'hand')
    }
}

function fanCards(){
    if(document.getElementById('root-playing-card').getAttribute('class').match(/rotateHand/)){
        document.getElementById('root-playing-card').classList.remove('rotateHand')

    } else {
        document.getElementById('root-playing-card').classList.add('rotateHand')
        if(document.getElementById('user-cards').getAttribute('class')=== 'table'){
            document.getElementById('user-cards').classList.remove('table')
            document.getElementById('user-cards').classList.add('hand')
        }
    }
}