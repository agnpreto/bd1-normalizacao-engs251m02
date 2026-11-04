-- Cenário 2: Oficina AutoCerto
-- Rode este arquivo no MySQL para criar o banco e as planilhas originais.

DROP DATABASE IF EXISTS normalizacao_oficina;
CREATE DATABASE normalizacao_oficina CHARACTER SET utf8mb4;
USE normalizacao_oficina;

-- Cada linha é um serviço feito em uma ordem de serviço (OS). Cada OS é de um veículo; cada veículo tem um dono.
CREATE TABLE planilha (
  num_os INT,
  data_os DATE,
  placa CHAR(7),
  modelo VARCHAR(30),
  cpf_cliente CHAR(14),
  nome_cliente VARCHAR(60),
  telefones VARCHAR(60),
  cod_servico CHAR(2),
  servico VARCHAR(40),
  preco_servico DECIMAL(8,2),
  horas DECIMAL(4,1)
);
INSERT INTO planilha (num_os, data_os, placa, modelo, cpf_cliente, nome_cliente, telefones, cod_servico, servico, preco_servico, horas) VALUES
  (5001, '2026-10-01', 'ABC1D23', 'Gol 1.0', '111.111.111-11', 'Marcos Reis', '(92) 98470-2110; (92) 98910-3230', 'S1', 'Troca de óleo', 120.0, 1.0),
  (5001, '2026-10-01', 'ABC1D23', 'Gol 1.0', '111.111.111-11', 'Marcos Reis', '(92) 98470-2110; (92) 98910-3230', 'S2', 'Alinhamento', 90.0, 1.5),
  (5002, '2026-10-02', 'XYZ9K88', 'Onix LT', '222.222.222-22', 'Luana Prado', '(92) 98507-2221', 'S3', 'Troca de pastilhas', 260.0, 2.0),
  (5003, '2026-10-03', 'QWE4R56', 'HB20', '333.333.333-33', 'Otávio Melo', '(92) 98544-2332', 'S1', 'Troca de óleo', 120.0, 1.0),
  (5003, '2026-10-03', 'QWE4R56', 'HB20', '333.333.333-33', 'Otávio Melo', '(92) 98544-2332', 'S4', 'Revisão elétrica', 180.0, 3.0),
  (5004, '2026-10-06', 'JKL7M01', 'Corolla', '444.444.444-44', 'Sara Teles', '(92) 98581-2443; (92) 99033-3599', 'S2', 'Alinhamento', 90.0, 1.5),
  (5004, '2026-10-06', 'JKL7M01', 'Corolla', '444.444.444-44', 'Sara Teles', '(92) 98581-2443; (92) 99033-3599', 'S3', 'Troca de pastilhas', 260.0, 2.5),
  (5004, '2026-10-06', 'JKL7M01', 'Corolla', '444.444.444-44', 'Sara Teles', '(92) 98581-2443; (92) 99033-3599', 'S4', 'Revisão elétrica', 180.0, 2.0),
  (5005, '2026-10-07', 'MNO2P34', 'Uno Way', '111.111.111-11', 'Marcos Reis', '(92) 98470-2110; (92) 98910-3230', 'S1', 'Troca de óleo', 120.0, 1.0);

-- Regra: em cada OS, cada especialidade tem um único mecânico responsável; cada mecânico tem uma única especialidade.
CREATE TABLE planilha_fnbc (
  num_os INT,
  especialidade VARCHAR(30),
  mecanico VARCHAR(60)
);
INSERT INTO planilha_fnbc (num_os, especialidade, mecanico) VALUES
  (5001, 'Motor', 'Carlos'),
  (5001, 'Suspensão', 'Renan'),
  (5002, 'Freios', 'Igor'),
  (5003, 'Motor', 'Carlos'),
  (5003, 'Elétrica', 'Wesley'),
  (5004, 'Suspensão', 'Renan'),
  (5004, 'Freios', 'Gabriel'),
  (5004, 'Elétrica', 'Wesley');

-- Cada mecânico tem vários cursos e trabalha em vários turnos, sem relação entre curso e turno.
CREATE TABLE planilha_4fn (
  mecanico VARCHAR(60),
  curso VARCHAR(40),
  turno VARCHAR(10)
);
INSERT INTO planilha_4fn (mecanico, curso, turno) VALUES
  ('Carlos', 'Injeção Eletrônica', 'Manhã'),
  ('Carlos', 'Injeção Eletrônica', 'Tarde'),
  ('Carlos', 'Motor Diesel', 'Manhã'),
  ('Carlos', 'Motor Diesel', 'Tarde'),
  ('Renan', 'Geometria', 'Manhã'),
  ('Renan', 'Geometria', 'Noite'),
  ('Wesley', 'Elétrica Automotiva', 'Tarde'),
  ('Wesley', 'Ar-condicionado', 'Tarde');
