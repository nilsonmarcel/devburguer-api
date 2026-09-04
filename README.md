# DevBurguer API

API backend do projeto **DevBurguer**, desenvolvida com Node.js, Express, PostgreSQL e MongoDB.

## 🚀 Tecnologias

* Node.js
* Express
* Sequelize
* PostgreSQL
* Mongoose
* MongoDB
* JWT
* Multer
* Yup
* pnpm

## 📋 Pré-requisitos

Antes de executar o projeto, instale:

* Node.js
* pnpm
* Docker Desktop
* Git

Verifique as versões:

```bash
node --version
pnpm --version
docker --version
git --version
```

## 📦 Instalação

Clone o repositório:

```bash
git clone git@github.com:nilsonmarcel/devburguer-api.git
cd devburguer-api
```

Instale as dependências:

```bash
pnpm install
```

## ⚙️ Configuração das variáveis de ambiente

Crie o arquivo `.env` a partir do exemplo:

```bash
cp .env.example .env
```

Configure as variáveis de ambiente conforme o seu ambiente local.

> O arquivo `.env` não deve ser versionado no Git.

## 🗄️ Banco de dados

O projeto utiliza dois bancos de dados:

* PostgreSQL — dados de usuários, produtos e categorias.
* MongoDB — pedidos.

Os serviços podem ser executados através do Docker Desktop.

### PostgreSQL

Configuração padrão utilizada no desenvolvimento:

```text
Host: localhost
Port: 5432
Database: dev-burguer-db
User: postgres
```

### MongoDB

Configuração padrão utilizada no desenvolvimento:

```text
Host: localhost
Port: 27017
Database: devburguer
```

## 🔄 Migrations

Para verificar o estado das migrations:

```bash
npx sequelize-cli db:migrate:status
```

Para executar as migrations:

```bash
npx sequelize-cli db:migrate
```

## ▶️ Executando a API

Modo desenvolvimento:

```bash
pnpm dev
```

A API será executada por padrão em:

```text
http://localhost:3001
```

## 📁 Estrutura do projeto

```text
DevBurg/
├── src/
│   ├── app/
│   │   ├── controller/
│   │   ├── middlewares/
│   │   ├── models/
│   │   └── schemas/
│   ├── config/
│   ├── database/
│   │   └── migrations/
│   ├── app.js
│   ├── routes.js
│   └── server.js
├── uploads/
├── .env.example
├── .gitignore
├── package.json
├── pnpm-lock.yaml
└── README.md
```

## 🔐 Segurança

Arquivos contendo informações sensíveis, como `.env`, não devem ser enviados para o GitHub.

O projeto utiliza:

* JWT para autenticação;
* variáveis de ambiente para configurações;
* `.env.example` para documentar as variáveis necessárias sem armazenar os valores secretos.

## 💾 Backups

Os backups locais do PostgreSQL e MongoDB são mantidos fora do código-fonte versionado.

Eles são utilizados para preservar os dados do ambiente atual e permitir a recuperação dos bancos quando necessário.

## 🛠️ Desenvolvimento

Após configurar Node.js, pnpm, Docker, PostgreSQL, MongoDB e as variáveis de ambiente:

```bash
pnpm install
npx sequelize-cli db:migrate
pnpm dev
```

A API estará disponível em:

```text
http://localhost:3001
```

## 📌 Status

Projeto em desenvolvimento.

O objetivo é manter o backend preparado para desenvolvimento local, versionamento no GitHub e futura configuração em outro computador.
