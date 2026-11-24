# Dicionário de dados

Uma tabela de dicionário para **cada** tabela do modelo final, usando os tipos do MySQL. O exemplo abaixo (de outro sistema) mostra o nível de detalhe esperado.

**Exemplo: tabela `produto`**

| Atributo | Tipo | Tamanho | Nulo? | Chave | Descrição | Restrição / domínio |
| --- | --- | --- | --- | --- | --- | --- |
| cod_produto | CHAR | 5 | Não | PK | Código do produto | Formato P0000 |
| nome | VARCHAR | 60 | Não |  | Nome do produto |  |
| preco | DECIMAL | 8,2 | Não |  | Preço de venda em R$ | Maior que 0 |
| cod_categoria | CHAR | 2 | Não | FK → categoria | Categoria do produto | Deve existir em `categoria` |

---

**Tabela: ____________________**

| Atributo | Tipo | Tamanho | Nulo? | Chave | Descrição | Restrição / domínio |
| --- | --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |

(copie o bloco acima para cada tabela)

<!-- BLOCO: PLANILHA 2 (FNBC) - Pessoa 5 (Denys) -->
**Tabela:** `mentor`

| Atributo | Tipo | Tamanho | Nulo? | Chave | Descrição | Restrição / domínio |
| --- | --- | --- | --- | --- | --- | --- |
| mentor | VARCHAR | 60 | Não | PK | Nome do mentor | Único. Cada mentor acompanha uma única trilha |
| trilha | VARCHAR | 30 | Não | | Trilha que o mentor acompanha | Determinada pelo mentor (`mentor → trilha`) |

**Tabela:** `participante_mentor`

| Atributo | Tipo | Tamanho | Nulo? | Chave | Descrição | Restrição / domínio |
| --- | --- | --- | --- | --- | --- | --- |
| participante | VARCHAR | 60 | Não | PK | Nome do participante | Parte da PK composta `(participante, mentor)` |
| mentor | VARCHAR | 60 | Não | PK, FK → mentor | Mentor que acompanha o participante | Deve existir em `mentor` |

A regra "em cada trilha o participante tem um único mentor" não é imposta pelo banco. Ela é conferida pela consulta de validação do `03_prova_sem_perda.sql`.
<!-- FIM DO BLOCO: PLANILHA 2 (FNBC) -->

<!-- BLOCO: PLANILHA 3 (4FN) - Pessoa 6 (Tais) -->
**Tabela: `palestrante_tema`**

| Atributo | Tipo | Tamanho | Nulo? | Chave | Descrição | Restrição / domínio |
| --- | --- | --- | --- | --- | --- | --- |
| palestrante | VARCHAR | 60 | Não | PK (composta) | Nome do palestrante | Parte da chave junto com `tema` |
| tema | VARCHAR | 40 | Não | PK (composta) | Tema sobre o qual o palestrante fala | Não repete a combinação (palestrante, tema) |

---

**Tabela: `palestrante_idioma`**

| Atributo | Tipo | Tamanho | Nulo? | Chave | Descrição | Restrição / domínio |
| --- | --- | --- | --- | --- | --- | --- |
| palestrante | VARCHAR | 60 | Não | PK (composta) | Nome do palestrante | Parte da chave junto com `idioma` |
| idioma | VARCHAR | 20 | Não | PK (composta) | Idioma em que o palestrante fala | Não repete a combinação (palestrante, idioma) |
<!-- FIM DO BLOCO: PLANILHA 3 (4FN) -->
