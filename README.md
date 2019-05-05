## Docker for Laravel

### Installation

**Clone the repository to your local.**

`git clone git@bitbucket.org:duyngha/dn-laravel-docker.git my-laravel`

**Create `my-laravel/app` folder and pull Laravel source into `app` folder.**

**Config MYSQL port, app port in `docker-compose.yml` file.**

**Config laravel in `.env`**

- Change `APP_URL` value to `127.0.0.1`. It should look like `APP_URL=http://127.0.0.1:8088`
- Change `DB_HOST=mysql`

### Errors
#### MySQL Errors
**The server requested authentication method unknown to the client**
This error occured with latest version of MySQL. You can quick fixed it by following this step:
- Login to Mysql as root
- Run this command: `ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';`

Note: Change "password" and "root" with your credentials.