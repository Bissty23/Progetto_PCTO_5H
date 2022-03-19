import React from 'react'
import $ from 'jquery'

class RegistraSec extends React.Component{
 
    render(){
      
      return(
        
        <div className="container mb-4">
        <div class="input-group mb-4">
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
        <select class="form-select" aria-label="Default select example" placeholder='Plesso'>
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
        </div>
        
      )
      
    }
  }
   
  export default RegistraSec
  
  
  
  