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

