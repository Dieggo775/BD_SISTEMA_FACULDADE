CREATE DATABASE sistema_faculdade_2024;

USE sistema_faculdade_2024;

show tables;

CREATE TABLE tbl_endereco (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  logradouro VARCHAR(100),
  numero VARCHAR(20),
  complemento VARCHAR(50),
  bairro VARCHAR(50),
  cidade VARCHAR(50),
  estado VARCHAR(20),
  cep VARCHAR(20)
);

CREATE TABLE tbl_aluno (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(20) UNIQUE,
  data_nascimento DATE,
  endereco_id INT,
  curso_id INT,
  matricula_id INT,
  FOREIGN KEY (endereco_id) REFERENCES tbl_endereco(id),
  FOREIGN KEY (curso_id) REFERENCES tbl_curso(id),
  FOREIGN KEY (matricula_id) REFERENCES tbl_matricula(id)
);

CREATE TABLE tbl_curso (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  modelo TEXT,
  carga_horaria INT,
  valor DECIMAL(10,2)
);

CREATE TABLE tbl_professor (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(20) UNIQUE,
  telefone VARCHAR(20),
  email VARCHAR(100),
  endereco_id INT,
  curso_id INT,
  FOREIGN KEY (endereco_id) REFERENCES tbl_endereco(id),
  FOREIGN KEY (curso_id) REFERENCES tbl_curso(id)
);

CREATE TABLE tbl_matricula (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  aluno_id INT,
  curso_id INT,
  data_matricula DATE,
  FOREIGN KEY (aluno_id) REFERENCES tbl_aluno(id),
  FOREIGN KEY (curso_id) REFERENCES tbl_curso(id)
);

CREATE TABLE tbl_notas (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  matricula_id INT,
  nota1 DECIMAL(4,2),
  nota2 DECIMAL(4,2),
  nota3 DECIMAL(4,2),
  nota4 DECIMAL(4, 2),
  nota_final DECIMAL(4,2),
  curso_id INT,
  FOREIGN KEY (matricula_id) REFERENCES tbl_matricula(id),
  FOREIGN KEY (curso_id) REFERENCES tbl_curso(id)
);

insert into tbl_endereco (logradouro, numero, complemento, bairro, cidade, estado, cep) values ('Travessa do Beco', '10', 'Casa', 'Mococa', 'Sao Paulo', 'São Paulo', '09812-202');
insert into tbl_aluno (nome, cpf, data_nascimento, endereco_id, curso_id, matricula_id) values ('Richard O Brian', '547.238.0988/98', '2010-11-14', 4);
insert into tbl_curso (nome, modelo, carga_horaria, valor) values ('Design', 'Tecnologo', '750', '190.00');
insert into tbl_professor(nome, cpf, telefone, email, endereco_id, curso_id) values ('Bruce Banner', '123.654.789/04', '11-99997-8808', 'golias_esmaga@gmail.com', 8, 4);
insert into tbl_matricula (aluno_id, curso_id, data_matricula) values ('7', '4', '2024-01-02');
insert into tbl_notas (matricula_id, nota1, nota2, nota3, nota4, nota_final, curso_id) values (1, '5.00', '7.00', '8.00', '8.00', '7.00', '1');

show tables;

select * from tbl_endereco;
select * from tbl_aluno;
select * from tbl_curso;
select * from tbl_professor;
select * from tbl_matricula;
select * from tbl_notas;

select tbl_matricula.aluno_id as Matricula, tbl_aluno.nome as Nome, tbl_aluno.cpf as CPF,
		tbl_curso.nome as Curso, tbl_curso.descricao as Descricao,
		tbl_matricula.id as Matricula_ID
	from tbl_aluno
		inner join tbl_matricula
			on tbl_matricula.aluno_id = tbl_aluno.id
		inner join tbl_curso
			on tbl_matricula.curso_id = tbl_curso.id
#where tbl_aluno.id = 1  -- Filtra por aluno com id = 1
order by tbl_aluno.nome;

#update tbl_ENDERECO set bairro = 'Jardim Umarizal' where id = 1;
#update tbl_aluno set curso_id = '4' where id = 7;
#update tbl_notas set matricula_id = '3' where id = 3;