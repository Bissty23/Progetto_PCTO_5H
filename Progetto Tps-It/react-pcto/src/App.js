import React from 'react'
import Registra from './Pagine/Registra/Registra'
import Errore from './Pagine/Errore/Errore'
import './App.css'
 
import { BrowserRouter, Routes, Route, Link} from 'react-router-dom'
 
class App extends React.Component{
 
  render(){
    return(
      <div className="App">
        <div className="mx-5 mt-4">
          <BrowserRouter>
          <nav class="navbar navbar-light">
              <div class="container-fluid">
                <a class="navbar-brand" href="#">
                  <img src="./Public/Icon.ico" alt="" width="30" height="24" class="d-inline-block align-text-top"/>
                 Nome Bar
                </a>
            
              <ul id="NAVBAR" class="nav bg-light justify-content-end">
                <li class="nav-item">
                  <Link className="navbar-brand" to="/Registrazione">Registrati</Link>
                </li>
                <li class="nav-item">
                  <Link id="ciao" className="navbar-brand" to="/Register">Accedi</Link>
                </li>
              </ul>
              </div>
          </nav>
          <br/>

            { <Routes>
              <Route path="/Registrazione" element={<Registra />} />
              <Route path="*" element={<Errore />} />
            </Routes> }
          </BrowserRouter>
        </div>
      </div>
    )
  }
}
 
export default App
