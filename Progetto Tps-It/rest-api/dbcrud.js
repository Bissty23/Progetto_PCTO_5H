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
      .input('NumeroDiTelefono', sql.Int, NumeroDiTelefono)
      .input('Ruolo', sql.VarChar, Ruolo)
      .input('Email', sql.VarChar, Email)
      .input('Classe', sql.VarChar, Classe)
      .query(query);
    return callback(null)
  }
  catch (error) {return callback(error)}
}

async function Prenotazione(Codice, DataOraInvio, Stato, Account, SedeRitiro, DTORitiro, callback = () => {}){
  try{
      let query = 'INSERT INTO [dbo].[Prenotazione] ([Codice], [DataOraInvio], [Stato], [Account], [SedeRitiro], [DTORitiro]) VALUES (@Codice, @DataOraInvio, @Stato, @Account, @SedeRitiro, @DTORitiro)';
      let connection = await sql.connect(config);
      var risultato = await connection.request()
      .input('Codice', sql.Int, Codice)
      .input('DataOraInvio', sql.DateTime, DataOraInvio)
      .input('Stato', sql.NChar, Stato)
      .input('Account', sql.NChar, Account)
      .input('SedeRitiro', sql.Int, SedeRitiro)
      .input('DTORitiro', sql.DateTime, DTORitiro)
      .query(query);
    return callback(null)
  }
  catch (error) { return callback(error) }
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