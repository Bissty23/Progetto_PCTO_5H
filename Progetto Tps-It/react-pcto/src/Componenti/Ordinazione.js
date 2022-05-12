import React from "react";
import { Link } from 'react-router-dom';
import "./Ordinazione.css";

class Ordinazione extends React.Component {
    render () {

 
        return (
        <div className="Container">
                <div className="modal-dialog">
                <div className="modal-content" id="Contenitore">
                    <div className="modal-header">
                    <h5 className="modal-title" id="scritte">{this.props.prenotazione.Nome}</h5>
                    </div>
                    <div className="modal-body">
                    <p>{this.props.prenotazione.Descrizione}</p>
                    </div>
                    <div className="modal-footer">
                    <button type="button" className="btn btn-dark md-4">Cancella Ordine</button>
                    </div>
                </div>
                </div>
            </div>
        )
    }
}

export default Ordinazione;