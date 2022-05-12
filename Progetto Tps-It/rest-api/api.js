var  Db = require('./dbcrud.js');
var  express = require('express');
var  bodyParser = require('body-parser');
var  cors = require('cors');
var  app = express();
var  router = express.Router();

app.use(bodyParser.urlencoded({ extended:  true }));
app.use(bodyParser.json());
app.use(cors());
app.use('/api', router);

router.use((request, response, next) => {
  console.log('Server in funzione...');
  next();
});

router.route('/Account/:username').get((request, response) => { 
  Db.GetAccount(request.params.username).then((data) => { 
    response.json(data[0]); 
  }) 
})

router.route('/Sedi').get((request, response) => { 
  Db.GetSedi().then((data) => { 
    response.json(data[0]); 
  }) 
})

router.route('/Classi/:letteraSede').get((request, response) => { 
  Db.GetClassi(request.params.letteraSede).then((data) => { 
    response.json(data); 
  }) 
})

router.route('/Prodotti').get((request, response) => { 
  Db.GetProdotti().then((data) => { 
    response.json(data[0]); 
  }) 
})

router.route('/Prodotto/:nome').get((request, response) => {
  Db.GetProdotto(request.params.nome).then((data) => { 
    response.json(data[0][0]); 
  }) 
})

router.route('/Profili').get((request, response) => { 
  Db.GetProfili().then((data) => { 
    response.json(data[0]); 
  }) 
})

router.route('/Email/:ruolo').get((request, response) => { 
  Db.GetEmail(request.params.ruolo).then((data) => { 
    response.json(data); 
  }) 
})

router.route('/Classi/:letteraSede').get((request, response) => { 
  Db.GetClassi(request.params.letteraSede).then((data) => { 
    response.json(data); 
  }) 
})

router.route('/Registra').post((req, res)=>{
  let {Username,Password,NumeroDiTelefono,Ruolo,Email,Classe} = req.body;
    Db.Registrazione(Username,Password,NumeroDiTelefono,Ruolo,Email,Classe,(error, result)=>{
      if(error)
        res.status(500).send({error:error});
      else
        res.status(200).send({success:true ,result});
    });
})

router.route('/Prenota').post((req, res)=>{
  let {Account,Prodotto} = req.body;
    Db.Prenotazione(Account,Prodotto, 2, (error, result)=>{
      if(error)
        res.status(500).send({error:error});
      else
        res.status(200).send({success:true ,result});
    });
})

var  port = process.env.PORT || 8090;
app.listen(port);
console.log('Le API sono in ascolto sulla porta ' + port);