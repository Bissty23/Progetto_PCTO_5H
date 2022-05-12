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
  let f = new Date(x.getFullYear(),x.getMonth(),x.getDate(),x.getHours(),x.getMinutes(),x.getSeconds())

   let account = await GetAccount(Account)
   let prodotto = await GetProdotto(Prodotto)

   let oraRitiro = null
   let codIntervallo = 0

  // let oraCorrente = new Date().getHours()
  // let minutoCorrente = new Date().getMinutes()
  // let secondoCorrente = new Date().getSeconds()

  // if(account[0][0].Ruolo.trim() === "S") {

  //   let intervalli = await GetIntervalliOrari()

  //   intervalli[0].forEach(x => {

  //     if(oraRitiro === null){
  //         if(x.OraFinale > moment(f).add(10, 'm').toDate())
  //           oraRitiro = moment(f).add(10, 'm').toDate()
  //       codIntervallo = x.Codice
  //     }
  //   })
  // }
  // else
  //   oraRitiro = moment(f).add(10, 'm').toDate()


   oraRitiro = new Date(x.getFullYear(),x.getMonth(),x.getDate(),x.getHours(),x.getMinutes(),x.getSeconds())
   codIntervallo = null

  try{
    let connection = await sql.connect(config);
    var risultato = await connection.request()
    .input('DataOraRitiro', sql.DateTime, oraRitiro)
    .input('Sede', sql.Int, Sede)
    .input('IntervalloOrario', sql.Int, codIntervallo)
    .input('Note', sql.Int, null)
    .query("INSERT INTO [dbo].[Ritiro] ([DataOraRitiro], [Sede], [IntervalloOrario], [Note]) VALUES (@DataOraRitiro, @Sede, @IntervalloOrario, @Note)");

    let f = new Date(x.getFullYear(),x.getMonth(),x.getDate(),x.getHours(),x.getMinutes(),x.getSeconds())

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

async function GetPrenotazioni(username) {
  try {
    let pool = await sql.connect(config);
    let prenotazioni = await pool.request().input('username', sql.NChar, username).query("SELECT * FROM Prenotazione JOIN Effettua ON Prenotazione.Codice = Effettua.Prenotazione JOIN Prodotto ON Effettua.Prodotto = Prodotto.Codice WHERE Account = @username");
    console.log(username)
    return prenotazioni.recordsets;
  }
  catch (error) { console.log(error) }
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