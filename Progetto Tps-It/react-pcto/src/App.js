import React from 'react'
import Registra from './Pagine/Registra/Registra'
import Errore from './Pagine/Errore/Errore'
import AccountVar from './Componenti/AccountVar'
import Logo from './img/icona.png'
import './App.css'
 
import { BrowserRouter, Routes, Route, Link} from 'react-router-dom'
 
class App extends React.Component{
  constructor(props) {
    super(props);

    this.state = {
      Accesso: false,
      Uername: "",
      Password: "",
    }
  }
 
  render(){

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
                    <a className="nav-link active" aria-current="page" href="#">Home</a>
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
            <AccountVar account={this.state.Accesso}/>
          </nav>
          <br/>

            { <Routes>
                <Route path="/" />
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
