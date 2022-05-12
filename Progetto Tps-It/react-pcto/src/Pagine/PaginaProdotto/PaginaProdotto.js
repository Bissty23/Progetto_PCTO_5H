import React from "react"
import { useParams, Link } from "react-router-dom"
import Axios from 'axios'
import "./PaginaProdotto.css"
import Alert from '../../Componenti/Alert/Alert'

class X extends React.Component {

    state = { prodotto : null, ok: false, messaggio: '', tipo: '', link: '' }

    render(){ 
        var img; 

        try {
            img = require('../../img/Prodotti/' + this.props.x + '.png') 
        }
        catch {
            console.log('immagine non trovata');
        }

        this.alert = React.createElement(() => <Alert messaggio={ { messaggio: this.state.messaggio, tipo: this.state.tipo }} link={ this.state.link }/>)
        
        if(this.state.ok) 
            return( 
                <div className="contaner float-start">
                    <p id='titolo' className="float-start mb-4" style={ {paddingLeft: "22px"} }>{this.state.prodotto.Nome}</p>
                    <div className="container row"> 
                        <div className="col">
                            <img src={img} id='img1' className="img-fluid" alt={this.state.prodotto.Nome} />
                        </div>
                        <div className="col" >
                            <div className="container">
                                <p style={ {fontSize: 30} }>Descrizione</p>
                                <p style={ {fontSize: 18} } className="float-start">{this.state.prodotto.Descrizione}</p>
                            </div>
                        </div>
                    </div>
                    <div className="container mb-5">
                        <p style={ {fontSize: 30} } className="float-start mt-4">Prezzo: € {this.state.prodotto.Prezzo}0</p>
                        <a  class="btn btn-dark" role="button" onClick={ () => this.Ordina() }>ORDINA</a>
                    </div>
                    {this.alert}
                </div> 
            )
        else return <div> Questo Prodotto Non è stato Trovato 
                <br/>
                <Link to='/Prodotti' className="btn btn-dark md-4"> Torna indietro</Link>
            </div> 
    }

    componentDidMount () {
        Axios.get("http://" + window.location.hostname + ":8090/api/Prodotto/" + this.props.x).then(
            (risposta) => { if(risposta.data !== "") this.setState({prodotto : risposta.data, ok : true}) }
        )
    }

    Ordina = () => {

        const Account = {
            Accesso: localStorage.getItem('accesso'),
            Username: localStorage.getItem('username'),
            Password: localStorage.getItem('password'),
            NumeroDiTelefono: localStorage.getItem('numeroditelefono'),
            Ruolo: localStorage.getItem('ruolo'),
            Email: localStorage.getItem('email'),
            Sede: localStorage.getItem('Sede'),
        }

        if(Account.Accesso){
            this.Alert(true, "ciao", 'Account')
        }
        else this.Alert(false, "Devi fare l'accesso prima di poter fare un ordine", 'Accedi')
    }

    Alert = (ok, msg, link) => { 
        if(ok)
            this.setState( {messaggio: msg, tipo: 'S', link: link } )
        else
            this.setState( {messaggio: msg, tipo: 'E', link: link } )
      }
}

function PaginaProdotti() { return <X x={useParams().prodotto}/> }
 
export default PaginaProdotti;