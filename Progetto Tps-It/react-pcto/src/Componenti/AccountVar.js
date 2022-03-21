import React from 'react'
import { Link } from 'react-router-dom';

class AccountVar extends React.Component {

    render() { 

        if(this.props.datiAccount.Accesso) return <li className="navbar-nav"><Link class="nav-link breadcrumb-item active" aria-current="page" to="/Account">{this.props.datiAccount.Email}</Link></li>
        else
            return (  
                <ul className="navbar-nav">
                    <li className="nav-item"><Link className="nav-link active" aria-current="page" to="/Accedi">Accedi</Link></li>
                    <li className="nav-item"><Link className="nav-link active" aria-current="page" to="/Registrazione">Registrati</Link></li>
                </ul>
            )
    }
}
 
export default AccountVar;