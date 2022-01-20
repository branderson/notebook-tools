#!/bin/bash

# Source the config file
dir_path=$(dirname $(realpath $0))
parent_path=$(dirname $dir_path)
 
config_file="$parent_path/config"
source $config_file

# Lists absolute paths to all files in synced-notebooks directory which contain the given tag. Don't include ":"s around tags passed to this tool

# TODOs
# - Allow search directory to be optionally passed as an arguement
# - Flag to only search in bottom of a note in a "## Tags" section
# - Detect when files exist in multiple locations and choose most recently edited, filtering the rest
# - Find most recently updated file in cases

# Flags:
# -l only list filenames
# -i search case-insensitively
ag -il ":$1:" "$WIKI_PATH"
