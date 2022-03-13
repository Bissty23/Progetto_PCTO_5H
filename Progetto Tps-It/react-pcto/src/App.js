import React from 'react'
import Registra from './Pagine/Registra/Registra'
import RegistraSec from './Pagine/Registra/RegistraSec'
import Errore from './Pagine/Errore/Errore'
import AccountVar from './Componenti/AccountVar'
import Logo from './img/icona.png'
import './App.css'
import { BrowserRouter, Routes, Route, Link} from 'react-router-dom'
import Accedi from './Pagine/Accedi/Accedi'
import Account from './Pagine/Account/Accout'
 
class App extends React.Component{


 state =  {
  Accesso: localStorage.getItem('accesso'),
  Username: localStorage.getItem('username'),
  Password: localStorage.getItem('password'),
  NumeroDiTelefono: localStorage.getItem('numeroditelefono'),
  Ruolo: localStorage.getItem('ruolo'),
  Email: localStorage.getItem('email'),
  Sede: localStorage.getItem('Sede'),
}

  // AggiornaSato = (event) => {
  //   event.preventDefault();
  //   this.setState({Accesso: true, Username: event.target}) 
  // }
 
  render(){

    console.log(this.state)

    return(
      <div className="App">
        <div className="mx-5">
          <BrowserRouter>
            <nav className="navbar navbar-expand-md navbar-light">
              <div className="container-fluid">
                <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                  <span className="navbar-toggler-icon"></span>
                </button>
                <div className="collapse navbar-collapse" id="navbarTogglerDemo01">
                <Link className="navbar-brand" to="/">
                  <img src={Logo} alt="Logo" width="50" height="44" className="d-inline-block align-text-top"/>
                  <a>Bissty+Lory ♥ 4ever</a>
                </Link>
                  <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                    <li className="nav-item">
                    <a className="nav-link" href="#">Link</a>
                    </li>
                    <li className="nav-item">
                      <a className="nav-link" href="#">Link</a>
                    </li>
                    <li className="nav-item">
                      <a className="nav-link disabled">Disabled</a>
                    </li>
                  </ul>
                  {/* <form className="d-flex">
                    <input className="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
                    <button className="btn btn-outline-dark" type="submit">Search</button>
                  </form> */}
                </div>
              </div>  
              <AccountVar datiAccount={ {Accesso: this.state.Accesso, 
                                        Username: this.state.Username, 
                                        Email: this.state.Email} }/>
            </nav>
            <br/>
            <Routes>
              <Route path="/"/>
              <Route path="/Accedi" element={<Accedi />} />
              <Route path="/Registrazione" element={<Registra />} />
              <Route path="/RegistrazioneSec" element={<RegistraSec/>} />
              <Route path="/Account" element={<Account/>} />
              <Route path="*" element={<Errore />} />
            </Routes> 
          </BrowserRouter>
        </div>
      </div>
    )
  }
}
 
export default App
