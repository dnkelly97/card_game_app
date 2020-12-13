function changeCards(){
    if(document.getElementById('users-cards').getAttribute('class') === 'hand'){
        document.getElementById('users-cards').setAttribute('class', 'table')
        document.getElementById('root-playing-card').style.overflowY = 'scroll'
    } else {
        document.getElementById('users-cards').setAttribute('class', 'hand')
        document.getElementById('root-playing-card').style.overflowY = 'visible'

    }
}

function fanCards(){
    if(document.getElementById('root-playing-card').getAttribute('class').match(/rotateHand/)){
        document.getElementById('root-playing-card').classList.remove('rotateHand')

    } else {
        document.getElementById('root-playing-card').classList.add('rotateHand')
        if(document.getElementById('users-cards').getAttribute('class')=== 'table'){
            document.getElementById('users-cards').classList.remove('table')
            document.getElementById('users-cards').classList.add('hand')
        }
    }
}