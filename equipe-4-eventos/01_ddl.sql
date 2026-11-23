-- Modelo normalizado: CREATE TABLE de todas as tabelas, com PK e FK
USE normalizacao_eventos;
-- =====================================================
-- BLOCO: PLANILHA 2 (FNBC) - responsavel: Pessoa 5 (Denys)
-- =====================================================

DROP TABLE IF EXISTS participante_mentor;
DROP TABLE IF EXISTS mentor;

CREATE TABLE mentor (
  mentor VARCHAR(60) NOT NULL,
  trilha VARCHAR(30) NOT NULL,
  PRIMARY KEY (mentor)
);

CREATE TABLE participante_mentor (
  participante VARCHAR(60) NOT NULL,
  mentor VARCHAR(60) NOT NULL,
  PRIMARY KEY (participante, mentor),
  FOREIGN KEY (mentor) REFERENCES mentor(mentor)
);
-- ========== FIM DO BLOCO: PLANILHA 2 (FNBC) ==========


