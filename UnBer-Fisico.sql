CREATE DATABASE IF NOT EXISTS UNBER;
USE UNBER;

CREATE TABLE PESSOA (
	nome VARCHAR(100) NOT NULL,
	senha VARCHAR(16) NOT NULL,
	nota NUMERIC(3,1) NOT NULL,
	idPessoa INTEGER NOT NULL AUTO_INCREMENT,
	CONSTRAINT PESSOA_PK PRIMARY KEY (idPessoa)
) ENGINE = innoDB;

CREATE TABLE PEDIDO (
	assunto VARCHAR(200) NOT NULL,
	recompensa VARCHAR(100),
	disciplina VARCHAR(100) NOT NULL,
	dataHoraInicio DATETIME NOT NULL,
	dataHoraFim DATETIME NOT NULL,
	idPedido INTEGER NOT NULL AUTO_INCREMENT,
	idPessoa INTEGER NOT NULL,
	local VARCHAR(200) NOT NULL,
	CONSTRAINT PEDIDO_PK PRIMARY KEY (idPedido),
	CONSTRAINT PEDIDO_PESSOA_FK FOREIGN KEY(idPessoa) REFERENCES PESSOA (idPessoa)
) ENGINE = innoDB;

CREATE TABLE AULA (
	idAula INTEGER NOT NULL AUTO_INCREMENT,
	idPedido INTEGER NOT NULL,
	dataHoraInicio DATETIME NOT NULL,
	dataHoraFim DATETIME NOT NULL,
	notaProfessor NUMERIC(3,1) NOT NULL,
	notaAluno NUMERIC(3,1) NOT NULL,
	CONSTRAINT AULA_PK PRIMARY KEY (idAula),
	CONSTRAINT AULA_PEDIDO_FK FOREIGN KEY(idPedido) REFERENCES PEDIDO (idPedido)
) ENGINE = innoDB;

CREATE TABLE PESSOA_AULA (
	tipoPessoa VARCHAR(10),
	idPessoa INTEGER,
	idAula INTEGER,
	CONSTRAINT PESSOA_AULA_PESSOA_FK FOREIGN KEY(idPessoa) REFERENCES PESSOA (idPessoa),
	CONSTRAINT PESSOA_AULA_AULA_FK FOREIGN KEY(idAula) REFERENCES AULA (idAula)
) ENGINE = innoDB;
