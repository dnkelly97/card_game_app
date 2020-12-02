import React from "react";
import BlankCard from "./BlankCard";
import Card from "react-playing-card"
import {Button} from "react-bootstrap";

export default class BottomCenterPanel extends React.Component{
    constructor(props) {
        super(props);
        this._render_hand = this._render_hand.bind(this);
    }

    _render_hand = function (cardList){
        const cards = cardList.map((card, idx) => {
            if(card === "BLANK"){
                return <BlankCard />
            } else {
                return <Card className="playing-card" rank = {card[0]} suit = {card[1]}/>
            }
        })

        return(<React.Fragment>{cards}</React.Fragment>)
    }

    render() {
        var cardList = ["AH", "2D", "3S", "BLANK", "8H"]
        return(
            <React.Fragment>
                {/*{this._render_hand(cardList)}*/}
                <Button variant="outline-primary" className="blank-card">+</Button>
                <Button variant="outline-primary" className="blank-card">+</Button>
                <Button variant="outline-primary" className="blank-card">+</Button>
                <Button variant="outline-primary" className="blank-card">+</Button>
                <Button variant="outline-primary" className="blank-card">+</Button>
            </React.Fragment>
        )
    }
}