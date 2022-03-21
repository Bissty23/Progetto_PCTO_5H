import React from 'react'
import $ from 'jquery'
import './Alert.css'

class Alert extends React.Component {

    render() {
        if(this.props.errore !== '')
            return (
                <div className="container alert alert-danger" role="alert">
                    {this.props.errore}
                    <button onClick={() => ($('.alert').hide())} type="button" className="btn-close"/>
                </div>  
            )
        else return null
    }
}

export default Alert;