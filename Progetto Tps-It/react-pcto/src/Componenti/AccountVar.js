import React from 'react'
import { Link } from 'react-router-dom';

class AccountVar extends React.Component {

    render() { 

        if(this.props.account)
            return (  
                <a>piede</a>
            );
        else
            return (  
                <ul class="navbar-nav">
                    <li class="nav-item"><Link class="nav-link active" aria-current="page" to="/">Accedi</Link></li>
                    <li class="nav-item"><Link class="nav-link active" aria-current="page" to="/Registrazione">Registrati</Link></li>
                </ul>
            );
    }
}

//<Link className="nav-link active" aria-current="page" to="/">Active</Link>
 
export default AccountVar;