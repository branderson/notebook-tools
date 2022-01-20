#!/bin/bash

# Source the config file
dir_path=$(dirname $(realpath $0))
parent_path=$(dirname $(dirname $dir_path))  # ../../
 
config_file="$parent_path/config"
source $config_file

include_md="$TESTS_PATH/filters/markdown/ignore_after_include.md"
exclude_md="$TESTS_PATH/filters/markdown/ignore_after_exclude.md"

failed=0

# Test IgnoreAfter excludes files with tag after IgnoreAfter
echo "$exclude_md" | "$NOTES_TOOLS_PATH/scripts/filters/ignore_after.sh" '_testIgnoreAfter'
if [[ $(echo "$exclude_md" | "$NOTES_TOOLS_PATH/scripts/filters/ignore_after.sh" '_testIgnoreAfter' | head -c1 | wc -c) -eq 0 ]]; then
  :  # : is no-op
else
  echo "TEST FAILURE: Test IgnoreAfter excludes files with tag after IgnoreAfter"
  failed="$(calc -p $failed+1)"  # -p is non-interactive mode
fi

# Test IgnoreAfter includes files with tag before IgnoreAfter
echo "$include_md" | "$NOTES_TOOLS_PATH/scripts/filters/ignore_after.sh" '_testIgnoreAfter'
if [[ $(echo "$include_md" | "$NOTES_TOOLS_PATH/scripts/filters/ignore_after.sh" '_testIgnoreAfter' | head -c1 | wc -c) -ne 0 ]]; then
  :  # : is no-op
else
  echo "TEST FAILURE: Test IgnoreAfter includes files with tag before IgnoreAfter"
  failed="$(calc -p $failed+1)"
fi

if [[ $failed -eq 0 ]]; then
  echo "All tests SUCCESSFUL"
else
  echo "$failed tests FAILED"
fi
