
---

### 1. Sistema Gerenciador de Bancos de Dados Relacionais (SGBDR)

- **Definição e Origem**: Um **SGBDR** é um sistema de gerenciamento de dados baseado no modelo relacional, proposto por E. F. Codd na década de 1970. Esse modelo serve de fundamento para os principais sistemas do mercado, como MySQL, Microsoft SQL Server, IBM DB2, Oracle, PostgreSQL, Sybase e Access.
- **Estrutura de Dados Relacional**: No SGBDR, as informações são organizadas em **tabelas** que mantêm relações entre si por meio de atributos específicos.
    - **Tabela**: Objeto de armazenamento composto por uma coleção organizada de entradas de dados relacionados dispostos em linhas e colunas.
    - **Campos (Colunas ou Atributos)**: Entidades que definem os atributos e qualidades dos dados (por exemplo, nome, data de nascimento, salário, preço, sobrenome, código de produto ou número de documento).
    - **Registros (Linhas ou Tuplas)**: Entradas individuais que contêm o conjunto de campos associados a uma mesma entidade única (como todos os dados de endereço, nome e telefone referentes a um único usuário).
- Os bancos de dados modernos conseguem gerenciar milhões ou bilhões de registros estruturados em inúmeras tabelas.

---

### 2. Linguagem SQL (_Structured Query Language_)

- **Conceito**: A SQL (Linguagem de Consulta Estruturada) é a linguagem padrão universal utilizada para acessar, definir e manipular bancos de dados relacionais.
- **Dialetos SQL**: Embora haja um padrão, cada fabricante de SGBDR pode adotar um "dialeto" próprio, como o **T-SQL** no Microsoft SQL Server ou o **PL/SQL** na Oracle. O MySQL utiliza o SQL padrão, caracterizado por ser simples e direto de aprender.
- **Capacidades da Linguagem SQL**:
    - Permitir a definição e a manipulação completa das estruturas de dados.
    - Ser embutida em linguagens de programação diversas por meio de classes, bibliotecas e módulos padrão.
    - Criar e excluir bancos de dados e tabelas.
    - Desenvolver recursos avançados, como **visões (_views_)**, **procedimentos armazenados (_stored procedures_)** e **funções**.
    - Configurar e gerenciar privilégios de acesso dos usuários ao banco de dados e suas tabelas.

---

### 3. O Sistema MySQL

- **Características**: É um SGBDR distribuído sob licença _open source_ (código aberto), amplamente adotado por empresas de pequeno, médio e grande porte.
- **Multiplataforma e Linguagens**: É executado em sistemas operacionais como Windows e Linux, integrando-se facilmente a linguagens como PHP, Java, Python, entre outras.
- **Capacidade de Armazenamento**: Suporta grandes volumes de dados, alcançando até 256 TB por tabela (dependendo do sistema de arquivos do sistema operacional).
- **Desenvolvimento**: É mantido e desenvolvido atualmente pela Oracle Corporation (que adquiriu a Sun Microsystems).
- **Uso em Larga Escala**: Suporta grandes sistemas e portais globais, incluindo WordPress, Joomla, Drupal, Wikipedia, Facebook e YouTube.

---

### 4. Grupos e Famílias de Comandos SQL

Os comandos da linguagem SQL dividem-se em quatro categorias fundamentais:

1. **DDL (_Data Definition Language_ — Linguagem de Definição de Dados)**:
    
    - Comandos responsáveis por definir a infraestrutura, esquema e formato físico dos objetos do banco de dados.
    - **`CREATE`**: Cria objetos no sistema (como bancos de dados, tabelas e visões).
    - **`ALTER`**: Modifica a estrutura de objetos já existentes.
    - **`DROP`**: Exclui objetos, como tabelas, restrições (_constraints_) ou bancos de dados completos.
2. **DML (_Data Manipulation Language_ — Linguagem de Manipulação de Dados)**:
    
    - Comandos utilizados para manipular diretamente os dados armazenados nas tabelas.
    - **`INSERT`**: Insere novos registros/linhas nas tabelas.
    - **`UPDATE`**: Modifica o valor de campos em registros existentes.
    - **`DELETE`**: Remove registros específicos de uma tabela.
3. **DCL (_Data Control Language_ — Linguagem de Controle de Dados)**:
    
    - Comandos dedicados à gestão de segurança e controle de direitos de acesso dos usuários.
    - **`GRANT`**: Atribui e concede privilégios de acesso aos usuários.
    - **`REVOKE`**: Revoga ou retira privilégios concedidos anteriormente.
4. **DQL (_Data Query Language_ — Linguagem de Consulta de Dados)**:
    
    - Grupo voltado para a realização de buscas e consultas nos dados.
    - **`SELECT`**: É o comando mais utilizado na linguagem SQL, responsável por recuperar e filtrar dados armazenados em uma ou mais tabelas.

---

``` SQL

```

```
-- 1. Criação e Seleção do Banco de Dados
CREATE DATABASE IF NOT EXISTS AcdnRentalCar;
USE AcdnRentalCar;

-- 2. Tabela de Sedes
CREATE TABLE IF NOT EXISTS sedes (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(80) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    nomeGerente VARCHAR(50) NOT NULL,
    multa FLOAT(8,2) NOT NULL,
    PRIMARY KEY (id)
);

-- 3. Tabela de Classes de Carro
CREATE TABLE IF NOT EXISTS classesCarro (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    valorDiaria FLOAT(8,2) NOT NULL,
    PRIMARY KEY (id)
);

-- 4. Tabela de Clientes
CREATE TABLE IF NOT EXISTS clientes (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cnh VARCHAR(20) NOT NULL,
    validadeCnh DATE NOT NULL,
    categoriaCnh VARCHAR(3) NOT NULL,
    PRIMARY KEY (id)
);

-- 5. Tabela de Carros
CREATE TABLE IF NOT EXISTS carros (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    placa VARCHAR(10) NOT NULL,
    modelo VARCHAR(40) NOT NULL,
    ano VARCHAR(9) NOT NULL,
    cor VARCHAR(20) NOT NULL,
    quilometragem FLOAT(8,2) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    situacao VARCHAR(30) NOT NULL,
    origemCarro INT UNSIGNED NOT NULL,
    localizacaoCarro INT UNSIGNED NOT NULL,
    classeCarro INT UNSIGNED NOT NULL,
    PRIMARY KEY (id)
);

-- 6. Tabela de Reservas
CREATE TABLE IF NOT EXISTS reservas (
    numero INT UNSIGNED NOT NULL AUTO_INCREMENT,
    diarias INT NOT NULL,
    dataLocacao DATE NOT NULL,
    dataRetorno DATE,
    quilometrosRodados FLOAT(8,2),
    multa FLOAT(8,2),
    situacao VARCHAR(15) NOT NULL,
    total FLOAT(8,2),
    carro_reserva INT UNSIGNED NOT NULL,
    cliente_reserva INT UNSIGNED NOT NULL,
    sedeLocacao INT UNSIGNED NOT NULL,
    sedeDevolucao INT UNSIGNED NOT NULL,
    PRIMARY KEY (numero)
);

-- 7. Adição das Chaves Estrangeiras (Relacionamentos)

-- Relacionamentos da tabela 'carros'
ALTER TABLE carros
    ADD CONSTRAINT fk_sedesOrigem
    FOREIGN KEY (origemCarro) REFERENCES sedes (id);

ALTER TABLE carros
    ADD CONSTRAINT fk_sedesLocAtual
    FOREIGN KEY (localizacaoCarro) REFERENCES sedes (id);

ALTER TABLE carros
    ADD CONSTRAINT fk_classes
    FOREIGN KEY (classeCarro) REFERENCES classesCarro (id);

-- Relacionamentos da tabela 'reservas'
ALTER TABLE reservas
    ADD CONSTRAINT fk_sedesLocacao
    FOREIGN KEY (sedeLocacao) REFERENCES sedes (id);

ALTER TABLE reservas
    ADD CONSTRAINT fk_sedesDevolucao
    FOREIGN KEY (sedeDevolucao) REFERENCES sedes (id);

ALTER TABLE reservas
    ADD CONSTRAINT fk_carros
    FOREIGN KEY (carro_reserva) REFERENCES carros (id);

ALTER TABLE reservas
    ADD CONSTRAINT fk_clientes
    FOREIGN KEY (cliente_reserva) REFERENCES clientes (id);

```

---

### **🔍 Estru**
