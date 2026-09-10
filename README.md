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
* Docker

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
docker compose version
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

* **PostgreSQL** — usuários, produtos e categorias.
* **MongoDB** — pedidos.

Os dois bancos são reproduzidos localmente através do Docker Compose.

### Subir os bancos

Na raiz do projeto:

```bash
docker compose up -d
```

Verifique os containers:

```bash
docker ps
```

Os serviços utilizam:

| Serviço    | Host      | Porta | Banco          |
| ---------- | --------- | ----: | -------------- |
| PostgreSQL | localhost |  5432 | dev-burguer-db |
| MongoDB    | localhost | 27017 | devburguer     |

### Parar os bancos

```bash
docker compose down
```

> Os dados são armazenados em volumes Docker e permanecem disponíveis quando os containers são parados.

## 🔄 Migrations

Para verificar o estado das migrations:

```bash
npx sequelize-cli db:migrate:status
```

Para executar as migrations em um banco PostgreSQL novo:

```bash
npx sequelize-cli db:migrate
```

> Se estiver restaurando o backup completo do PostgreSQL, não é necessário executar as migrations antes da restauração, pois o backup já contém a estrutura do banco e a tabela `SequelizeMeta`.

## 💾 Restauração dos backups

Os backups atuais são mantidos **fora do repositório GitHub**, pois podem conter dados reais do ambiente de desenvolvimento.

Estrutura esperada:

```text
Devburguer/
├── DevBurg/
│   └── ...
└── backup/
    ├── postgres/
    │   └── dev-burguer-db.sql
    └── mongo/
        └── dump/
            └── devburguer/
                ├── orders.bson
                └── orders.metadata.json
```

### Restaurar PostgreSQL

Com o container PostgreSQL em execução:

```bash
docker exec -i devburguer-postgres psql -U postgres -d dev-burguer-db < ../backup/postgres/dev-burguer-db.sql
```

### Restaurar MongoDB

Com o container MongoDB em execução:

```bash
MSYS_NO_PATHCONV=1 docker run --rm \
  --network container:dev-burguer-api-mongo \
  -v "$(pwd -W)/../backup/mongo/dump:/backup" \
  mongo:4.4 \
  mongorestore --host 127.0.0.1:27017 --db devburguer /backup/devburguer
```

> Os comandos acima consideram que a pasta `backup` está no mesmo nível da pasta `DevBurg`, conforme a estrutura apresentada.

## ▶️ Executando a API

Depois de iniciar os bancos e configurar o `.env`:

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
├── docker-compose.yml
├── package.json
├── pnpm-lock.yaml
└── README.md
```

## 🔐 Segurança

Arquivos contendo informações sensíveis, como `.env`, não devem ser enviados para o GitHub.

O projeto utiliza:

* JWT para autenticação;
* variáveis de ambiente para configurações;
* `.env.example` para documentar as variáveis necessárias sem armazenar valores secretos.

## 🛠️ Desenvolvimento

### Ambiente novo sem restauração de dados

```bash
pnpm install
docker compose up -d
npx sequelize-cli db:migrate
pnpm dev
```

### Ambiente reproduzido com os dados atuais

```bash
pnpm install
docker compose up -d
```

Depois, restaure os backups conforme a seção **Restauração dos backups** e execute:

```bash
pnpm dev
```

## 📌 Status

Projeto em desenvolvimento.

O backend está preparado para:

* desenvolvimento local;
* versionamento no GitHub;
* PostgreSQL e MongoDB através do Docker Compose;
* reprodução do ambiente em outro computador;
* recuperação dos dados através de backups locais.
