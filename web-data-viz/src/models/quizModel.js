var database = require("../database/config");


function guardar(idUsuario, idQuiz, personagem) {
    console.log("ACESSEI O quizModel.js para guardar as respostas!");
    
    // Mapeia cada alternativa e monta uma query para cada
   
    const instrucaoSql = `INSERT INTO resultado (idUsuario, idQuiz, nomePersonagem) 
        VALUES (${idUsuario}, ${idQuiz}, '${personagem}');`;

    console.log("Executando instruções SQL: \n" + instrucaoSql);
    
    return database.executar(instrucaoSql);
}

function registrarQuiz() {
    console.log("ACESSEI O quizModel.js para guardar as respostas!");
    
    // Mapeia cada alternativa e monta uma query para cada
   
    const instrucaoSql = `INSERT INTO quiz (idQuiz, dataQuiz) 
        VALUES (default, now());`;

    console.log("Executando instruções SQL: \n" + instrucaoSql);
    
    return database.executar(instrucaoSql);
}

module.exports = {
    guardar,
    registrarQuiz
};
