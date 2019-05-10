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

### Errors

#### MySQL Errors

**The server requested authentication method unknown to the client**

This error occures with latest version of MySQL. You can quickly fix it by following this step:

- Login to MySQL as root
- Run this command: `ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';`

Note: Change "password" and "root" with your credentials.