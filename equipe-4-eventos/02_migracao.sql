-- Migração dos dados das planilhas para as tabelas novas (INSERT ... SELECT)
USE normalizacao_eventos;

-- =====================================================
-- BLOCO: PLANILHA 3 (4FN) - responsavel: Pessoa 6 (Tais)
-- =====================================================
INSERT INTO palestrante_tema (palestrante, tema)
SELECT DISTINCT palestrante, tema FROM planilha_4fn;

INSERT INTO palestrante_idioma (palestrante, idioma)
SELECT DISTINCT palestrante, idioma FROM planilha_4fn;
-- ========== FIM DO BLOCO: PLANILHA 3 (4FN) ==========