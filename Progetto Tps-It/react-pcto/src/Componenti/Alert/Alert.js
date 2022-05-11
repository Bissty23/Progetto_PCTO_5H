import React from 'react'
import $ from 'jquery'
import './Alert.css'
import { Link } from 'react-router-dom'

class Alert extends React.Component {

    render() {

        let x 
        this.link = null
        
        if(this.props.messaggio.tipo === 'E' || this.props.messaggio.tipo === '' || this.props.messaggio.tipo === undefined) 
            x = "container alert alert-danger" 
        else if (this.props.messaggio.tipo === 'S') 
            x = "container alert alert-success" 
        
        if(this.props.link !== '' && this.props.link !== undefined)
            this.link = React.createElement(() => <Link to={'/' + this.props.link}> {this.props.link} </Link>)

        if(this.props.messaggio.messaggio !== '') return (
            <div className={x} role="alert">
                    {this.props.messaggio.messaggio}
                    {this.link}
                    <button onClick={() => ($('.alert').hide())} type="button" className="btn-close"/>
                </div>  
            )
        else return null
    }
}

export default Alert;