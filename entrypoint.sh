#!/bin/bash
set -eux

# Check if user exists
if ! id -u ${APACHE_RUN_USER} > /dev/null 2>&1; then
	echo "The user ${APACHE_RUN_USER} does not exist, creating..."
	groupadd -f -g ${APACHE_RUN_GROUP_ID} ${APACHE_RUN_GROUP}
	useradd -m -u ${APACHE_RUN_USER_ID} -g ${APACHE_RUN_GROUP} ${APACHE_RUN_USER}
fi

# Install FileRun on first run
if [ ! -e /var/www/html/index.php ];  then
	echo "[Prepare FileRun for install]"
	mysql_host="${FR_DB_HOST:-mysql}"
	mysql_port="${FR_DB_PORT:-3306}"
	# Database to be setup by normal install process
	# /wait-for-it.sh $mysql_host:$mysql_port -t 120 -- /import-db.sh
	unzip -q -o /filerun.zip -d /var/www/html/
	# autoconfig.php to be created by normal install process
	#cp /autoconfig.php /var/www/html/system/data/
	# copy patched ImageMagick.php
	# rm -f /var/www/html/system/classes/vendor/FileRun/Thumbs/Resizers/ImageMagick.php
	# cp -f /ImageMagick.php /var/www/html/system/classes/vendor/FileRun/Thumbs/Resizers/
	chown -R ${APACHE_RUN_USER}:${APACHE_RUN_GROUP} /var/www/html
	chown ${APACHE_RUN_USER}:${APACHE_RUN_GROUP} /user-files
fi

exec "$@"
