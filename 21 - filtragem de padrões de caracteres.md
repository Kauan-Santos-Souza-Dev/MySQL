A filtragem de **padrões de caracteres** (ou busca por _strings_) em consultas SQL é utilizada quando precisamos localizar registros que atendam a um determinado modelo visual ou estrutural de texto. No MySQL, essa busca é feita principalmente por meio das cláusulas **`LIKE`** e **`NOT LIKE`**, e pode ser estendida para padrões complexos através de expressões regulares com a instrução **`REGEXP`**.

---

### 1. Cláusulas `LIKE` e `NOT LIKE`

O operador **`LIKE`** compara o conteúdo de uma coluna do tipo texto contra um padrão especificado entre aspas simples. Caso o texto corresponda ao padrão fornecido, a linha é incluída no resultado da consulta.

O operador **`NOT LIKE`** realiza a operação inversa, filtrando os registros e retornando apenas as linhas que **não correspondem** ao padrão informado.

#### Caracteres Coringa (_Wildcards_) no `LIKE`

Para construir padrões flexíveis com a instrução `LIKE`, utilizam-se dois caracteres coringa (metacaracteres) fundamentais:

- **Símbolo de Porcentagem (`%`)**: Substitui qualquer cadeia contendo **zero ou mais caracteres**.
- **Símbolo de Sublinhado (`_`)**: Substitui exatamente **um único caractere** em uma posição específica.

---

### 2. Exemplos Práticos com `LIKE` e `NOT LIKE`

#### A) Filtrar textos que começam com uma determinada letra

Para buscar registros em que o texto da coluna inicie com a letra **'F'**, utiliza-se a letra seguida do símbolo `%`:

```
SELECT * FROM tbl_livro
WHERE nome_livro LIKE 'F%';
```

- **Comportamento**: O MySQL localiza livros cujo título comece com a letra 'F', independentemente da quantidade ou dos caracteres que venham na sequência (como _"Fedora e Red Hat Linux"_).

#### B) Excluir textos com uma determinada letra inicial (`NOT LIKE`)

Para retornar todos os livros **exceto** aqueles cujo nome inicie com a letra **'S'**:

```
SELECT * FROM tbl_livro
WHERE nome_livro NOT LIKE 'S%';
```

- **Comportamento**: Inverte a filtragem, trazendo os livros cadastrados e descartando os títulos que iniciam com a letra 'S' (como _"SSH, o Shell Seguro"_).

#### C) Filtrar por posição exata de caractere (`_`)

Se quisermos consultar registros onde uma letra específica esteja em uma posição fixa (por exemplo, a **segunda letra** sendo a letra **'i'**), combinamos os dois coringas:

```
SELECT nome_livro
FROM tbl_livro
WHERE nome_livro LIKE '_i%';
```

- **Comportamento**: O caractere `_` ignora a primeira letra (aceitando qualquer caractere inicial), exige que o segundo caractere seja estritamente a letra **'i'**, e o `%` permite qualquer quantidade de caracteres no restante da frase (retornando títulos como _"Linux..."_, _"Windows..."_ e _"Microsoft..."_).

---

### 3. Padrões Avançados com Expressões Regulares (`REGEXP`)

Quando as combinações com `LIKE` não são suficientes para especificar o padrão desejado, o MySQL disponibiliza a cláusula **`REGEXP`** (ou `REGULAR EXPRESSION`). Ela aceita metacaracteres mais avançados para criar filtros refinados:

- **`^` (fora dos colchetes)**: Indica que a busca deve corresponder ao **início da string**.
- **`$`**: Indica que a busca deve corresponder ao **final da string**.
- **`[...]`**: Define um **conjunto ou classe de caracteres** válidos em uma posição.
- **`[^...]`**: O acento circunflexo **dentro dos colchetes** realiza a **negação** do conjunto de caracteres.
- **`|` (Pipe)**: Funciona como o operador lógico de **alternância (OU)**.

#### Exemplos de Aplicação com `REGEXP`:

- **Iniciando com uma entre várias letras**:
    
    ```
    SELECT nome_livro FROM tbl_livro
    WHERE nome_livro REGEXP '^[fs]';
    ```
    
    _(Retorna registros cujo nome inicie pela letra 'f' ou pela letra 's')_.
    
- **Negação de letras iniciais**:
    
    ```
    SELECT nome_livro FROM tbl_livro
    WHERE nome_livro REGEXP '^[^fs]';
    ```
    
    _(Retorna registros cujo nome inicie por qualquer caractere que NÃO seja a letra 'f' ou 's')_.
    
- **Terminando com determinadas letras**:
    
    ```
    SELECT nome_livro FROM tbl_livro
    WHERE nome_livro REGEXP '[ng]$';
    ```
    
    _(Retorna registros cujo nome termine com a letra 'n' ou 'g')_.
    
- **Uso de Alternância (`|`)**:
    
    ```
    SELECT nome_livro FROM tbl_livro
    WHERE nome_livro REGEXP '^[fs]|mi';
    ```
    
    _(Retorna livros que iniciam com 'f' ou 's', OU que contenham a sequência de caracteres 'mi')_.
    

---

🔍 Gostaria de ver como utilizar funções de concatenação de texto como `CONCAT`, ou prefere avançar para subconsultas (_subqueries_)?