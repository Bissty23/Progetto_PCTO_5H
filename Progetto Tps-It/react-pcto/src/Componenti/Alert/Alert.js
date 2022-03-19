import React from 'react'
import $ from 'jquery'

class Alert extends React.Component {

    render() {
        if(this.props.errore !== '')
            return (
                <div className="container alert alert-danger" role="alert">
                    <a>{this.props.errore}</a>
                    <button onClick={() => ($('.alert').hide())} type="button" className="btn-close"/>
                </div>  
            )
        else return null
    }
}

export default Alert;