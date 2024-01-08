# 🚀 Getting started


## Project Overview

The project is divided into two main parts:

1. **Frontend Web Application:** This part is responsible for the user interface and interactions.

2. **Backend CMS (Content Management System):** This part manages the content, data, and overall functionality of the application.

3. **Dump data** in file pg-dump-bb_time-202401042031

## Prerequisites

Before you begin, ensure you have met the following requirements:
- Nvm 1.1.12
- Node.js version 20
- PostgreSQL version 16.1
- Add psql to environment variables


### Create .env file in cms
Copy .env.example to .env and change environment variables

### Dump data
psql -U your_username -d your_database_name -a -f path/to/your/file.sql


### `develop`

Start your Strapi application with autoReload enabled. [Learn more](https://docs.strapi.io/dev-docs/cli#strapi-develop)

```
npm run develop
# or
yarn develop
```

### `start`

Start your Strapi application with autoReload disabled. [Learn more](https://docs.strapi.io/dev-docs/cli#strapi-start)

```
npm run start
# or
yarn start
```

### `build`

Build your admin panel. [Learn more](https://docs.strapi.io/dev-docs/cli#strapi-build)

```
npm run build
# or
yarn build
```

## ⚙️ Deployment

Strapi gives you many possible deployment options for your project including [Strapi Cloud](https://cloud.strapi.io). Browse the [deployment section of the documentation](https://docs.strapi.io/dev-docs/deployment) to find the best solution for your use case.


