var database = require("../database/config");


function dadosDash(idUsuario) {
    console.log("ACESSEI O quizModel.js para guardar as respostas!");
    
    // Mapeia cada alternativa e monta uma query para cada
   
    const instrucaoSql = `SELECT 
  (SELECT COUNT(DISTINCT idUsuario) FROM resultado) AS totalUsuariosResponderam,
  (SELECT COUNT(*) FROM resultado WHERE nomePersonagem = 'Luffy') AS qtdLuffy,
  (SELECT COUNT(*) FROM resultado WHERE nomePersonagem = 'Zoro') AS qtdZoro,
  (SELECT COUNT(*) FROM resultado WHERE nomePersonagem = 'Robin') AS qtdRobin,
  (SELECT COUNT(*) FROM resultado WHERE nomePersonagem = 'Sanji') AS qtdSanji,
  (SELECT COUNT(*) FROM resultado WHERE nomePersonagem = 'Chopper') AS qtdChopper,
  (SELECT nomePersonagem FROM resultado WHERE idUsuario = ${idUsuario} ORDER BY idResultado DESC LIMIT 1 ) AS personagemUsuario1;
`;

    console.log("Executando instruções SQL: \n" + instrucaoSql);
    
    return database.executar(instrucaoSql);
}


module.exports = {
    dadosDash
};
