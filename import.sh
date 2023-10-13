#! /bin/bash

authdb="admin"
database="<database>"
username="<username>"
password="<password>"

echo "importing all collections in /var/dbdata/$database\n"

ls -1 /var/dbdata/$database
echo ""

ls -1 /var/dbdata/$database | \
sed 's/\.json//' | \
xargs -I"{collection}" mongoimport --quiet \
    --collection={collection} \
    --file=/var/dbdata/$database/{collection}.json \
    --drop \
    -u="$username" \
    -p="$password" \
    --authenticationDatabase="${authdb}" \
    --db="$database"

echo "Import complete from /var/dbdata/$database"
