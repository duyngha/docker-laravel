## Docker for Laravel
A docker compose for Laravel development.

### Prerequisites

**Laravel Installer**

See the [documentation](https://laravel.com/docs/5.8/installation).

### Installation

**Clone the repository to your local.**

`git clone git@bitbucket.org:duyngha/dn-laravel-docker.git my-laravel`

**With new project source**

Run the file `bootstrap` by following command `./bootstrap`

**With exists project**

- Copy file `.env.example` to `.env` and config the environment
- Put the Laravel source into `app` foler

**Build docker**

Run the following command to build the docker container
`docker-compose up --build`

### Do bash command

To do the bash command in Docker container, you can use the `exec` command in Docker.

`docker-compose exec php php artisan route:list`
