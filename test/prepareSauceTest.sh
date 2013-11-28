#!/usr/bin/env bash

PHP_VERSION=`php -v|grep --only-matching --perl-regexp "PHP 5\.\\d+"`
echo $PHP_VERSION


if [[ $PHP_VERSION != "PHP 5.5" ]]
  then
    echo "Bad PHP version"
    exit
fi

echo "Good PHP version"

curl https://gist.github.com/santiycr/5139565/raw/sauce_connect_setup.sh | bash
curl -s https://raw.github.com/jlipps/sausage-bun/master/givememysausage.php | php
cp test/config_local.php.sauce config_local.php
php -S 127.0.0.1:8888 2> /dev/null &
vendor/bin/phpunit test/Sauce.php