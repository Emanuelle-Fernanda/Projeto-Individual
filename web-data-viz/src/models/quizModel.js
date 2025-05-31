var database = require("../database/config");


function guardar(idUsuario, fkAlternativa) {
    console.log("ACESSEI O quizModel.js para guardar as respostas!");
    
    // Mapeia cada alternativa e monta uma query para cada
   
    const instrucaoSql = `INSERT INTO resposta (idUsuario, fkAlternativa) 
        VALUES (${idUsuario}, ${fkAlternativa});`;

    console.log("Executando instruções SQL: \n" + instrucaoSql);
    
    return database.executar(instrucaoSql);
}

module.exports = {
    guardar
};
