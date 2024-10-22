# Utiliser une image de base PHP avec Apache
FROM php:8.1-apache

# Installer les extensions PHP nécessaires pour MySQL et autres fonctionnalités utiles
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copier les fichiers de l'application dans le dossier par défaut d'Apache
COPY . /var/www/html/

# Définir le répertoire de travail à /var/www/html (le dossier par défaut de l'application)
WORKDIR /var/www/html/

# Configurer les permissions pour éviter les problèmes d'accès
RUN chown -R www-data:www-data /var/www/html/

# Activer le module de réécriture d'URL d'Apache, si nécessaire (utile pour les frameworks)
RUN a2enmod rewrite

# Exposer le port 80 pour permettre l'accès HTTP
EXPOSE 80

# Démarrer Apache en mode foreground pour que le conteneur continue de tourner
CMD ["apache2-foreground"]
