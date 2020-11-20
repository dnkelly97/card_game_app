import React from 'react';
import '../../stylesheets/rooms.scss';
import ActionsPanel from "./ActionsPanel";
import BottomCenterPanel from "./BottomCenterPanel";
import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import '../../stylesheets/application.css';
import CentralPiles from "./CentralPiles";
import BlankCard from "./BlankCard";
import {Button} from "react-bootstrap";

export default class BaseRoom extends React.Component {
    render() {
        return (
            <div className="base-room">
                <div className="left-panel">
                    <Button variant="outline-primary" className="blank-card">View Player 2's Hand</Button>
                    <Button variant="outline-primary" className="blank-card">View Player 3's Hand</Button>
                    <Button variant="outline-primary" className="blank-card">View Player 4's Hand</Button>
                    <Button variant="outline-primary" className="blank-card">View Player 5's Hand</Button>
                    <Button variant="outline-primary" className="blank-card">View Player 6's Hand</Button>
                    <Button variant="outline-primary" className="blank-card">View Player 7's Hand</Button>
                    <Button variant="outline-primary" className="blank-card">View Player 8's Hand</Button>
                </div>
                <div className="center-panel">
                    <div className="top-center-panel">
                        <h2>EXAMPLE: Interacting with players on the left column will show a more detailed view of their hands here</h2>
                    </div>
                    <div className="middle-center-panel">
                        <CentralPiles/>
                    </div>
                    <div className="bottom-center-panel">
                        <BottomCenterPanel/>
                    </div>
                </div>
                <div className="right-panel">
                    <ActionsPanel/>
                </div>
            </div>
        );
    }
}