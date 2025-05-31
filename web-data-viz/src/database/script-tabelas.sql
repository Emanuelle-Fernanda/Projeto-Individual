-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

USE logpose;



CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(255)
);

CREATE TABLE quiz(
	idQuiz INT PRIMARY KEY auto_increment,
    dataQuiz DATETIME DEFAULT current_timestamp
);


CREATE TABLE resultado(
	idResultado INT auto_increment,
	idUsuario INT,
	idQuiz INT,
	nomePersonagem VARCHAR(100),
	CONSTRAINT pkAssociativa
		PRIMARY KEY (idResultado, idUsuario, idQuiz),
	CONSTRAINT fkComposta
		FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario),
		FOREIGN KEY (idQuiz) REFERENCES quiz(idQuiz)
);


