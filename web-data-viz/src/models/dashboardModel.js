var database = require("../database/config");


function dadosDash(idUsuario) {
    console.log("ACESSEI O quizModel.js para guardar as respostas!");
       
    const instrucaoSql = `SELECT 
    (SELECT COUNT(DISTINCT idUsuario) FROM resultado) AS totalUsuariosResponderam,
    (SELECT COUNT(*) FROM resultado WHERE nomePersonagem = 'Luffy') AS Luffy,
    (SELECT COUNT(*) FROM resultado WHERE nomePersonagem = 'Zoro') AS Zoro,
    (SELECT COUNT(*) FROM resultado WHERE nomePersonagem = 'Robin') AS Robin,
    (SELECT COUNT(*) FROM resultado WHERE nomePersonagem = 'Sanji') AS Sanji,
    (SELECT COUNT(*) FROM resultado WHERE nomePersonagem = 'Chopper') AS Chopper,
    (SELECT nomePersonagem FROM resultado WHERE idUsuario = ${idUsuario} ORDER BY idResultado DESC LIMIT 1 ) AS personagemUsuario`;

    console.log("Executando instruções SQL: \n" + instrucaoSql);
    
    return database.executar(instrucaoSql);
}


module.exports = {
    dadosDash
};
