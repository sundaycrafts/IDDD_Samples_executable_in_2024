#!/bin/bash

cat <<EOF | docker compose exec -T iddd-mysql sh -c 'mysql --host=localhost --user=root --password="$MYSQL_ROOT_PASSWORD"'
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';
FLUSH PRIVILEGES;
EOF

docker compose exec iddd-mysql sh -c 'find /var/tmp/sql -type f -name "*.sql" -exec sh -c "mysql --host=localhost --user=root --password=$MYSQL_ROOT_PASSWORD < \$1" -- {} \;'
