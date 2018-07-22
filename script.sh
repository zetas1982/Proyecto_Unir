#!/bin/bash
docker run --rm -v $(pwd):/app composer/composer install
docker run --rm -v $(pwd):/app -w /app lucor/php7-cli php bin/install.php translations develop
docker run --rm -it -v $(pwd):/app -w /app digitallyseamless/nodejs-bower-grunt sh -c "npm install && bower install"
docker-compose build
docker-compose up
