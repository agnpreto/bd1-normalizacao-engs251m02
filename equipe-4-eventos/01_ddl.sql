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

-- =====================================================
-- BLOCO: PLANILHA 3 (4FN) - responsavel: Pessoa 6 (Tais)
-- =====================================================
CREATE TABLE palestrante_tema (
  palestrante VARCHAR(60) NOT NULL,
  tema VARCHAR(40) NOT NULL,
  PRIMARY KEY (palestrante, tema)
);

CREATE TABLE palestrante_idioma (
  palestrante VARCHAR(60) NOT NULL,
  idioma VARCHAR(20) NOT NULL,
  PRIMARY KEY (palestrante, idioma)
);
-- ========== FIM DO BLOCO: PLANILHA 3 (4FN) ==========
