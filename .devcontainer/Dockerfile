# Utiliser l'image officielle PHP avec FPM
FROM php:8.1-fpm-alpine

# Met à jour les paquets et installe les dépendances nécessaires pour pdo_mysql
RUN apk update && \
    apk add --no-cache git mariadb-dev && \
    apk add --no-cache git openssh && \
    docker-php-ext-install pdo pdo_mysql

# Installer les autres extensions PHP que tu pourrais avoir besoin
RUN docker-php-ext-install mysqli

# Ajout XDebug
RUN apk add --no-cache autoconf g++ make linux-headers \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

# Copier ton code source (si nécessaire)
COPY . /var/www/html/

# Définir le répertoire de travail
WORKDIR /var/www/html/
