#!/bin/sh

mkdir -p /run/php

chown -R www-data.www-data /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress

sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = wordpress:9000#g' /etc/php/7.4/fpm/pool.d/www.conf

mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

sed -i "s/database_name_here/$DB_NAME/" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/$DB_USER/" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/$DB_PASSWD/" /var/www/html/wordpress/wp-config.php
sed -i "s/put your unique phrase here/$UNIQUE_PHRASE/" /var/www/html/wordpress/wp-config.php
sed -i "s/localhost/mariadb:3306/" /var/www/html/wordpress/wp-config.php

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core install --allow-root --url=$DOM_NAME --title=PipoEsUnBuenPerro  --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWD --admin_email=$WP_ADMIN_MAIL --skip-email --path=/var/www/html/wordpress
wp user create --allow-root $WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PASS --path=/var/www/html/wordpress --url=$DOM_NAME
if ! wp post list --post_type=page --post_status=publish --post_title='Inception' --format=count --allow-root --path=/var/www/html/wordpress | grep -q "1"; then
    html_content=$(<"/var/www/html/inception_movie.html")
    wp post create --post_type=page --post_title='Inception' --post_content="$html_content" --post_status=publish --allow-root --path=/var/www/html/wordpress
else
    echo "Page 'Inception' already exists."
fi
/usr/sbin/php-fpm7.4 -F