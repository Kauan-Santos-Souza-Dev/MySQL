O operador **`REGEXP`** (abreviação de _Regular Expression_ ou Expressão Regular) no MySQL é uma cláusula avançada de filtragem utilizada em instruções `SELECT`, `UPDATE` ou `DELETE` para localizar e validar **padrões complexos de caracteres** em colunas de texto.

Enquanto o operador `LIKE` utiliza apenas dois metacaracteres simples (`%` e `_`), o `REGEXP` aceita a sintaxe completa das Expressões Regulares, permitindo especificar regras de início e fim de palavras, grupos de letras permitidas ou proibidas e opções de alternância (_OU_) em uma única expressão.

---

### 1. Sintaxe Geral

A estrutura básica para aplicar uma expressão regular no MySQL é:

```
SELECT colunas
FROM nome_da_tabela
WHERE coluna REGEXP 'padrao';
```

A expressão/padrão deve ser sempre envolvida por **aspas simples**. Se o texto armazenado na coluna atender ao padrão definido, a linha é considerada verdadeira e incluída no resultado da consulta.

---

### 2. Principais Metacaracteres do `REGEXP`

|Metacaractere|Descrição / Função|Exemplo|
|:--|:--|:--|
|**`^`** _(fora de colchetes)_|Indica que a busca deve corresponder ao **início da string**.|`REGEXP '^F'` _(inicia com F)_|
|**`$`**|Indica que a busca deve corresponder ao **final da string**.|`REGEXP 'g$'` _(termina com g)_|
|**`[...]`**|Define um **conjunto ou classe de caracteres**. Aceita qualquer uma das letras/números listados naquela posição.|`REGEXP '[fs]'` _(contém f ou s)_|
|**`[^...]`**|O acento circunflexo **dentro dos colchetes** realiza a **negação** do conjunto (não aceita as letras listadas).|`REGEXP '[^fs]'` _(não contém f nem s)_|
|**`[a-z]`**|Define uma **faixa ou intervalo** sequencial de caracteres.|`REGEXP '^[A-H]'` _(inicia de A a H)_|
|**`\|`**|Operador de **alternância (OU)**.|

---

### 3. Exemplos Práticos Comentados

#### A) Buscar textos que começam com letras específicas (`^[...]`)

Para selecionar livros cujo nome **inicie** pela letra **'F'** ou pela letra **'S'**:

```
SELECT nome_livro
FROM tbl_livro
WHERE nome_livro REGEXP '^[fs]';
```

- **Explicação**: O acento circunflexo `^` fora dos colchetes exige que o padrão esteja no início da linha. O conjunto `[fs]` aceita a letra 'f' ou a letra 's'. Retorna registros como _"SSH, o Shell Seguro"_ e _"Fedora e Red Hat Linux"_.

#### B) Excluir textos por inicial (`^[^...]`)

Para selecionar livros cujo nome **NÃO inicie** pelas letras **'F'** nem **'S'**:

```
SELECT nome_livro
FROM tbl_livro
WHERE nome_livro REGEXP '^[^fs]';
```

- **Explicação**: O primeiro `^` exige o início da string; o segundo `^` (dentro dos colchetes) **nega** as letras 'f' e 's'. Retorna livros como _"Linux Command Line..."_, _"Windows Server..."_ e _"Microsoft Exchange..."_.

#### C) Buscar textos pelo final da frase (`[...]$`)

Para selecionar registros cujo nome **termine** com a letra **'N'** ou **'G'**:

```
SELECT nome_livro
FROM tbl_livro
WHERE nome_livro REGEXP '[ng]$';
```

- **Explicação**: O símbolo `$` no final do padrão força o MySQL a verificar o último caractere da string.

#### D) Usar alternâncias complexas com o Pipe (`|`)

Para selecionar livros que **iniciam com 'F' ou 'S'**, **OU** que contenham a sequência exata **'mi'** em qualquer posição:

```
SELECT nome_livro
FROM tbl_livro
WHERE nome_livro REGEXP '^[fs]|mi';
```

- **Explicação**: O caractere `|` divide a expressão em duas regras independentes. Traz títulos como _"SSH..."_, _"Fedora..."_ e _"Microsoft Exchange..."_.

---

### 4. Resumo comparativo: `LIKE` vs. `REGEXP`

|Recurso|`LIKE`|`REGEXP`|
|:--|:--|:--|
|**Coringas de tamanho**|`%` (0 ou mais) / `_` (1 caractere)|`.` _(qualquer caractere)_ / `*` _(0 ou mais)_|
|**Busca de Início/Fim**|Requer colocar `%` no início ou fim|Usa os ancoradores `^` (início) e `$` (fim)|
|**Listas de opções**|Requer múltiplos `OR` (`WHERE c LIKE 'A%' OR c LIKE 'B%'`)|Usa conjuntos simples (`WHERE c REGEXP '^[AB]'`)|
|**Complexidade**|Simples e mais rápido para buscas exatas|Avançado, ideal para validações estruturadas|

---
