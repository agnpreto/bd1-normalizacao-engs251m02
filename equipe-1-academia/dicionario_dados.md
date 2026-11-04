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
