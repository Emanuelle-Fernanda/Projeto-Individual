var quizModel = require("../models/quizModel");

function guardar(req, res) {
    var fkUsuario = req.body.fkUsuario;
    var fkAlternativa = req.body.fkAlternativa;

    console.log("fkUsuario:", fkUsuario);
    console.log("respostasSelecionadas:", fkAlternativa);
    
    if (!Array.isArray(fkAlternativa)) {
        fkAlternativa = [fkAlternativa];
    }

    quizModel.guardar(fkUsuario, fkAlternativa )
        .then(function (resposta) {
            res.json(resposta);
        })
        .catch(function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao salvar! erro:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    guardar
};
