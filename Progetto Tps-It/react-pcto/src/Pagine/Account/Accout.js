import React from 'react'

class Account extends React.Component {

  render() {

    return(
        <button onClick={() => this.x()} type="button" class="btn btn-dark md-4" >Esci dall'account</button>
    );
    }

    x = () => {
        localStorage.clear()
        window.location.href = "/"
    }
}

export default Account;