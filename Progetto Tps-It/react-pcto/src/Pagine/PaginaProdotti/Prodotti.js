import Axios from "axios"
import React from "react"
import Prodotto from "./Prodotto/Prodotto"

class Prodotti extends React.Component {

    state = {ok : false}

    render () {
      var x ='dfjsh'
        return( 
          <div className="container">
            <div className="row justify-content-md-left"> 
              {this.prodotti} 
            </div>
          </div>        
        )
    }

    componentDidMount () {
      const prodotti = []

        if(!this.state.ok)
          Axios.get("http://localhost:8090/api/Prodotti").then((risposta) => {
            prodotti.length = 0
            risposta.data.forEach(prodotto => prodotti.push(prodotto));
            this.prodotti = prodotti.map((prodotto) => <Prodotto prodotto={prodotto} />)
            this.setState({ok : true})    
          })
    }
}

 
export default Prodotti;