# Roteiro cronometrado da demonstração e checklist final: Equipe 4 (Eventos)

Banco: `normalizacao_eventos` | Condução da apresentação: Raymond

## Antes de começar
- Computador do apresentador com MySQL aberto (Workbench ou terminal) e a pasta `equipe-4-eventos` aberta.
- Conferir a versão do MySQL (o EXCEPT da prova exige 8.0.31 ou superior).
- Ter prints de reserva dos resultados, caso algo falhe ao vivo.

## Passo a passo cronometrado

| Tempo | Passo | Quem executa | O que mostrar |
|-------|-------|--------------|---------------|
| 0:00 | Abertura: tema do trabalho e as 3 planilhas | Raymond | Slide de abertura e `modelo_conceitual.png` (Peter Chen) |
| 1:00 | Anomalias e dependências funcionais da 3FN | Clecio | README da 3FN |
| 2:00 | Banco limpo: rodar `00_planilha.sql` | Raymond | Tabelas `planilha` (9 linhas), `planilha_fnbc` (7) e `planilha_4fn` (8) |
| 3:00 | Rodar `01_ddl.sql` (3FN) | Vitor | Tabelas criadas, PKs e FKs; `modelo_logico.png` (James Martin) |
| 4:00 | Rodar `02_migracao.sql` (3FN) | Eluana | Contagens: participante 4, email 6, categoria 2, oficina 4, inscricao 4, inscricao_oficina 9 |
| 5:00 | Rodar `03_prova_sem_perda.sql` (3FN) | Marcos | Linhas originais, reconstruídas, faltando e sobrando (faltando = 0 e sobrando = 0) |
| 6:00 | FNBC completa: problema, DDL, migração e prova | Denys | mentor 4, participante_mentor 7; prova sem perda |
| 7:30 | 4FN completa: problema, DDL, migração e prova | Tais | palestrante_tema 5, palestrante_idioma 5; o JOIN reconstrói as 8 linhas |
| 9:00 | Dicionário de Dados | Clecio | `dicionario_dados.md` |
| 9:30 | Encerramento e perguntas | Tais | Resumo: 3FN, FNBC e 4FN sem perda de dados |

## Se algo der errado
- Erro ao rodar um script: rodar `00_planilha.sql` de novo (ele apaga e recria o banco) e repetir do passo 3.
- Sem tempo: pular direto para a prova sem perda de cada forma normal.
- MySQL travou: usar os prints de reserva.

## Checklist final (Fase 3)

### Arquivos na pasta `equipe-4-eventos`
- [ ] README (anomalias e dependências funcionais)
- [ ] `modelo_conceitual.png` (Peter Chen)
- [ ] `modelo_logico.png` (James Martin, pé de galinha)
- [ ] `dicionario_dados.md`
- [ ] `01_ddl.sql`
- [ ] `02_migracao.sql` (só INSERT ... SELECT)
- [ ] `03_prova_sem_perda.sql`

### Teste do zero
- [ ] Banco limpo com `00_planilha.sql`
- [ ] `01_ddl.sql` roda sem erro
- [ ] `02_migracao.sql` roda sem erro
- [ ] `03_prova_sem_perda.sql`: faltando = 0 e sobrando = 0 nas 3 planilhas
- [ ] Contagens conferem com as esperadas

### GitHub
- [ ] Cada pessoa tem pelo menos 3 commits na própria branch
- [ ] Cada pessoa abriu o seu Pull Request
- [ ] Nenhum PR foi mesclado com Squash (usar Merge pull request)
- [ ] Todos os PRs foram mesclados
- [ ] O `00_planilha.sql` não foi alterado

### Apresentação
- [ ] Slides prontos
- [ ] Ensaio feito com o tempo cronometrado
- [ ] Cada pessoa sabe qual parte vai falar
