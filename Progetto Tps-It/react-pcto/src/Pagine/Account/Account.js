import React from "react";

class Account extends React.Component {
    render () {
        return (
                <button onClick={() => {localStorage.clear(); window.location.href = "/"} } type="button" className="btn btn-dark md-4" >Esci dall'account</button>
            

        
        )
    }
    
}

export default Account;