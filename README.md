magari-workshops
================

PHP VM with pre-installed cookbooks and vendors (dev).

    cd magari-workshops
    vagrant up
    vagrant ssh
    cd /vagrant
    composer install
    app/console doctrine:database:create

App is accessable from http://localhost:8080/ and PhpMyAdmin from http://localhost:8080/phpmyadmin.

Composer and phpunit are installed. Unit-tests can be executed by `(cd /vagrant && vendor/bin/phpunit -c app)`.
