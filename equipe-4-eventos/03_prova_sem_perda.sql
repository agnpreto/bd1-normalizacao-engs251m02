-- Consultas que remontam cada planilha a partir das tabelas novas e comparam com a original
USE normalizacao_eventos;

-- =====================================================
-- BLOCO: PLANILHA 3 (4FN) - responsavel: Pessoa 6 (Tais)
-- =====================================================
CREATE OR REPLACE VIEW vw_4fn_reconstruida AS
SELECT t.palestrante, t.tema, i.idioma
FROM palestrante_tema t
JOIN palestrante_idioma i ON i.palestrante = t.palestrante;

SELECT
 (SELECT COUNT(*) FROM planilha_4fn) AS linhas_originais,
 (SELECT COUNT(*) FROM vw_4fn_reconstruida) AS linhas_reconstruidas,
 (SELECT COUNT(*) FROM (SELECT * FROM planilha_4fn
   EXCEPT SELECT * FROM vw_4fn_reconstruida) x) AS faltando,
 (SELECT COUNT(*) FROM (SELECT * FROM vw_4fn_reconstruida
   EXCEPT SELECT * FROM planilha_4fn) y) AS sobrando;
-- ========== FIM DO BLOCO: PLANILHA 3 (4FN) ==========