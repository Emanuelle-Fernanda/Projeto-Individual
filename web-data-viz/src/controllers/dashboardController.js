var dashboardModel = require("../models/dashboardModel");

function dadosDash(req, res) {
    var idUsuario = req.body.idUsuarioServer;


    dashboardModel.dadosDash(idUsuario)
        .then(function (resposta) {
            res.json({
                dadosDash: resposta
            });
        })
        .catch(function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao salvar! erro:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
 
    
}

module.exports = {
    dadosDash
};
