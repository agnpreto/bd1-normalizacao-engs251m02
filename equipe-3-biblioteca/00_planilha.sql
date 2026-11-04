-- Cenário 3: Biblioteca Saber
-- Rode este arquivo no MySQL para criar o banco e as planilhas originais.

DROP DATABASE IF EXISTS normalizacao_biblioteca;
CREATE DATABASE normalizacao_biblioteca CHARACTER SET utf8mb4;
USE normalizacao_biblioteca;

-- Cada linha é um livro de um empréstimo. Cada empréstimo é de um leitor; cada leitor é de um curso; cada livro é de uma editora.
CREATE TABLE planilha (
  cod_emprestimo INT,
  data_emprestimo DATE,
  matricula_leitor INT,
  nome_leitor VARCHAR(60),
  telefones VARCHAR(60),
  cod_curso CHAR(2),
  nome_curso VARCHAR(40),
  isbn VARCHAR(13),
  titulo VARCHAR(60),
  cod_editora CHAR(2),
  editora VARCHAR(30),
  data_devolucao DATE
);
INSERT INTO planilha (cod_emprestimo, data_emprestimo, matricula_leitor, nome_leitor, telefones, cod_curso, nome_curso, isbn, titulo, cod_editora, editora, data_devolucao) VALUES
  (9001, '2026-09-01', 2201, 'Pedro Costa', '(92) 98877-3331; (92) 99361-4583', 'C1', 'Engenharia de Software', '978-85-01', 'Banco de Dados', 'E1', 'Pearson', '2026-09-15'),
  (9001, '2026-09-01', 2201, 'Pedro Costa', '(92) 98877-3331; (92) 99361-4583', 'C1', 'Engenharia de Software', '978-85-02', 'Código Limpo', 'E2', 'Alta Books', '2026-09-15'),
  (9002, '2026-09-03', 2202, 'Lara Mendes', '(92) 98914-3442', 'C2', 'Direito', '978-85-03', 'Direito Civil', 'E3', 'Saraiva', '2026-09-17'),
  (9003, '2026-09-05', 2203, 'Iago Freitas', '(92) 98951-3553', 'C1', 'Engenharia de Software', '978-85-01', 'Banco de Dados', 'E1', 'Pearson', '2026-09-19'),
  (9003, '2026-09-05', 2203, 'Iago Freitas', '(92) 98951-3553', 'C1', 'Engenharia de Software', '978-85-05', 'Engenharia de Software', 'E2', 'Alta Books', '2026-09-19'),
  (9004, '2026-09-08', 2204, 'Nina Barros', '(92) 98988-3664; (92) 99484-4952', 'C3', 'Enfermagem', '978-85-04', 'Anatomia Humana', 'E1', 'Pearson', '2026-09-22'),
  (9005, '2026-09-10', 2201, 'Pedro Costa', '(92) 98877-3331; (92) 99361-4583', 'C1', 'Engenharia de Software', '978-85-05', 'Engenharia de Software', 'E2', 'Alta Books', '2026-09-24'),
  (9005, '2026-09-10', 2201, 'Pedro Costa', '(92) 98877-3331; (92) 99361-4583', 'C1', 'Engenharia de Software', '978-85-02', 'Código Limpo', 'E2', 'Alta Books', '2026-09-24');

-- Regra: em cada área, o leitor tem um único bibliotecário de referência; cada bibliotecário atende uma única área.
CREATE TABLE planilha_fnbc (
  leitor VARCHAR(60),
  area VARCHAR(30),
  bibliotecario VARCHAR(60)
);
INSERT INTO planilha_fnbc (leitor, area, bibliotecario) VALUES
  ('Pedro Costa', 'Exatas', 'Helena'),
  ('Pedro Costa', 'Humanas', 'Sônia'),
  ('Lara Mendes', 'Humanas', 'Sônia'),
  ('Lara Mendes', 'Saúde', 'Vera'),
  ('Iago Freitas', 'Exatas', 'Otto'),
  ('Nina Barros', 'Saúde', 'Vera'),
  ('Nina Barros', 'Exatas', 'Helena');

-- Cada livro tem vários autores e várias palavras-chave, sem relação entre autor e palavra-chave.
CREATE TABLE planilha_4fn (
  isbn VARCHAR(13),
  autor VARCHAR(60),
  palavra_chave VARCHAR(30)
);
INSERT INTO planilha_4fn (isbn, autor, palavra_chave) VALUES
  ('978-85-01', 'Elmasri', 'SQL'),
  ('978-85-01', 'Elmasri', 'Modelagem'),
  ('978-85-01', 'Navathe', 'SQL'),
  ('978-85-01', 'Navathe', 'Modelagem'),
  ('978-85-02', 'Robert Martin', 'Boas práticas'),
  ('978-85-02', 'Robert Martin', 'Refatoração'),
  ('978-85-02', 'Robert Martin', 'Testes'),
  ('978-85-05', 'Sommerville', 'Requisitos'),
  ('978-85-05', 'Sommerville', 'Processos');
