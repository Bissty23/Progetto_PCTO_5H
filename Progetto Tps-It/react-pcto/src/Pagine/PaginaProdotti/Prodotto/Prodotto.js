import React from "react"
import './Prodotto.css'
import { Link } from 'react-router-dom'

class Prodotto extends React.Component {

    render() { 
        const nomeProdotto = this.props.prodotto.Nome.trim()
        var logo; 

        try {
            logo = require('../../../img/Prodotti/' + nomeProdotto + '.png') 
        }
        catch {
            console.log('immagine non trovata');
        }

        return (
            <div className="container" id="contenitore">
                <Link id='link' to={ window.location.pathname + '/' + nomeProdotto } >
                    <img src={logo} id='img' className="img-fluid" alt={nomeProdotto + 'png'} />
                    <p id="titolo"> {nomeProdotto} </p>
                    <p id="descrizione" className="float-start"> { this.props.prodotto.Descrizione } </p>
                </Link>
            </div>
        )    
    }    
}

export default Prodotto;
