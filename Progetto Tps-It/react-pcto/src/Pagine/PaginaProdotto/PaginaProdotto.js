import React from "react"
import { useParams, Link } from "react-router-dom"
import Axios from 'axios'

class X extends React.Component {
    constructor(props){
        super(props)
    }

    state = { prodotto : null, ok : false }

    render(){ 

        console.log(this.state.prodotto);

        if(this.state.ok)
            return <div>{this.props.x}</div> 
        else return <div> Questo Prodotto Non è stato Trovato 
            <br/>
            <Link to='/Prodotti' className="btn btn-dark md-4"> Torna indietro</Link>
        </div> 
    }

    componentDidMount () {
        Axios.get("http://localhost:8090/api/Prodotto/" + this.props.x).then((risposta) => {
            this.setState({prodotto : risposta.data, ok : true})    
        })
    }
}

function PaginaProdotti() {
    return <X x={useParams().prodotto}/>
}
 
export default PaginaProdotti;