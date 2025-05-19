CREATE DATABASE logpose;
USE logpose;

CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY auto_increment,
    nome VARCHAR(45),
    email VARCHAR(100),
    senha VARCHAR(80)
);

CREATE TABLE quiz(
	idQuiz INT PRIMARY KEY auto_increment,
	titulo VARCHAR(150)
);

CREATE TABLE pergunta(
	idPergunta INT auto_increment,
    frasePergunta VARCHAR(200),
    numeroPergunta INT,
    fkQuiz INT,
    CONSTRAINT pkComposta 
		PRIMARY KEY (idPergunta, fkQuiz),
    CONSTRAINT fkPerguntaQuiz 
		FOREIGN KEY (fkQuiz) REFERENCES quiz(idQuiz)
);

CREATE TABLE resposta(
	idResposta INT auto_increment,
    fkUsuario INT,
    fkPergunta INT,
    resposta VARCHAR(45),
    CONSTRAINT pkComposta 
		PRIMARY KEY(idResposta, fkUsuario, fkPergunta),
	CONSTRAINT fkUsuario 
		FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
	CONSTRAINT fkPergunta
		FOREIGN KEY (fkPergunta) REFERENCES pergunta(idPergunta)
);

CREATE TABLE alternativa(
	idAlternativa INT PRIMARY KEY auto_increment,
    numeroAlternativa INT,
    fkResposta INT,
    CONSTRAINT fkRespostaAlternativa 
		FOREIGN KEY (fkResposta) REFERENCES resposta(idResposta)
);

INSERT usuario(nome, email, senha) VALUES
	('Emanuelle', 'emanuelle@gmail.com', 'manu123ABC.');
    
INSERT quiz(titulo) VALUES
	('Qual personagem da tripulação do Chapéu de palha você seria?');
    
INSERT pergunta(frasePergunta, numeroPergunta, fkQuiz) VALUES
	('Você é mais introvertido, extrovertido ou ambivertido?', 1, 1);



   