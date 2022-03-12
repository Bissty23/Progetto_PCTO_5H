import React from 'react'
import Axios from 'axios';
import $ from 'jquery'
import CryptoJS from 'crypto-js';
import './Accedi.css'

class Accedi extends React.Component {

  render() {
    
      return(
        <div className="container mt-4">
          <div class="alert alert-danger" role="alert" id="c">
            A simple warning alert—check it out!
            <button onClick={() => ($('.alert').hide())} type="button" class="btn-close" aria-label="Close"></button>
          </div>

          <div className="input-group mb-3">
            <input type="text" className="form-control" placeholder="Username o Email" id="InUsername"/>   
          </div>
          <div className="input-group mb-3">
            <input type="password" className="form-control" placeholder="password" id="InPassword"/>   
          </div>
          
          <input onClick={() => this.GetAccount($('#InUsername').val(), $('#InPassword').val())} type="button" id="btnAccedi" className="btn btn-dark" value="Accedi"/>
        </div>
      );
  }

  GetAccount = (username, password) =>{ 
    $('#btnAccedi').prop('disabled', true);

    CryptoJS.SHA3(password)

    Axios.get("http://localhost:8090/api/Account/" + username).then(
      (risposta) =>{

        localStorage.setItem('accesso', true)
        localStorage.setItem('username', risposta.data[0].Username)
        localStorage.setItem('password', risposta.data[0].Password)
        localStorage.setItem('numeroditelefono', risposta.data[0].Username)
        localStorage.setItem('ruolo', risposta.data[0].Ruolo)
        localStorage.setItem('email', risposta.data[0].Email)
        localStorage.setItem('Sede', risposta.data[0].Sede)

        window.location.href = '/';
      },
      (error) =>{ 
        $('.alert').show()
        $('#btnAccedi').prop('disabled', false)
      })
  }


  Controlli = () =>{

  }
    
}
 
export default Accedi;