import React from 'react'
import Axios from 'axios';
import $ from 'jquery'
import CryptoJS from 'crypto-js';
import './Accedi.css'

class Accedi extends React.Component {

  render() {

    return(
      <div className="container mt-4">
        
        <div class="alert alert-danger" role="alert">
          <a id="errore"/>
          <button onClick={() => ($('.alert').hide())} type="button" class="btn-close"></button>
        </div>    

        <div className="input-group mb-3">
          <input onKeyPress={ (event) => {if (event.key === 'Enter') $("#InPassword").focus()} } type="text" className="form-control" placeholder="Username o Email" id="InUsername"/>   
        </div>
        <div className="input-group mb-3">
          <input onKeyPress={ (event) => {if (event.key === 'Enter') this.GetAccount()} } type="password" className="form-control" placeholder="password" id="InPassword"/>   
        </div>
        
        <input onClick={() => this.GetAccount()} type="button" id="btnAccedi" className="btn btn-dark" value="Accedi"/>
      </div>
    );
  }

  GetAccount = () =>{ 
    let username = $('#InUsername').val()
    let password = $('#InPassword').val()

    $('.alert').hide()
    $('#btnAccedi').prop('disabled', true)

    if(username != ''){
      Axios.get("http://localhost:8090/api/Account/" + username).then(
        (risposta) =>{
          if(risposta.data[0] != undefined)
            if(password != '')
              if(CryptoJS.SHA3(password) == risposta.data[0].Password){
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

  Errore = (errore) => {
    $('#errore').html(errore + ' ')
    $('#InPassword').val('')
    $('.alert').show()
    $('#btnAccedi').prop('disabled', false)
  }
}

export default Accedi;