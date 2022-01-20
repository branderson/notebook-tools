#!/bin/bash

# Source the config file
dir_path=$(dirname $(realpath $0))
parent_path=$(dirname $dir_path)
 
config_file="$parent_path/config"
source $config_file

# Backs up all wikis to a '.backup' diretctory in the notebooks root (synced-notebooks/.backup). Deletes any existing backup
wiki_path="$WIKI_PATH"

# Delete the existing backup if it exists
backupdir="$wiki_path/.backup"
echo "Deleting existing backup in $backupdir"
if [ -d "$backupdir" ]; then
    rm -rf "$backupdir"
fi

# Make a new backup directory
echo "Creating new backup directory"
mkdir "$backupdir"

# Copy all folders other than the backup to .backup
echo "Backing up wikis"
for dir in $wiki_path/*/; do
    echo "Copying $dir to $backupdir"
    cp -r $dir $backupdir
done
