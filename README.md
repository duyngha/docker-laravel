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

### Errors

#### MySQL Errors

**The server requested authentication method unknown to the client**

This error occures with latest version of MySQL. You can quickly fix it by following this step:

- Login to MySQL as root
- Run this command: `ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';`

Note: Change "password" and "root" with your credentials.

#### Installing Carbon package issue

Update the `composer.json` file:

```
    "require": {
        "php": "^7.1.3",
        "fideloper/proxy": "^4.0",
        "laravel/framework": "5.8.*",
        "laravel/tinker": "^1.0",
        "nesbot/carbon": "2.18.0 as 1.34.0"
    },
```


## Extra services

### Selenium

This service does stuffs for Laravel Dusk. Follow the [documentation](https://laravel.com/docs/5.6/dusk#installation) to install Laravel Dusk.

**Next, add the service for Selenium**

```
  selenium:
    image: selenium/standalone-chrome:3.11.0-antimony
    container_name: selenium
    depends_on:
      - nginx
      - php
    links:
      - nginx:localhost.dev
    volumes:
      - /dev/shm:/dev/shm
    networks:
      - laravel
```

**Then, change the URL Driver**

File: `DuskTestCase.php`
```
        if (env('DOCKER_SELENIUM') == 'true') {
			return RemoteWebDriver::create(
            	'http://selenium:4444/wd/hub', DesiredCapabilities::chrome()
        	);
        } else {
	        return RemoteWebDriver::create(
	            'http://localhost:9515', DesiredCapabilities::chrome()->setCapability(
	                ChromeOptions::CAPABILITY, $options
	            )
	        );
        }
```

Add `DOCKER_SELENIUM` environment to `.env` file. You can name it whatever you want.

**Finally, rebuild the Docker container and run example test**

`docker-compose build && docker-compose up -d`

`php artisan dusk`
