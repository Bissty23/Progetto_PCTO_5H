import React from "react";
import Ordinazione from "../../Componenti/Ordinazione"
import Axios from "axios";

class Account extends React.Component {

    state = {ok: false, errore: null}

    render () {
        return (


            <div className="Container">
                {this.prenotazione}
                <button onClick={() => {localStorage.clear(); window.location.href = "/"} } type="button" className="btn btn-dark md-4" >Esci dall'account</button>
            </div>


        )
    }
    componentDidMount () {
        if(!this.state.ok)
          Axios.get("http://" + window.location.hostname + ":8090/api/Prenotazioni/" + localStorage.getItem('username')).then((risposta) => {
            this.prenotazione = risposta.data[0].map((prenotazione) => <Ordinazione prenotazione={prenotazione} />)
            this.setState({ok : true})
          },
          (errore) => this.setState({errore : errore})
          )
      }

}

export default Account;