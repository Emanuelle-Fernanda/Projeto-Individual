-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/
CREATE DATABASE logpose;
USE logpose;


CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(255)
);

CREATE TABLE quiz(
	idQuiz INT PRIMARY KEY auto_increment,
    titulo VARCHAR(40)
);

CREATE TABLE personagem(
	idPersonagem INT PRIMARY KEY auto_increment,
    nomePersonagem VARCHAR(45),
    descricao VARCHAR(200),
    caracteristicaForte VARCHAR(100)
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

CREATE TABLE alternativa (
    idAlternativa INT PRIMARY KEY AUTO_INCREMENT,
    fkPergunta INT,
    letra CHAR(1),
    texto TEXT,
    fkPersonagem INT,
	CONSTRAINT fkPguntaAlternativa 
		FOREIGN KEY (fkPergunta) REFERENCES pergunta(idPergunta),
	CONSTRAINT fkPersonagemAlternativa
		FOREIGN KEY (fkPersonagem) REFERENCES personagem(idPersonagem)
);

CREATE TABLE resposta (
	idUsuario INT,
	idPergunta INT,
	fkAlternativa INT,
	CONSTRAINT pkAssociativa
		PRIMARY KEY (idUsuario, idPergunta),
	CONSTRAINT fkComposta
		FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario),
		FOREIGN KEY (idPergunta) REFERENCES pergunta(idPergunta),
		FOREIGN KEY (fkAlternativa) REFERENCES alternativa(idAlternativa)
);



SELECT * FROM usuario;


INSERT usuario(nome, email, senha) VALUES
	('Emanuelle', 'emanuelle@gmail.com', 'manu123ABC.');
    
INSERT INTO quiz (titulo) VALUES 
	('Quiz One Piece');

INSERT INTO pergunta (frasePergunta, numeroPergunta, fkQuiz) VALUES
	('Qual desses lugares você mais curtiria viver?', 1, 1),
	('Qual seu papel ideal em uma equipe?', 2, 1),
	('Escolha um lema de vida:', 3, 1),
	('Se tivesse uma Akuma no Mi, qual tipo escolheria?', 4, 1),
	('O que você valoriza mais?', 5, 1),
	('Em uma missão difícil, qual sua maior força?', 6, 1),
	('Se você fosse um pirata, qual seria sua recompensa?', 7, 1),
	('Como você age quando alguém te provoca?', 8, 1),
	('O que mais te irrita nas pessoas?', 9, 1),
	('Quando você conhece alguém novo, você…', 10, 1);


INSERT INTO personagem (nomePersonagem, descricao, caracteristicaForte) VALUES
	('Luffy', 'Capitão dos Chapéus de Palha, sonhador e forte', 'Determinação'),
	('Robin', 'Arqueóloga inteligente e misteriosa', 'Conhecimento'),
    ('Zoro', 'Espadachim feroz e leal', 'Coragem'),
	('Chopper', 'Médico fofo e dedicado', 'Carisma'),
	('Sanji', 'Cozinheiro habilidoso e galanteador', 'Criatividade');



-- Pergunta 1
INSERT INTO alternativa (fkPergunta, letra, texto, fkPersonagem) VALUES
	(1, 'A', 'Um navio cheio de amigos', 1),
	(1, 'B', 'Uma biblioteca gigante', 2),
	(1, 'C', 'Um castelo misterioso', 3),
	(1, 'D', 'Um laboratório tecnológico', 4),
	(1, 'E', 'Um bar cheio de música', 5);

-- Pergunta 2
INSERT INTO  alternativa (fkPergunta, letra, texto, fkPersonagem) VALUES
	(2, 'A', 'Líder',1),
	(2, 'B', 'Estrategista', 2),
	(2, 'C', 'Guerreiro(a)', 3),
	(2, 'D', 'Médico(a)', 4),
	(2, 'E', 'Navegador(a)', 5);

-- Pergunta 3
INSERT INTO  alternativa (fkPergunta, letra, texto, fkPersonagem) VALUES
(3, 'A', 'Eu nunca vou desistir dos meus sonhos', 1),
(3, 'B', 'A lógica sempre vence', 2),
(3, 'C', 'Proteger quem eu amo vem antes de tudo', 3),
(3, 'D', 'A vida é uma festa, vamos curtir!', 4),
(3, 'E', 'Silencio também é força', 5);

-- Pergunta 4
INSERT INTO alternativa (fkPergunta, letra, texto, fkPersonagem)VALUES
(4, 'A', 'Paramecia', 1),
(4, 'B', 'Zoan (transformação tipo Chopper)', 2),
(4, 'C', 'Logia (elementos tipo Ace ou Enel)',3),
(4, 'D', 'Nenhuma, prefiro confiar nas minhas mãos', 4),
(4, 'E', 'Não sei... queria ser imprevisível', 5);

-- Pergunta 5
INSERT INTO alternativa (fkPergunta, letra, texto, fkPersonagem) VALUES
(5, 'A', 'Liberdade', 1),
(5, 'B', 'Conhecimento', 2),
(5, 'C', 'Amizade', 3),
(5, 'D', 'Justiça', 4),
(5, 'E', 'Diversão', 5);

-- Pergunta 6
INSERT INTO alternativa (fkPergunta, letra, texto, fkPersonagem) VALUES
(6, 'A', 'Determinação', 1),
(6, 'B', 'Inteligência', 2),
(6, 'C', 'Carisma', 3),
(6, 'D', 'Coragem',4),
(6, 'E', 'Criatividade', 5);

-- Pergunta 7
INSERT INTO alternativa (fkPergunta, letra, texto, fkPersonagem) VALUES
(7, 'A', '1 bilhão — sou temido(a)', 1),
(7, 'B', '500 milhões — respeitado(a) mas na moral',2),
(7, 'C', '200 milhões — sou firmeza, mas discreto(a)', 3),
(7, 'D', '100 mil — sou novo(a) ainda, calma lá', 4),
(7, 'E', 'Recompensa NEGATIVA — me amam em todo lugar', 5);

-- Pergunta 8
INSERT INTO alternativa (fkPergunta, letra, texto, fkPersonagem) VALUES
(8, 'A', 'Pulo na briga sem pensar', 1),
(8, 'B', 'Rio e sigo minha vida', 2),
(8, 'C', 'Reclamo, dramatizo, mas é porque me importo com a situação', 3),
(8, 'D', 'Tento resolver na conversa, com calma e argumentos',4),
(8, 'E', 'Finjo que não me importo, mas aquilo me corrói por dentro', 5);

-- Pergunta 9
INSERT INTO alternativa (fkPergunta, letra, texto, fkPersonagem) VALUES
(9, 'A', 'Covardia — fugir quando a coisa aperta', 1),
(9, 'B', 'Falsidade — fala uma coisa, faz outra',2),
(9, 'C', 'Falta de lógica — agir sem pensar', 3),
(9, 'D', 'Falta de respeito — desconsiderar os outros', 4),
(9, 'E', 'Me ignorarem — como se eu não existisse', 5);

-- Pergunta 10
INSERT INTO alternativa (fkPergunta, letra, texto, fkPersonagem) VALUES
(10, 'A', 'Já fala tudo sobre mim, sem filtro', 1),
(10, 'B', 'Fico de olho e só me abro se confiar', 2),
(10, 'C', 'analiso a pessoa antes de me envolver', 3),
(10, 'D', 'Fico meio travado, mas tento ser simpático', 4),
(10, 'E', 'Tento deixar a pessoa confortável', 5);


INSERT INTO resposta (idUsuario, idPergunta, fkAlternativa) VALUES
(1, 1, 1),
(1, 2, 6),
(1, 3, 11),
(1, 4, 16),
(1, 5, 21),
(1, 6, 26),
(1, 7, 31),
(1, 8, 36),
(1, 9, 41),
(1, 10, 46);
SELECT * FROM usuario;

SELECT 
  u.idUsuario,
  u.nome AS nomeUsuario,
  q.idQuiz,
  p.idPergunta,
  p.frasePergunta,
  a.letra,
  a.texto AS textoAlternativa,
  per.nomePersonagem
FROM resposta r
JOIN usuario u ON r.idUsuario = u.idUsuario
JOIN pergunta p ON r.idPergunta = p.idPergunta
JOIN alternativa a ON r.fkAlternativa = a.idAlternativa
JOIN personagem per ON a.fkPersonagem = per.idPersonagem
JOIN quiz q ON p.fkQuiz = q.idQuiz
ORDER BY u.idUsuario, p.numeroPergunta;

-- Exibindo o nome do personagem e o nome do usuario onde o usuario é 1
SELECT distinct u.nome,
	p.nomePersonagem
FROM usuario u
JOIN resposta r ON  u.idUsuario = r.idUsuario
JOIN alternativa a ON r.fkAlternativa = a.idAlternativa
JOIN personagem p ON a.fkPersonagem = p.idPersonagem
WHERE u.idUsuario = 1;


SELECT * FROM resposta;
SELECT * FROM quiz;