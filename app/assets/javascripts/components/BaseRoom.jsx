import React from 'react';
import '../../stylesheets/rooms.scss';
import ActionsPanel from "./ActionsPanel";
import BottomCenterPanel from "./BottomCenterPanel";
import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import '../../stylesheets/application.css';
import CentralPiles from "./CentralPiles";

export default class BaseRoom extends React.Component {
    render() {
        return (
            <div className="base-room">
                <div className="left-panel">
                    Other Players Cards
                </div>
                <div className="center-panel">
                    <div className="top-center-panel">
                        Other Players Cards
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