O vídeo **"MySQL - Tipos de Dados comuns - 09"**, apresentado por Fábio da Bóson Treinamentos, apresenta uma visão geral detalhada sobre os principais tipos de dados oferecidos pelo MySQL para a criação de tabelas e definição de colunas.

---

### 1. Tipos Numéricos Inteiros

Os tipos inteiros diferenciam-se principalmente pelo tamanho em bytes e pelo alcance (escopo) de números que conseguem armazenar:

- **`TINYINT`**: Indicado para intervalos muito pequenos, variando de `-128` a `127`.
- **`SMALLINT`**: Muito utilizado em tabelas de porte pequeno a médio, abrangendo de `-32.768` a `32.767`.
- **`MEDIUMINT`**: Suporta valores na faixa de `-8.388.608` a `8.388.607`.
- **`INT` (ou `INTEGER`)**: Um dos tipos mais comuns para chaves e contadores, suportando números de aproximadamente `-2 bilhões` até `+2 bilhões`.
- **`BIGINT`**: Reservado para volumes massivos de dados, alcançando a faixa dos quintilhões (de `-9 quintilhões` a `+9 quintilhões`).

---

### 2. Tipos Numéricos Fracionários e Decimais

Para valores que exigem casas decimais (como moedas, taxas e medições), o MySQL disponibiliza os tipos `DECIMAL` e `FLOAT`:

- **`DECIMAL(m, d)`**: É o tipo ideal para cálculos financeiros e valores monetários por não sofrer com perdas de precisão de ponto flutuante.
    - **`m` (Precisão)**: Representa o número total de dígitos do número (suporta até 65 dígitos).
    - **`d` (Escala)**: Representa a quantidade de dígitos após a vírgula (suporta até 30 casas decimais).
    - _Exemplo_: No formato `DECIMAL(10, 2)`, o campo armazena até 10 dígitos no total, sendo 2 deles após a vírgula. Caso `m` e `d` sejam omitidos, o padrão assumido é `DECIMAL(10, 0)`.
- **`FLOAT(m, d)`**: Representa números em ponto flutuante. Por padrão, assume o formato com duas casas decimais `(10, 2)`.

---

### 3. Tipos de Texto e Caracteres (_Strings_)

- **`CHAR(n)`**: Armazena _strings_ de **tamanho fixo** de 0 a 255 caracteres. Se o valor inserido for menor que `n`, o MySQL preenche o restante com espaços.
- **`VARCHAR(n)`**: Armazena _strings_ de **tamanho variável** de até 65.535 caracteres. Aloca em disco apenas o espaço efetivamente utilizado pelo texto.
- **`TEXT` / `MEDIUMTEXT` / `LONGTEXT`**: Utilizados para campos de texto extenso, como descrições de produtos, artigos ou capítulos. O `MEDIUMTEXT` suporta até 16 milhões de caracteres e o `LONGTEXT` suporta mais de 4 bilhões de caracteres.

---

### 4. Tipos Binários (_BLOB_)

- **`BLOB` (`TINYBLOB`, `MEDIUMBLOB`, `LONGBLOB`)**: Sigla para _Binary Large Objects_. São tipos utilizados para armazenar arquivos e dados binários brutos diretamente no banco de dados, como imagens, áudios e documentos.

---

### 5. Tipos Lógicos (_Booleanos_)

- **`BOOL` / `BOOLEAN`**: No MySQL, o tipo booleano é implementado como um _alias_ (apelido) para o tipo `TINYINT(1)`. O valor `0` representa **falso** (_false_) e o valor `1` (ou qualquer valor diferente de zero) representa **verdadeiro** (_true_).

---

### 6. Tipos de Data e Hora

- **`DATE`**: Armazena apenas a data no formato **`YYYY-MM-DD`** (ano-mês-dia).
- **`DATETIME`**: Armazena a combinação de data e hora no formato **`YYYY-MM-DD HH:MM:SS`**.
- **`TIME`**: Armazena apenas o horário no formato **`HH:MM:SS`**.
- **`YEAR`**: Armazena o ano em formato de 2 ou 4 dígitos (no padrão de 4 dígitos, suporta de 1901 a 2155).

---

💡 Deseja seguir para a aula 10 sobre alteração de tabelas com **`ALTER TABLE`** ou para a aula 11 sobre inserção de dados com **`INSERT INTO`**?

![[mysql_tipos_de_dados_visao_geral.png]]

