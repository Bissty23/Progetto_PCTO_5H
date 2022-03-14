import React from 'react'
import $ from 'jquery'
import './Registra.css'
import { Link } from 'react-router-dom';
import Axios from 'axios';
 
class Registra extends React.Component{
 
  render(){
    
    return(
      <div className="container">
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Username" id="inUserName"/>   
        </div>
        <div className="input-group mb-3">
          <input type="text" class="form-control" placeholder="Email" id="inStaticEmail"/>
        </div>
        <div className="input-group mb-3">
          <input type="password" class="form-control" placeholder="Password" id="inPassword"/>
        </div>
        <div className="input-group mb-3">
          <input type="password" class="form-control" placeholder="Conferma password" id="inConfPassword"/>
        </div>

        <div className="col-sm mb-3 input-group">
        <select class="form-select" id="sedi" aria-label="Default select example" placeholder='Plesso'>
        <option value="" selected disabled>--Sede--</option>
          <option value="1">Pascal</option>
          <option value="2">Comandini</option>
        </select>
        </div>

        <div className="input-group mb-3">
          <select class="form-select" aria-label="Default select example" placeholder='Plesso'>
          <option value="" selected disabled>--Classe--</option>
          </select>
        </div>

        <div class="col-sm mt-5">
          <button onClick={() => this.validaPass($('#inPassword').val(), $('#inConfPassword').val())} type="submit" class="btn btn-dark mt-4 md-4">Registrati</button>
        </div>
        <div  >
          <Link  aria-current="page" id='linkReg' to="/RegistrazioneSec">Non sei uno studente?</Link>  
        </div>
      </div>
    )
    
  }
  
  validaPass = (password, ConfPassword) =>{
      if(password != ConfPassword)
      {
        alert("Errore, le due password sono sbagliate")
      }
  }

  x = () =>{

    Axios.get("http://localhost:8090/api/Sedi").then(
      (risposta) =>{
        risposta.forEach(sede => {
          $('#sedi').append("<option value=" + sede.Codice + ">" + sede.Nome + "/option>")
        });

      },
      (errore) =>{ 
        if(errore.toString().includes("Network Error")) this.Errore("Errore: Connessione al DataBase non riuscita")
        else this.Errore(errore.toString())
      }
    )
  }
}
 
export default Registra








