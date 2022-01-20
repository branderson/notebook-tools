# Test IgnoreAfter includes files with tag before IgnoreAfter
**Usage:** `[[ $(echo "$TESTS_PATH/filters/ignore_after_include.md" | "$NOTES_TOOLS_PATH/scripts/filters/ignore_after.sh" '_ignoreAfter' | head -c1 | wc -c) -ne 0 ]]` should have `tests/filters/ignore_after_include.md` as output

:_testIgnoreAfter: occurs before :ignoreafter: so this file should be included
