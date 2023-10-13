# mongo_docker_export_import

Scripts to export and import mongo db data from mongodb docker container.
These scripts help to export all the collection from the specified database
in the json format directly from the mongodb container, and also import the exported collections.

## Usage setup

1. update database, username, password etc. variables at the start of the `import.sh`
   and `export.sh` files.
2. Attach this directory as volume in the mongodb container at `/var/dbdata`.
3. `exec` into the container.

## Exporting

After getting into the terminal in the container, run `/var/dbdata/export.sh`. \
This will create a folder with database's name in this directory and export all the
collections to `json` files in that folder.

## Importing

Running `/var/dbdata/import.sh` will check for the collections in the folder with
the database's name and import all the json files it finds.
