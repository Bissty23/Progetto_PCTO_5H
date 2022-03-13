import React from 'react'
import { Link } from 'react-router-dom';

class AccountVar extends React.Component {

    render() { 

        if(this.props.datiAccount.Accesso)
            return (  
                <ul class="navbar-nav">
                    <li class="nav-item"><Link class="nav-link breadcrumb-item active" aria-current="page" to="/Account">{this.props.datiAccount.Email}</Link></li>
                </ul>
            );
        else
            return (  
                <ul class="navbar-nav">
                    <li class="nav-item"><Link class="nav-link active" aria-current="page" to="/Accedi">Accedi</Link></li>
                    <li class="nav-item"><Link class="nav-link active" aria-current="page" to="/Registrazione">Registrati</Link></li>
                </ul>
            );
    }
}
 
export default AccountVar;