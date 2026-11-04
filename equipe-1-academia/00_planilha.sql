-- Cenário 1: Academia FitMais
-- Rode este arquivo no MySQL para criar o banco e as planilhas originais.

DROP DATABASE IF EXISTS normalizacao_academia;
CREATE DATABASE normalizacao_academia CHARACTER SET utf8mb4;
USE normalizacao_academia;

-- Cada linha é a matrícula de um aluno em uma aula. Um aluno tem um plano e pode ter mais de um telefone.
CREATE TABLE planilha (
  matricula INT,
  nome_aluno VARCHAR(60),
  telefones VARCHAR(60),
  cod_plano CHAR(2),
  nome_plano VARCHAR(20),
  valor_plano DECIMAL(8,2),
  cod_aula CHAR(2),
  nome_aula VARCHAR(30),
  horario CHAR(5),
  dias VARCHAR(20)
);
INSERT INTO planilha (matricula, nome_aluno, telefones, cod_plano, nome_plano, valor_plano, cod_aula, nome_aula, horario, dias) VALUES
  (101, 'Ana Souza', '(92) 98137-1111; (92) 98541-2123', 'P1', 'Mensal', 129.9, 'A1', 'Musculação', '07:00', 'Seg/Qua/Sex'),
  (101, 'Ana Souza', '(92) 98137-1111; (92) 98541-2123', 'P1', 'Mensal', 129.9, 'A2', 'Spinning', '18:00', 'Ter/Qui'),
  (102, 'Bruno Lima', '(92) 98174-1222', 'P2', 'Trimestral', 339.9, 'A1', 'Musculação', '07:00', 'Seg/Qua/Sex'),
  (102, 'Bruno Lima', '(92) 98174-1222', 'P2', 'Trimestral', 339.9, 'A3', 'Pilates', '19:00', 'Seg/Qua'),
  (103, 'Carla Dias', '(92) 98211-1333; (92) 98623-2369', 'P1', 'Mensal', 129.9, 'A2', 'Spinning', '18:00', 'Ter/Qui'),
  (103, 'Carla Dias', '(92) 98211-1333; (92) 98623-2369', 'P1', 'Mensal', 129.9, 'A4', 'Funcional', '06:30', 'Ter/Qui'),
  (104, 'Diego Alves', '(92) 98248-1444', 'P3', 'Anual', 1199.0, 'A1', 'Musculação', '07:00', 'Seg/Qua/Sex'),
  (104, 'Diego Alves', '(92) 98248-1444', 'P3', 'Anual', 1199.0, 'A3', 'Pilates', '19:00', 'Seg/Qua'),
  (104, 'Diego Alves', '(92) 98248-1444', 'P3', 'Anual', 1199.0, 'A4', 'Funcional', '06:30', 'Ter/Qui'),
  (105, 'Elisa Rocha', '(92) 98285-1555; (92) 98705-2615', 'P2', 'Trimestral', 339.9, 'A2', 'Spinning', '18:00', 'Ter/Qui'),
  (106, 'Fábio Nunes', '(92) 98322-1666', 'P3', 'Anual', 1199.0, 'A3', 'Pilates', '19:00', 'Seg/Qua'),
  (106, 'Fábio Nunes', '(92) 98322-1666', 'P3', 'Anual', 1199.0, 'A4', 'Funcional', '06:30', 'Ter/Qui');

-- Regra: em cada modalidade, o aluno tem um único instrutor; cada instrutor ensina uma única modalidade.
CREATE TABLE planilha_fnbc (
  aluno VARCHAR(60),
  modalidade VARCHAR(30),
  instrutor VARCHAR(60)
);
INSERT INTO planilha_fnbc (aluno, modalidade, instrutor) VALUES
  ('Ana Souza', 'Musculação', 'Rafael'),
  ('Ana Souza', 'Natação', 'Júlia'),
  ('Bruno Lima', 'Musculação', 'Marcos'),
  ('Bruno Lima', 'Natação', 'Júlia'),
  ('Carla Dias', 'Musculação', 'Rafael'),
  ('Carla Dias', 'Dança', 'Paula'),
  ('Diego Alves', 'Natação', 'Tiago'),
  ('Diego Alves', 'Dança', 'Paula');

-- Cada instrutor tem várias certificações e vários dias disponíveis, que não têm relação entre si.
CREATE TABLE planilha_4fn (
  instrutor VARCHAR(60),
  certificacao VARCHAR(40),
  dia_disponivel VARCHAR(10)
);
INSERT INTO planilha_4fn (instrutor, certificacao, dia_disponivel) VALUES
  ('Rafael', 'CREF', 'Segunda'),
  ('Rafael', 'CREF', 'Quarta'),
  ('Rafael', 'Treinamento Funcional', 'Segunda'),
  ('Rafael', 'Treinamento Funcional', 'Quarta'),
  ('Júlia', 'CREF', 'Terça'),
  ('Júlia', 'CREF', 'Quinta'),
  ('Júlia', 'CREF', 'Sábado'),
  ('Júlia', 'Salva-vidas', 'Terça'),
  ('Júlia', 'Salva-vidas', 'Quinta'),
  ('Júlia', 'Salva-vidas', 'Sábado'),
  ('Paula', 'CREF', 'Sexta');
