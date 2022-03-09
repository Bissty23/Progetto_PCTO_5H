import React from 'react'

class Accedi extends React.Component {

    render() {
        return(
            <input onClick={() => this.account('BlueBerryPie')} type="button" className="btn btn-dark" value="accedi"/>
        );
    }

    account = (username) => {
        fetch("http://localhost:8090/api/Account/" + username).then(res => res.json()).then(
        (result) => {
            console.log(result);
            this.setState({
                Accesso: true,
                Username: result.Username,
                Password: result.Password,
                Email: result.Email });   

            window.location.href = '/';
        },
        (error) => { console.log(error); })
    } 
}
 
export default Accedi;