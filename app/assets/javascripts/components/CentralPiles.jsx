import React from "react";
import BlankCard from "./BlankCard";
import Card from "react-playing-card"
import {Button} from "react-bootstrap";

export default class CentralPiles extends React.Component{
    constructor(props) {
        super(props);
        // this._render_hand = this._render_hand.bind(this);
    }


    render() {
        return(
            <React.Fragment>
                <div className="draw-discard">
                    <Button variant="outline-primary" className="blank-card">Draw</Button>
                    <Button variant="outline-primary" className="blank-card">Discard</Button>
                </div>
                <div className="piles">
                    <div className="piles-top">
                        <Button variant="outline-primary" className="blank-card">+</Button>
                        <Button variant="outline-primary" className="blank-card">+</Button>
                        <Button variant="outline-primary" className="blank-card">+</Button>
                        <Button variant="outline-primary" className="blank-card">+</Button>
                        <Button variant="outline-primary" className="blank-card">+</Button>
                    </div>
                    <div className="piles-bottom">
                        <Button variant="outline-primary" className="blank-card">+</Button>
                        <Button variant="outline-primary" className="blank-card">+</Button>
                        <Button variant="outline-primary" className="blank-card">+</Button>
                        <Button variant="outline-primary" className="blank-card">+</Button>
                        <Button variant="outline-primary" className="blank-card">+</Button>
                    </div>
                </div>

            </React.Fragment>
        )
    }
}