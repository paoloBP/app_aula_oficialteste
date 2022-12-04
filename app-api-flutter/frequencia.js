module.exports = (app) => {
   var array = [
      {'id':'1', 'nome':'Jaqson', "idade": "30", "sexo": "masculino"},
      {'id':'2', 'nome':'Fulana', "idade": "28", "sexo": "femenino"}
   ];

   app.get('/frequencia', (req, res) => {
      res.json(array);
   });

   app.post('/frequencia', (req, res, next) => {
      if (req.body.id === null){
         req.body.id = (array.length+1).toString();
      }
      array.push(req.body);
      res.json({success: "Incluído"});
   });
 
   app.put('/frequencia', (req, res) => {
      for (i = 0; i < array.length; i++) {
         if (array[i].id === req.body.id){
            array[i] = req.body;
            return res.json({success: "Alterado com sucesso."});
         }
      };
      return res.json({aviso: "Nada alterado."});
   });

   app.delete('/frequencia/:id', (req, res) => {
      for (i = 0; i < array.length; i++) {
         if (array[i].id === req.params.id){
            array.splice(i, 1);
            return res.json({success: "Excluído com sucesso."});
         }
      };
      return res.json({aviso: "Nada excluído."});
   }); 

   app.get('/frequencia/:id', (req, res) => {
      for (i = 0; i < array.length; i++) {
         if (array[i].id === req.params.id){
            return res.json(array[i]);
         }
      };
      return res.json({aviso: "Não encontrado."});
   });


 }