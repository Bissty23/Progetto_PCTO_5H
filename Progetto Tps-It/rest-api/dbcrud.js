var  config = require('./dbconfig');
const  sql = require('mssql');

async  function  GetAccount(username) {
  try {
    let pool = await sql.connect(config);
    let account = await pool.request().input('username', sql.NChar, username).query("SELECT * FROM Account WHERE Username = @username");
    return account.recordsets;
  }
  catch (error) {console.log(error) }
}

async function GetSedi() {

  console.log(await GetProdotti());

  try {
    let pool = await sql.connect(config);
    let sedi = await pool.request().query("SELECT * FROM Sede");
    return sedi.recordsets;
  }
  catch (error) { console.log(error) }
}

async function GetClassi(letteraSede) {
  try {
    let pool = await sql.connect(config);
    let classi = await pool.request()
    .query("SELECT DISTINCT Classe FROM ListaUtentiScolastici WHERE (Classe LIKE '%-"+ letteraSede +"') ORDER BY(Classe)");                                                                                
    return classi.recordsets;
  }
  catch (error) {console.log(error) }
}

async function GetProdotti() {
  try {
    let pool = await sql.connect(config);
    let prodotti = await pool.request().query("SELECT * FROM Prodotto");
    return prodotti.recordsets;
  }
  catch (error) { console.log(error) }
}

async function GetProdotto(Prodotto) {
  try {
    let pool = await sql.connect(config);
    let prodotto = await pool.request().input('prodotto', sql.NChar, Prodotto).query("SELECT * FROM Prodotto WHERE Nome = @prodotto");
    return prodotto.recordsets;
  }
  catch (error) { console.log(error) }
}

async function GetEmail(ruolo) {
  try {
    let pool = await sql.connect(config);
    let sedi = await pool.request().query("SELECT Email FROM ListaUtentiScolastici WHERE (Tipo LIKE '"+ ruolo +"') ");
    return sedi.recordsets;
  }
  catch (error) { console.log(error) }
}

async function GetProfili() {
  try {
    let pool = await sql.connect(config);
    let sedi = await pool.request().query("SELECT Username, Email FROM Account");
    return sedi.recordsets;
  }
  catch (error) { console.log(error) }
}

async function Registrazione(Username, Password, NumeroDiTelefono, Ruolo, Email, Classe, callback = () => {}){
  try{
      let query = 'INSERT INTO [dbo].[Account] ([Username], [Password], [NumeroDiTelefono], [Ruolo], [Email], [Classe]) VALUES (@Username, @Password, @NumeroDiTelefono, @Ruolo, @Email, @Classe)';
      let connection = await sql.connect(config);
      var risultato = await connection.request()
      .input('Username', sql.VarChar, Username)
      .input('Password', sql.VarChar, Password)
      .input('NumeroDiTelefono', sql.Numeric, NumeroDiTelefono)
      .input('Ruolo', sql.VarChar, Ruolo)
      .input('Email', sql.VarChar, Email)
      .input('Classe', sql.VarChar, Classe)
      .query(query);
    return callback(null)
  }
  catch (error) {return callback(error)}
}

async function Prenotazione(Account, Prodotto, Sede, callback = () => {}){

  let x = new Date()

   let account = await GetAccount(Account)
   let prodotto = await GetProdotto(Prodotto)

  // let oraRitiro = null
  // let codIntervallo = 0

  // let oraCorrente = new Date().getHours()
  // let minutoCorrente = new Date().getMinutes()
  // let secondoCorrente = new Date().getSeconds()

  // if(account[0][0].Ruolo.trim() === "S") {

  //   let intervalli = await GetIntervalliOrari()

  //   intervalli[0].forEach(x => {

  //     if(oraRitiro === null){
  //       let flag = false

  //       let oraFine = parseInt(x.OraFine.toString().substring(16,18))
  //       let oraInizio = parseInt(x.OraInizio.toString().substring(16,18))
  //       let minutoFine = parseInt(x.OraFine.toString().substring(19,21))
  //       let minutoInizio = parseInt(x.OraInizio.toString().substring(19,21))

  //       if (oraFine > oraCorrente)
  //         if(minutoFine <= minutoCorrente)
  //           flag = true
  //         else flag = false
  //       else if (oraFine === oraCorrente)
  //             if (minutoFine <= minutoCorrente + 10)
  //               flag = true
  //             else flag = false
  //       else flag = false

  //       if(flag === true)
  //         if(oraInizio >= oraCorrente && minutoFine >= minutoCorrente)
  //           if(minutoCorrente + 10 >= 60)
  //             oraRitiro = (oraCorrente + 1 )+ ":" + ( minutoCorrente - 50 ) + ":" + secondoCorrente
  //           else
  //             oraRitiro = oraCorrente + ":" + ( minutoCorrente + 10 ) + ":" + secondoCorrente
  //         else  if (minutoCorrente - 10 < 0)
  //                 if(oraCorrente - 1 === oraInizio)
  //                   if((minutoInizio + 50) - minutoCorrente < 0)
  //                     if(minutoCorrente + 10 >= 60)
  //                       oraRitiro = (oraCorrente + 1 ) + ":" + ( minutoCorrente - 50 ) + ":" + secondoCorrente
  //                     else
  //                       oraRitiro = oraCorrente + ":" + ( minutoCorrente + 10 ) + ":" + secondoCorrente
  //                   else
  //                     oraRitiro = oraInizio + ":" + minutoInizio + ":" + ":00"
  //                 else if (oraCorrente - 1 < oraInizio)
  //                   oraRitiro = oraInizio + ":" + minutoInizio + ":" + ":00"

  //       codIntervallo = x.Codice
  //     }
  //   })
  // }
  // else  if(minutoCorrente + 10 >= 60)
  //         oraRitiro = (oraCorrente + 1 )+ ":" + (minutoCorrente - 50)+ ":" + ":00"
  //       else
  //         oraRitiro = oraCorrente + ":" + (minutoCorrente + 10) + ":" + ":00"


  let oraRitiro = new Date(x.getFullYear(),x.getMonth(),x.getDate(),x.getHours(),x.getMinutes(),x.getSeconds())
  let codIntervallo = 1

  try{
    let connection = await sql.connect(config);
    var risultato = await connection.request()
    .input('DataOraRitiro', sql.DateTime, oraRitiro)
    .input('Sede', sql.Int, Sede)
    .input('IntervalloOrario', sql.Int, codIntervallo)
    .input('Note', sql.Int, null)
    .query("INSERT INTO [dbo].[Ritiro] ([DataOraRitiro], [Sede], [IntervalloOrario], [Note]) VALUES (@DataOraRitiro, @Sede, @IntervalloOrario, @Note)");

    let f =  new Date(x.getFullYear(),x.getMonth(),x.getDate(),x.getHours(),x.getMinutes(),x.getSeconds())

    try{
      risultato = await connection.request()
      .input('DataOraInvio', sql.DateTime, f)
      .input('Stato', sql.NChar, 'Attivo')
      .input('Account', sql.NChar, Account)
      .input('SedeRitiro', sql.Int, Sede)
      .input('DTORitiro', sql.DateTime, oraRitiro)
      .query("INSERT INTO [dbo].[Prenotazione] ([DataOraInvio], [Stato], [Account], [SedeRitiro], [DTORitiro]) VALUES (@DataOraInvio, @Stato, @Account, @SedeRitiro, @DTORitiro)");

      let x = await GetUltimaPrenotazione(Account)

      try{
        risultato = await connection.request()
        .input('Prenotazione', sql.Int, x[0][0].Codice)
        .input('Prodotto', sql.Int, prodotto[0][0].Codice)
        .query('INSERT INTO [dbo].[Effettua] ([Prenotazione], [Prodotto]) VALUES (@Prenotazione, @Prodotto)');

         return callback(null)
      }
      catch (error) { return callback('x') }
    }
    catch (error) { return callback(error) }
  }
  catch (error) { return callback('z') }
  
}

async function GetUltimaPrenotazione(Account){
  try {
    let pool = await sql.connect(config);
    let prenotazione = await pool.request().input('Account', sql.NChar, Account).query("SELECT * FROM Prenotazione WHERE Account = @Account ORDER BY Codice DESC");
    return prenotazione.recordsets;
  }
  catch (error) { console.log(error) }
}

async function GetIntervalliOrari(){
  try {
    let pool = await sql.connect(config);
    let intervalli = await pool.request().query("SELECT * FROM IntervalliOrari ORDER BY OraFine");
    return intervalli.recordsets;
  }
  catch (error) { console.log(error) }
}

module.exports = {
  GetAccount: GetAccount,
  GetSedi: GetSedi,
  GetClassi: GetClassi,
  GetProdotti: GetProdotti,
  GetProdotto: GetProdotto,
  GetProfili: GetProfili,
  GetEmail: GetEmail,
  Registrazione: Registrazione,
  Prenotazione: Prenotazione,
}