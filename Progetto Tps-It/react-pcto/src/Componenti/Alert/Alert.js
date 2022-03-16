import React from 'react'
import $ from 'jquery'

class Alert extends React.Component {

    render() {
        return(
            <div class="alert alert-danger" role="alert">
                <a id="errore">{this.props.errore}</a>
                <button onClick={() => ($('.alert').hide())} type="button" class="btn-close"></button>
            </div>  
        );
    }
}

export default Alert;