import React from 'react'
import { Link } from 'react-router-dom';
import Img from './trasferimento.png'


class Errore extends React.Component {

    render() { 
        return ( 
            <div classname="container">
                <img classname="mt-4" alt="img 404" src={Img} />
                <br/>

                <div class="d-grid gap-1 d-sm-block">
                    <Link class="btn btn-dark mt-4 md-4" aria-current="page" to="/">Torna Alla HomePage</Link>  
                </div>
            </div>
        );
    }
}
 
export default Errore;