var  config = require('./dbconfig');
const  sql = require('mssql');

// async  function  <Nome Metodo>() {
//   try {
//     let  pool = await  sql.connect(config);
//     let  <VAR> = await  pool.request().query("<Query>");
//     return  <VAR>.recordsets;
//   }
//   catch (error) { console.log(error); }
// }

// async  function  <Nome Metodo>(<Parametro>) {
//   try {
//     let  pool = await  sql.connect(config);
//     let  <VAR> = await  pool.request()
//     .input('<nome per parametro>', sql.Int, <Parametro>) // da fare per ogni parametro
//     .query("<Query> where <Parametro> = @<nome per parametro>");
//     return  <VAR>.recordsets;
//   }
//   catch (error) { console.log(error); }
// }

//(ctrl + k) + (ctrl + c) per commentare la parte selezionata 
//(ctrl + k) + (ctrl + u) per decommentare la parte selezionata 

async  function  GetAccount(username) {
  try {
    let  pool = await  sql.connect(config);
    let  account = await  pool.request().input('username', sql.NChar, username).query("SELECT * FROM Account WHERE Username = @username");
    return  account.recordsets;
  }
  catch (error) {console.log(error) }
}

async function GetSedi() {
  try {
    let  pool = await  sql.connect(config);
    let  sedi = await  pool.request().query("SELECT * FROM Sede");
    return  sedi.recordsets;
  }
  catch (error) { console.log(error); }
}

module.exports = {
  //<metodo>: <metodo>
  GetAccount: GetAccount,
  GetSedi: GetSedi,
}