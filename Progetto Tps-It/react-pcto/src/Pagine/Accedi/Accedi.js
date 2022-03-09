import React from 'react'
import Axios from 'axios';
import $ from 'jquery'

class Accedi extends React.Component {

    render() {
        return(
            <input onClick={() => this.account('BlueBerryPie')} type="button" className="btn btn-dark" value="accedi"/>
        );
    }

    account = (username) =>{
        Axios.get("http://localhost:8090/api/Account/" + username).then(
          (risposta) =>{
            console.log(risposta.data[0])

            localStorage.setItem('accesso', true)
            localStorage.setItem('username', risposta.data[0].Username)
            localStorage.setItem('password', risposta.data[0].Password)
            localStorage.setItem('numeroditelefono', risposta.data[0].Username)
            localStorage.setItem('ruolo', risposta.data[0].Ruolo)
            localStorage.setItem('email', risposta.data[0].Email)
            localStorage.setItem('Sede', risposta.data[0].Sede)

            window.location.href = '/';
          },
        (error) =>{ alert('Errore: Connessione non riuscita')})
    }
}
 
export default Accedi;