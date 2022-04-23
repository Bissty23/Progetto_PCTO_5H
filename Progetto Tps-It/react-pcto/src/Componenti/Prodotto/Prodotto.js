import React from "react"
import './Prodotto.css'

class Prodotto extends React.Component {
    constructor(props) {
        super(props);
        this.state = {  }
    }

    render() { 
        const nomeProdotto = this.props.prodotto
        const logo = (nomeProdotto != undefined) ? require('../../img/Prodotti/' + nomeProdotto + '.png') : undefined

        
        return (
            <div className="container" id="contenitore">
                <img src={logo} className="img-fluid" alt={this.props.imgsrc} />

                <p id='Titolo'>
                    {nomeProdotto}
                </p>
            </div>
        );
    }
}
export default Prodotto;
