import React from 'react';
import Button from 'react-bootstrap/Button';


export default class ActionsPanel extends React.Component {
    render() {
        return (
            <React.Fragment>
                <Button className="action-button" variant="outline-dark">Draw</Button>
                <Button className="action-button" variant="outline-dark">Transfer</Button>
                <Button className="action-button" variant="outline-dark">Reset Deck</Button>
                <Button className="action-button" variant="outline-dark">Show Hand</Button>
                <Button className="action-button" variant="outline-danger">Reset Game</Button>
                <Button className="action-button" variant="outline-danger">Quit Game</Button>

            </React.Fragment>
        );
    }
}