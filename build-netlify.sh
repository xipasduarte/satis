#!/bin/sh

# Composer is unavailable on Netlify at the moment, and the current PHP version
# is PHP 5.5.9-1ubuntu4.21. Once this is no longer the case the build script can
# be made a lot simpler.
# Get Composer.
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

# Build Satis.
php composer.phar run-script build
