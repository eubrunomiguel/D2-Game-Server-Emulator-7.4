#!/usr/bin/env bash
echo "Initializing and configuring database"
if [ ! -f ./scripts/database_created ]; then
    mysql -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DB < ./database.sql
    touch ./scripts/database_created
    echo "Database imported."
fi
echo "Initializing database [OK]"
