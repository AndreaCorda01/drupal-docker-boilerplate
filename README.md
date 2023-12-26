
# Drupal boilerplate with Docker Compose and Nginx

This is a boilerplate for creating a Drupal 10 project with Docker Compose and Nginx for production and local environments.

  

## Requirements

- Docker installed on the machine
- Basic knowledge of Docker and Docker Compose

  

## Usage


### New project

1. Clone this repository
2. execute `docker-compose up --build -d` to start the containers
3. Open `localhost` in your browser to see the Drupal installation page
4. Follow the installation instructions
5. Enjoy your new Drupal project

  

#### First installation permission fix

During the installation will be required writing permission for the `sites/default` folder.


```
mkdir web/sites/default/files
chmod a+w web/sites/default/files
cp web/sites/default/default.settings.php web/sites/default/settings.php
chmod a+w web/sites/default/settings.php
```
Once the installation is complete, remember to remove writing permission to `settings.php`

`chmod a-w web/sites/default/settings.php`

### Existing Project

1. Copy `docker-compose.yml` , `Dockerfile`  and `.dockerignore` on your drupal installation 
2. Copy `scripts` and `nginx` folder on your project
3. Execute `docker compose up -d --build`