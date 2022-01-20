# Test IgnoreAfter excludes files with tag after IgnoreAfter
**Usage:** `[[ $(echo "$TESTS_PATH/filters/ignore_after_exclude.md" | "$NOTES_TOOLS_PATH/scripts/filters/ignore_after.sh" -t '_ignoreAfter' | head -c1 | wc -c) -eq 0 ]]`

:ignoreafter: occurs before :_testIgnoreAfter: so this file should be excluded
