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

// router.route('/<cosa>').<funzione>((request, response) => {
//   Db.<Metodo>().then((data) => {
//     response.json(data[0]);
//   })
// })

// router.route('/elencofilm/:id').get((request, response) => {
//   Db.getFilm(request.params.id).then((data) => {
//     response.json(data[0]);
//   })
// })

//(ctrl + k) + (ctrl + c) per commentare la parte selezionata 
//(ctrl + k) + (ctrl + u) per decommentare la parte selezionata 

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

router.route('/Classi/:codicesede').get((request, response) => { 
  Db.GetClassi(request.params.codicesede).then((data) => { 
    response.json(data[0]); 
  }) 
})

router.route('/Prodotti').get((request, response) => { 
  Db.GetProdotti().then((data) => { 
    response.json(data[0]); 
  }) 
})

router.route('/Prodotto/:nome').get((request, response) => {
  Db.GetProdotto(request.params.nome).then((data) => { 
    response.json(data[0]); 
  }) 
})

var  port = process.env.PORT || 8090;
app.listen(port);
console.log('Le API sono in ascolto sulla porta ' + port);