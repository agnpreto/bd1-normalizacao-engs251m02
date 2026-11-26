# Roteiro cronometrado da demonstração e checklist final: Equipe 4 (Eventos)

Banco: `normalizacao_eventos` | Condução da apresentação: Raymond

## Ordem da apresentação (slides)

Cada pessoa fala os slides do que fez, em sequência, sem voltar depois.

| Slides | Conteúdo | Quem fala |
|--------|----------|-----------|
| 1 a 3 | Capa, o problema e as três formas normais | Clecio |
| 4 | Planilha 1 (3FN): anomalias e dependências funcionais | Clecio |
| 5 a 7 | Modelos conceituais (Peter Chen) das planilhas 1, 2 e 3 | Raymond |
| 8 | Modelo lógico (James Martin) e decisões do grupo | Vitor |
| 9 | 3FN: DDL e migração | Vitor e Eluana |
| 10 | 3FN: prova sem perda | Marcos |
| 11 e 12 | Planilha 2 (FNBC): dependência, migração e prova | Denys |
| 13 e 14 | Planilha 3 (4FN): dependência, migração e prova | Tais |
| Demo | Demonstração ao vivo (seção "Passo a passo cronometrado") | Todos, na ordem da tabela |
| 15 | Encerramento e perguntas | Tais |

## Antes de começar
- Computador do apresentador com MySQL aberto (Workbench ou terminal) e a pasta `equipe-4-eventos` aberta.
- Conferir a versão do MySQL (o EXCEPT da prova exige 8.0.31 ou superior).
- Ter prints de reserva dos resultados, caso algo falhe ao vivo.

## Passo a passo cronometrado

A demo acontece depois do slide 14 e antes do encerramento (slide 15). Os slides explicam o trabalho; aqui só se mostra rodando. Na demo só os arquivos `01_ddl.sql`, `02_migracao.sql` e `03_prova_sem_perda.sql` são executados; os demais são abertos e mostrados. A ordem é a mesma dos slides: cada pessoa aparece uma vez só.

| Tempo | Passo | Quem executa | O que mostrar |
|-------|-------|--------------|---------------|
| 0:00 | Abrir o repositório no GitHub | Clecio | Pasta `equipe-4-eventos`, README da 3FN e `dicionario_dados.md` |
| 1:00 | Banco limpo: rodar `00_planilha.sql` | Raymond | Tabelas `planilha` (9 linhas), `planilha_fnbc` (7) e `planilha_4fn` (8) |
| 2:00 | Rodar `01_ddl.sql` (3FN) | Vitor | Tabelas criadas, PKs e FKs |
| 3:00 | Rodar `02_migracao.sql` (3FN) | Eluana | Contagens: participante 4, email 6, categoria 2, oficina 4, inscricao 4, inscricao_oficina 9 |
| 4:00 | Rodar `03_prova_sem_perda.sql` (3FN) | Marcos | Linhas originais, reconstruídas, faltando e sobrando (faltando = 0 e sobrando = 0) |
| 5:30 | FNBC completa: problema, DDL, migração e prova | Denys | mentor 4, participante_mentor 7; prova sem perda |
| 7:00 | 4FN completa: problema, DDL, migração e prova | Tais | palestrante_tema 5, palestrante_idioma 5; o JOIN reconstrói as 8 linhas |
| 8:30 | GitHub: PRs e commits, depois encerramento e perguntas | Tais | Pull Requests e 3 commits ou mais de cada pessoa (Insights → Contributors); resumo: 3FN, FNBC e 4FN sem perda de dados |

## Se algo der errado
- Erro ao rodar um script: rodar `00_planilha.sql` de novo (ele apaga e recria o banco) e repetir a partir do banco limpo.
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
