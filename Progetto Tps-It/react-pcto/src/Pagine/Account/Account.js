import React from "react";

class Account extends React.Component {
    render () {
        return (
        <div className="Container">
                <div className="modal-dialog">
                <div className="modal-content">
                    <div className="modal-header">
                    <h5 className="modal-title">Modal title</h5>
                    <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div className="modal-body">
                    <p>Buogniorno Fedelinchio</p>
                    </div>
                    <div className="modal-footer">
                    <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" className="btn btn-primary">Save changes</button>
                    </div>
                </div>
                </div>
                <button onClick={() => {localStorage.clear(); window.location.href = "/"} } type="button" className="btn btn-dark md-4" >Esci dall'account</button>
            </div>

        
        )
    }
    
}

export default Account;