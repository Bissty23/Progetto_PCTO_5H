import Axios from "axios"
import React from "react"
import Prodotto from "./Prodotto/Prodotto"
import Loading from "../../img/spongebob_loading.gif"

class Prodotti extends React.Component {

    state = {ok: false, errore: null}

    render () {
        if(this.state.ok) return( 
            <div className="container">
              <div className="row justify-content-md-left"> 
                {this.prodotti} 
              </div>
            </div>        
          )
        else return( 
            <div className="container">
              <img src={Loading} id='img' className="img-fluid" alt='Loading' style={ {height : '30%', width : '30%' } }/>
            </div>        
          )
    }

    componentDidMount () {
      if(!this.state.ok)
        Axios.get("http://" + window.location.hostname + ":8090/api/Prodotti").then((risposta) => {
          this.prodotti = risposta.data.map((prodotto) => <Prodotto prodotto={prodotto} />)
          this.setState({ok : true})
        },
        (errore) => this.setState({errore : errore})
        )
    }
}

export default Prodotti;