import React from 'react';
import $ from 'jquery'
import './Registra.css'
import Axios from 'axios';
import '../../cssCondivisi/Input-Form.css'
import Alert from '../../Componenti/Alert/Alert';
import CryptoJS from 'crypto-js';


var flag = false

class Registra extends React.Component{

  state = {errore: ''}

  render() {
    this.alert = React.createElement(() => <Alert messaggio={ { messaggio: this.state.errore, tipo: 'E' }}/>)
    return(

      <div className="container"> 
        {this.alert}
        
        <div className="container input-form"> 
          <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="Username" id="inUserName"/>   
          </div>

          <div className="input-group mb-3">
            <input type="text" class="form-control" placeholder="Email" id="inStaticEmail"/>
          </div>

          <div className="input-group mb-3">
            <input type="text" class="form-control" placeholder="Numero di telefono" id="inNumeroTelefono"/>
          </div>

          <div className="input-group mb-3">
            <input type="password" class="form-control" placeholder="Password" id="inPassword"/>
          </div>

          <div className="input-group mb-3">
            <input type="password" class="form-control" placeholder="Conferma password" id="inConfPassword"/>
          </div>

          <div className="col-sm mb-3 input-group">
            <select onClick={() => this.GetSedi()} class="form-select" id="sedi" aria-label="Default select example" placeholder='Plesso'>
              <option value="" selected disabled>--Sede--</option>
            </select>
          </div>

          <div className="input-group mb-3">
            <select onClick={() => this.GetClassi()} id="classi" class="form-select" aria-label="Default select example" placeholder='Plesso'>
              <option value="" selected disabled>--Classe--</option>
            </select>
          </div>

          <div class="col-sm mt-5">
            <button onClick={() => this.Postino()} type="button" class="btn btn-dark mt-4 md-4">Registrati</button>
          </div>
        </div>
      </div>
    )
  }

  GetSedi = () => {
    if(!this.sedi)
      Axios.get("http://" + window.location.hostname + ":8090/api/Sedi").then(
        (risposta) => {
          risposta.data.forEach(sede => { 
            $('#sedi').append("<option value=" + sede.Codice + ">" + sede.Nome + "</option>") 
          })
        },
        (errore) => { console.log(errore) }
      )
    this.sedi = true
  }


  GetClassi = () => { 
    if(!this.classi)
    {
      Axios.get("http://" + window.location.hostname + ":8090/api/Classi/"+ ($("#sedi option:selected").text()[0])).then(
        (risposta) => {
          risposta.data[0].forEach(Classe => { $('#classi').append("<option>" + Classe.Classe.toString().substring(0,2) + "</option>")  })
        },
        (errore) => { console.log(errore) }
      )
    }

  }
  
  Postino = () => 
  {
    
    if(($("#classi option:selected").text()).trim() == "--Classe--")
      {
        var ruolo = "A"
      }
      else{
        ruolo = "S"
      }
      if(!this.classi)
      {
        Axios.get("http://" + window.location.hostname + ":8090/api/Email/"+ruolo).then(
          (risposta) => {
            risposta.data[0].forEach(email => {
              if(!flag)
              {
                if($("#inStaticEmail").val().toLowerCase() == email.Email.trim().toLowerCase())
                  {
                    flag = true
                    console.log(email.Email.trim())
                    console.log($("#inStaticEmail").val())
                  }
              }
             })
            if(!flag)
            {
              this.Errore("Non è stato possibile creare il tuo account, se si è docenti o ATA selezionare solo il plesso, se si è studenti selezionare la classe oltre al plesso")
            }

            Axios.get("http://" + window.location.hostname + ":8090/api/Profili").then(
              (risposta) => {
                risposta.data.forEach(profili => { 
                  if(flag)
                  {
                    if($("#inUserName").val() == profili.Username)
                  {
                    this.Errore("Esiste già un account con questo username")
                    flag = false
                  }
                  if(($("#inStaticEmail").val()).toLowerCase() == (profili.Email).toLowerCase().trim())
                  {
                    this.Errore("Esiste già un account associato a questa email")
                    flag = false
                  }
                  if($("#inPassword").val() !== $("#inConfPassword").val())
                  {
                    this.Errore("Le due password non combaciano")
                    flag = false
                  }
                  if(isNaN($("#inNumeroTelefono").val()))
                  {
                    this.Errore("Il numero di telefono inserito non è valido")
                    flag = false
                  }
                  if(($("#inStaticEmail").val() || $("#inUserName").val() || $("#inPassword").val() || $("#inNumeroTelefono").val() || $("#inConfPassword").val()) === "")
                  {
                    this.Errore("Per poterti registrare devi compilare tutti i campi")
                    flag = false
                  }
                  }
                })
                if(flag)
                {
                  {
                    var payload = {
                      Username:$("#inUserName").val(),
                      Password:CryptoJS.SHA3($("#inPassword").val()).toString(),
                      NumeroDiTelefono:$("#inNumeroTelefono").val(),
                      Ruolo:ruolo,
                      Email:$("#inStaticEmail").val(),
                      Classe:($("#classi option:selected").text()).trim()
                    }
                    Axios.post("http://" + window.location.hostname + ":8090/api/Registra", payload)
                      .then(res => {
                          console.log(res);
                          console.log(res.data);
                      }
                    )
                    window.location.href="/"
                  }
                  console.log(payload);
                }
                $("#inUserName").val('')
                $("#inPassword").val('') 
                $("#inConfPassword").val('')
                $("#inNumeroTelefono").val('') 
                $("#inStaticEmail").val('') 
                $("#classi").empty()
                $("#sedi").empty()
                $('#sedi').append("<option>"+"--Sede--"+"</option>")
                $('#classi').append("<option>"+"--Classe--"+"</option>")

                this.sedi = false
                this.classi = false
              },
              (errore) => { console.log(errore) }
            )
          },
          (errore) => { console.log(errore,) }
        )
      }
    }

    Errore = (errore) => { 
      this.setState( {errore: errore} )
    }
}
 
export default Registra
