## Docker for Laravel
A docker compose for Laravel development.

### Prerequisites

**Laravel Installer**

See the [documentation](https://laravel.com/docs/5.8/installation).

### Installation

**Clone the repository to your local.**

`git clone git@github.com:duyngha/docker-laravel.git`

**With new project source**

Run the file `bootstrap` by following command `./bootstrap`

**With exists project**

- Copy file `.env.example` to `.env` and config the environment
- Put the Laravel source into `app` foler

**Build docker**

Run the following command to build the docker container
`docker-compose up --build`

### Do bash command

- To do the bash command in Docker container, you can use the `exec` command in Docker.

`docker-compose exec php php artisan route:list`

- Or, you can create an alias in bash profile file to quickly call docker exec command

`alias dbash="docker-compose exec php /bin/bash"`

Now, you can type `dbash` in terminal to access the internal docker container.

### Elasticsearch and Kibana configuration
Add these lines to your `.env` file
```
ELASTIC_HOST=elasticsearch:9200 // ES url
ELASTIC_LOGS_INDEX=user_logs // Kibana log index
```

### Changelog
[Changelog](CHANGELOG.md)
