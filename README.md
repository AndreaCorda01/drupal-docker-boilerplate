# Drupal boilerplate with Docker Compose and Nginx

> **Note:** This boilerplate has been updated in 2025 to support Drupal 11. Ensure your environment is compatible with the latest version before proceeding with the installation.

This is a boilerplate for creating a Drupal 10 project with Docker Compose and Nginx for production and local environments.

### SSL Configuration

This boilerplate includes SSL configuration for both HTTP and HTTPS. The SSL certificates are stored in the `certs` directory.

To enable SSL, you need to:

1. Copy the SSL certificates to the `certs` directory
2. Update the `nginx-ssl.conf` file to use the SSL certificates
3. Make a Hard Link to the SSL certificates in the `certs` directory and change the owner to local user
4. Update the `docker-compose.yml` file to use the SSL certificates
```
volumes:
  - ./:/var/www/html
  - ./nginx/nginx.conf:/etc/nginx/nginx.conf
  - ./logs/nginx:/var/log/nginx
  - ./ssl-certificates/YOURWEBSITE.org:/etc/letsencrypt/live/YOURWEBSITE.org:ro
  - ./ssl-certificates/www.YOURWEBSITE.org:/etc/letsencrypt/live/www.YOURWEBSITE.org:ro
```
4. Update the `nginx.conf` file to use the SSL certificates


### Sponsor

This project is sponsored by [GeoNovation](https://www.geonovation.it/)

![GeoNovation Logo](geonovation-logo-black.svg "GeoNovation Logo")
## Disclaimer :warning:

  Remove from `docker-compose.yml` the **phpmyadmin** instance because it is supposed only for development and it is not password protected.


## Requirements

- Docker installed on the machine
- Basic knowledge of Docker and Docker Compose

 ## Structure
 This configuration contains:
 - Nginx server with production configuration
 - PHP FPM Server with composer and Drush installed
 - Mysql instance
 - Phpmyadmin instance


## Installation

### New project

1. Clone this repository
2. execute `docker-compose up --build -d` to start the containers
3. Open `localhost` in your browser to see the Drupal installation page
4. Follow the installation instructions
5. Enjoy your new Drupal project

  

#### First installation permission fix

During the installation will be required writing permission for the `sites/default` folder.

- `mkdir web/sites/default/files`
- `chmod a+w web/sites/default/files`
- `cp web/sites/default/default.settings.php web/sites/default/settings.php`
- `chmod a+w web/sites/default/settings.php`

Once the installation is complete, remember to remove writing permission to `settings.php`

`chmod a-w web/sites/default/settings.php`

### Existing Project

1. Copy `docker-compose.yml` , `Dockerfile`  and `.dockerignore` on your drupal installation 
2. Copy `scripts` and `nginx` folder on your project
3. Execute `docker compose up -d --build`


## Usage

### Start the application
`docker compose up -d --build`

### Check logs
`docker logs web`
`docker logs drupal`

### Execute drush command
`docker exec -it drupal drush cr`
You can open directly a shell inside your running machine to execute drush commands
`docker exec -it drupal /bin/bash`
