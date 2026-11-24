-- Migração dos dados das planilhas para as tabelas novas (INSERT ... SELECT)
USE normalizacao_eventos;
-- =====================================================
-- BLOCO: PLANILHA 2 (FNBC) - responsavel: Pessoa 5 (Denys)
-- =====================================================

INSERT INTO mentor (mentor, trilha)
SELECT DISTINCT mentor, trilha
FROM planilha_fnbc;

INSERT INTO participante_mentor (participante, mentor)
SELECT DISTINCT participante, mentor
FROM planilha_fnbc;

SELECT (SELECT COUNT(*) FROM mentor) AS mentor,
       (SELECT COUNT(*) FROM participante_mentor) AS participante_mentor;
-- ========== FIM DO BLOCO: PLANILHA 2 (FNBC) ==========

-- =====================================================
-- BLOCO: PLANILHA 3 (4FN) - responsavel: Pessoa 6 (Tais)
-- =====================================================
INSERT INTO palestrante_tema (palestrante, tema)
SELECT DISTINCT palestrante, tema FROM planilha_4fn;

INSERT INTO palestrante_idioma (palestrante, idioma)
SELECT DISTINCT palestrante, idioma FROM planilha_4fn;
-- ========== FIM DO BLOCO: PLANILHA 3 (4FN) ==========
