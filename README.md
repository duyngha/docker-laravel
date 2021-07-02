## Docker for Laravel
A docker compose for Laravel development.

### Prerequisites

**Laravel Installer**

See the [documentation](https://laravel.com/docs/5.8/installation).

### Installation

**Clone the repository to your local.**

`git clone git@bitbucket.org:duyngha/dn-laravel-docker.git my-laravel`

**Put the Laravel source into app foler**

`cd my-laravel && laravel new app --force`

**Config Laravel in `.env` file**

- Change `APP_URL` to `localhost:<nginx-port>`. For example: `localhost:8080`. In case, you use the custom domain, update it.
- Change `DB_HOST=mysql`

### Do bash command

To do the bash command in Docker container, you can use the `exec` command in Docker.

`docker-compose exec php php artisan route:list`
