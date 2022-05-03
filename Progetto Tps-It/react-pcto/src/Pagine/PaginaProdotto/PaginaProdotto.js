import React from "react"
import { useParams, Link } from "react-router-dom"
import Axios from 'axios'
import "./PaginaProdotto.css"

class X extends React.Component {

    state = { prodotto : null, ok : false }

    render(){ 
        var img; 

        try {
            img = require('../../img/Prodotti/' + this.props.x + '.png') 
        }
        catch {
            console.log('immagine non trovata');
        }
        
        if(this.state.ok)
            return( 
                <div className="contaner float-start">
                    <p id='titolo'>{this.state.prodotto}</p>
                    <img src={img} id='img1' className="img-fluid" alt={this.state.prodotto} />
                </div> 
            )
        else return <div> Questo Prodotto Non è stato Trovato 
                <br/>
                <Link to='/Prodotti' className="btn btn-dark md-4"> Torna indietro</Link>
            </div> 
    }

    componentDidMount () {
        Axios.get("http://localhost:8090/api/Prodotto/" + this.props.x).then(
            (risposta) => this.setState({prodotto : risposta.data[0].Nome, ok : true})
        )
    }
}

function PaginaProdotti() { return <X x={useParams().prodotto}/> }
 
export default PaginaProdotti;