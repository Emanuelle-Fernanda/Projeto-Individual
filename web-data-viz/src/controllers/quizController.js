var quizModel = require("../models/quizModel");

function guardar(req, res) {
    var idUsuario = req.body.idUsuario;
    var personagem = req.body.personagem;

    quizModel.registrarQuiz()
        .then(function(resultadoQuiz){
            var idQuiz = resultadoQuiz.insertId

            quizModel.guardar(idUsuario, idQuiz, personagem)
                .then(function (resposta) {
                    res.json(resposta);
                })
                .catch(function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao salvar! erro:", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                });
        })

    
}

module.exports = {
    guardar
};
