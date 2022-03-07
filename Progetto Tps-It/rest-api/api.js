var  Db = require('./dbcrud');
var  bodyParser = require('body-parser');
var  app = require('express');
var  router = require('express').Router;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(require('cors'));
app.use('/apiPCTO', router);

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

  
var  port = process.env.PORT || 8090;
app.listen(port);
console.log('Le API sono in ascolto sulla porta ' + port);