#!/bin/bash

repository_ref="$1"
repository_name="$2"
branch_name="$3"
# If the commit_hash is left blank then the branch will no longer have a specific commit reference.
# eg. When a related service PR is closed then the commit_hash will be cleared
commit_hash="$4"

file_path="$(dirname $0)/../metadata/repositories.json"

if [ ! -f "$file_path" ]; then
  echo "{}" > "$file_path"
fi
data=$(cat "$file_path")
new_data="{\"$repository_ref\": { \"name\": \"$repository_name\", \"branches\": { \"$branch_name\": { \"commit\": \"$commit_hash\" } } } }"
json_data=$(jq ". * $new_data" <<< "$data")
echo "$json_data" > "$file_path"
