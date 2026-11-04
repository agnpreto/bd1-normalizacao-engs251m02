-- Cenário 4: Semana de Tecnologia
-- Rode este arquivo no MySQL para criar o banco e as planilhas originais.

DROP DATABASE IF EXISTS normalizacao_eventos;
CREATE DATABASE normalizacao_eventos CHARACTER SET utf8mb4;
USE normalizacao_eventos;

-- Cada linha é uma oficina escolhida em uma inscrição. Cada inscrição é de um participante e tem uma categoria de preço.
CREATE TABLE planilha (
  cod_inscricao INT,
  cod_participante CHAR(3),
  nome_participante VARCHAR(60),
  emails VARCHAR(90),
  cod_categoria CHAR(2),
  categoria VARCHAR(20),
  valor_categoria DECIMAL(8,2),
  cod_oficina CHAR(2),
  nome_oficina VARCHAR(40),
  sala VARCHAR(10)
);
INSERT INTO planilha (cod_inscricao, cod_participante, nome_participante, emails, cod_categoria, categoria, valor_categoria, cod_oficina, nome_oficina, sala) VALUES
  (7001, 'P01', 'Rita Gomes', 'rita.gomes@fametro.edu.br; rita1@email.com', 'K1', 'Estudante', 50.0, 'O1', 'Git na prática', 'Lab 1'),
  (7001, 'P01', 'Rita Gomes', 'rita.gomes@fametro.edu.br; rita1@email.com', 'K1', 'Estudante', 50.0, 'O3', 'SQL avançado', 'Lab 1'),
  (7002, 'P02', 'Hugo Santos', 'hugo2@email.com', 'K2', 'Profissional', 150.0, 'O2', 'Docker básico', 'Lab 2'),
  (7002, 'P02', 'Hugo Santos', 'hugo2@email.com', 'K2', 'Profissional', 150.0, 'O3', 'SQL avançado', 'Lab 1'),
  (7002, 'P02', 'Hugo Santos', 'hugo2@email.com', 'K2', 'Profissional', 150.0, 'O4', 'UX para devs', 'Sala 5'),
  (7003, 'P03', 'Bia Moraes', 'bia3@email.com', 'K1', 'Estudante', 50.0, 'O1', 'Git na prática', 'Lab 1'),
  (7003, 'P03', 'Bia Moraes', 'bia3@email.com', 'K1', 'Estudante', 50.0, 'O4', 'UX para devs', 'Sala 5'),
  (7004, 'P04', 'Caio Pinto', 'caio.pinto@fametro.edu.br; caio4@email.com', 'K2', 'Profissional', 150.0, 'O2', 'Docker básico', 'Lab 2'),
  (7004, 'P04', 'Caio Pinto', 'caio.pinto@fametro.edu.br; caio4@email.com', 'K2', 'Profissional', 150.0, 'O3', 'SQL avançado', 'Lab 1');

-- Regra: em cada trilha, o participante tem um único mentor; cada mentor acompanha uma única trilha.
CREATE TABLE planilha_fnbc (
  participante VARCHAR(60),
  trilha VARCHAR(30),
  mentor VARCHAR(60)
);
INSERT INTO planilha_fnbc (participante, trilha, mentor) VALUES
  ('Rita Gomes', 'Back-end', 'Leo'),
  ('Rita Gomes', 'Dados', 'Mara'),
  ('Hugo Santos', 'Back-end', 'Davi'),
  ('Hugo Santos', 'Front-end', 'Íris'),
  ('Bia Moraes', 'Dados', 'Mara'),
  ('Caio Pinto', 'Front-end', 'Íris'),
  ('Caio Pinto', 'Back-end', 'Leo');

-- Cada palestrante fala sobre vários temas e em vários idiomas, sem relação entre tema e idioma.
CREATE TABLE planilha_4fn (
  palestrante VARCHAR(60),
  tema VARCHAR(40),
  idioma VARCHAR(20)
);
INSERT INTO planilha_4fn (palestrante, tema, idioma) VALUES
  ('Dra. Lia', 'IA', 'Português'),
  ('Dra. Lia', 'IA', 'Inglês'),
  ('Dra. Lia', 'Ética', 'Português'),
  ('Dra. Lia', 'Ética', 'Inglês'),
  ('Prof. Rui', 'Cloud', 'Português'),
  ('Prof. Rui', 'Cloud', 'Espanhol'),
  ('Eng. Tais', 'Segurança', 'Português'),
  ('Eng. Tais', 'Redes', 'Português');
