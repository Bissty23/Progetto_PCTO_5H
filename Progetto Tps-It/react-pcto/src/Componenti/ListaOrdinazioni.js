import React from "react";
import { Link } from 'react-router-dom';

class ListaOrdinazioni extends React.Component {
    render () {
        
        const ordinazione = this.props.prodotto.ordinazione.trim()
 
        return (
        <div className="Container">
                <div className="modal-dialog">
                <div className="modal-content">
                    <div className="modal-header">
                    <h5 className="modal-title">Modal title</h5>
                    <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div className="modal-body">
                    <p>Buongiorno Fedelinchio</p>
                    </div>
                    <div className="modal-footer">
                    <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" className="btn btn-primary">Save changes</button>
                    </div>
                </div>
                </div>

                <div className="container" id="contenitore">
                <Link id='link' to={ window.location.pathname + '/' + nomeProdotto } >
                    <p id="titolo"> {nomeProdotto} </p>
                    <p id="descrizione" className="float-start"> { this.props.prodotto.Descrizione } </p>
                </Link>
            </div>

            </div>
            

        
        )
    }
    
}

export default Account;