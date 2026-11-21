-- Modelo normalizado: CREATE TABLE de todas as tabelas, com PK e FK
USE normalizacao_eventos;

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