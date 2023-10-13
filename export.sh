authdb="admin"
database="<database>"
username="<username>"
password="<password>"

echo "Exporting all collections in db \"$database\" to \"/var/dbdata/$database\""

# get all collections
mongosh --quiet \
    --eval "db.getCollectionNames()" \
    --json=canonical \
    --authenticationDatabase "$authdb" \
    --username "$username" \
    --password "$password" \
    "$database" \
| \
jq .[] \
| \
xargs -I"{collection}"  mongoexport --quiet \
    --collection={collection} \
    --out=/var/dbdata/$database/{collection}.json \
    --jsonFormat=canonical \
    --authenticationDatabase="$authdb" \
    -u="$username" \
    -p="$password" \
    --db="$database"

echo "Export complete in /var/dbdata/$database\n"
ls -1 /var/dbdata/$database
