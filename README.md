## Docker for Laravel

### Installation

**Clone the repository to your local.**

`git clone git@bitbucket.org:duyngha/dn-laravel-docker.git my-laravel`

**Create `my-laravel/app` folder and pull Laravel source into `app` folder.**

**Config MYSQL port, app port in `docker-compose.yml` file.**

**Config laravel in `.env`**
- Change `APP_URL` value to `127.0.0.1`. It should look like `APP_URL=http://127.0.0.1:8088`
- Change `DB_HOST=mysql`


