magari-workshops
================

![Master Build Status](https://circleci.com/gh/foobugs/magari-workshops/tree/master.png?circle-token=493c06b21687b9aa6d35cf3551cf7ff4bdc9353a)

PHP VM with pre-installed cookbooks and vendors (dev).

After cloning do the following:

    cd magari-workshops
    vagrant up
    vagrant ssh
    cd /vagrant
    composer install
    app/console doctrine:database:create
    app/console doctrine:schema:create

The Symfony application is now accessable via [http://localhost:8080/](http://localhost:8080/) and phpMyAdmin via [http://localhost:8080/phpmyadmin/](http://localhost:8080/phpmyadmin/) (MySQL username: root, no password).

Composer and PHPUnit are installed. Unit tests can be executed via:

    cd /vagrant
    vendor/bin/phpunit -c app
