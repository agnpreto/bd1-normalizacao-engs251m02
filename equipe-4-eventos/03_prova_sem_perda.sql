-- Consultas que remontam cada planilha a partir das tabelas novas e comparam com a original
USE normalizacao_eventos;
-- =====================================================
-- BLOCO: PLANILHA 2 (FNBC) - responsavel: Pessoa 5 (Denys)
-- =====================================================

CREATE OR REPLACE VIEW vw_fnbc_reconstruida AS
SELECT pm.participante, m.trilha, m.mentor
FROM participante_mentor pm
JOIN mentor m ON m.mentor = pm.mentor;


SELECT
  'planilha_fnbc' AS tabela,
  (SELECT COUNT(*) FROM planilha_fnbc)        AS linhas_original,
  (SELECT COUNT(*) FROM vw_fnbc_reconstruida) AS linhas_reconstruida,
  
  (SELECT COUNT(*) FROM planilha_fnbc o
    WHERE NOT EXISTS (
      SELECT 1 FROM vw_fnbc_reconstruida r
      WHERE r.participante <=> o.participante
        AND r.trilha       <=> o.trilha
        AND r.mentor       <=> o.mentor)) AS faltando,
  
  (SELECT COUNT(*) FROM vw_fnbc_reconstruida r
    WHERE NOT EXISTS (
      SELECT 1 FROM planilha_fnbc o
      WHERE o.participante <=> r.participante
        AND o.trilha       <=> r.trilha
        AND o.mentor       <=> r.mentor)) AS sobrando;

SELECT participante, trilha, COUNT(*) AS qtd_mentores
FROM vw_fnbc_reconstruida
GROUP BY participante, trilha
HAVING COUNT(*) > 1;
-- ========== FIM DO BLOCO: PLANILHA 2 (FNBC) ==========


