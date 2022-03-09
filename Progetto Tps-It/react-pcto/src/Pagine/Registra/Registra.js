import React from 'react'
 
class Registra extends React.Component{
 
  render(){
    return(
      <div classname="container">
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1"/>   
        </div>


        <div class="mb-3 row">
          <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" placeholder="email@example.com" id="staticEmail"/>
          </div>
        </div>
        <div class="mb-3 row">
          <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="inputPassword"/>
          </div>
        </div>

        <div class="col-sm mb-3">
        <select class="form-select" aria-label="Default select example" placeholder='Plesso'>
        <option value="" selected disabled>--Sede--</option>
          <option value="1">Pascal</option>
          <option value="2">Comandini</option>
        </select>
        </div>

        <div class="mb-3 row">
          <label for="staticEmail" class="col-sm-2 col-form-label">Classe</label>
          <div class="col-sm-10">
          <select class="form-select" aria-label="Default select example" placeholder='Plesso'>
          <option value="" selected disabled>--Classe--</option>
          </select>
          </div>
        </div>



        



      </div>
    )
  }
}
 
export default Registra








