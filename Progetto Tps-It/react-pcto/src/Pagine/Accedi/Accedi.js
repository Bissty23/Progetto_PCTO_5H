import React from 'react'
import Axios from 'axios';
import $ from 'jquery'
import CryptoJS from 'crypto-js';
import './Accedi.css'
import Alert from '../../Componenti/Alert/Alert';

class Accedi extends React.Component {

  state = {errore: ''}

  render() {

    this.alert = React.createElement(() => <Alert errore={this.state.errore}/>)

    return(
      <div className="container"> 
        {this.alert}
        <div className="container input-form">  
          
          <div className="input-group mb-3">
            <input onKeyPress={ (event) => {if (event.key === 'Enter') $("#InPassword").focus()} } type="text" className="form-control" placeholder="Username o Email" id="InUsername"/>   
          </div>
          <div className="input-group mb-3">
            <input onKeyPress={ (event) => {if (event.key === 'Enter') this.GetAccount()} } type="password" className="form-control" placeholder="password" id="InPassword"/>   
          </div>
          
          <input onClick={() => this.GetAccount()} type="button" id="btnAccedi" className="btn btn-dark" value="Accedi"/>
        </div>
      </div>
    );
  }

  GetAccount = () =>{ 
    this.setState({errore: ''})
    let username = $('#InUsername').val()
    let password = $('#InPassword').val()

    $('#btnAccedi').prop('disabled', true)

    if(username !== ''){
      Axios.get("http://localhost:8090/api/Account/" + username).then(
        (risposta) =>{
          if(risposta.data[0] !== undefined)
            if(password !== '')
              if(CryptoJS.SHA3(password).toString() === risposta.data[0].Password.toString()){
                localStorage.setItem('accesso', true)
                localStorage.setItem('username', risposta.data[0].Username)
                localStorage.setItem('password', risposta.data[0].Password)
                localStorage.setItem('numeroditelefono', risposta.data[0].NumeroDiTelefono)
                localStorage.setItem('ruolo', risposta.data[0].Ruolo)
                localStorage.setItem('email', risposta.data[0].Email)
                localStorage.setItem('Sede', risposta.data[0].Sede)

                window.location.href = '/'; 
              }
              else this.Errore("Errore: Password errata")
            else this.Errore("Errore: Inserire la Password")
          else this.Errore("Errore: Username o Email inserite sono incorrette")
        },
        (errore) =>{ 
          if(errore.toString().includes("Network Error")) this.Errore("Errore: Connessione al DataBase non riuscita")
          else this.Errore(errore.toString())
        }
      )
    } else this.Errore("Errore: Inserire Username o Email")     
  }

  Errore = (errore) =>{ 
    this.setState({errore: errore})
    $('#btnAccedi').prop('disabled', false)
  }
}

export default Accedi;