import React from 'react';
import '../../stylesheets/rooms.scss';
import ActionsPanel from "./ActionsPanel";
import BottomCenterPanel from "./BottomCenterPanel";
import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import '../../stylesheets/application.css';

export default class BaseRoom extends React.Component {
    render() {
        return (
            // <Container className="base-room" fluid>
            //     <Row s={2} md={3}>
            //         <Col >
            //             LP
            //         </Col>
            //         <Col >
            //             <Row>
            //               TC
            //             </Row>
            //             <Row xs={6}>
            //                 MC
            //             </Row>
            //             <Row>
            //                 <BottomCenterPanel/>
            //             </Row>
            //         </Col>
            //         <Col>
            //             <ActionsPanel/>
            //         </Col>
            //     </Row>
            // </Container>
            <div className="base-room">
                <div className="left-panel">
                    LP
                </div>
                <div className="center-panel">
                    <div className="top-center-panel">
                        TC
                    </div>
                    <div className="middle-center-panel">
                        MC
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