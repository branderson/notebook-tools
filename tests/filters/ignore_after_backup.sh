#!/bin/bash

# Source the config file
dir_path=$(dirname $(realpath $0))
parent_path=$(dirname $(dirname $dir_path))  # ../../
 
config_file="$parent_path/config"
source $config_file

# Inputs
# - Reads list of filenames separated by \n from stdin
# - $1 contains tag to check
while IFS='$\n'read file; do
    cat "$file" | grep --ignore-case --extended-regexp --count -e "(?<\!:$TAG_IGNORE_AFTER:).*:$1:"
done
# ":$TAG_IGNORE_AFTER"
