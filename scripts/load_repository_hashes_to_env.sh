#!/bin/bash

file_path="$(dirname "${BASH_SOURCE[0]}")/../metadata/repositories.json"

branch_name=$1

jq_query='
  def getCommit(branch_name): .[branch_name].commit | if . == "" then empty else . end;
  def getAssignment(name; value): 
    if name and name != "" and value and value != "" then "\(name)=\(value)" else empty end;

  .[]
  | . + { hash: .branches | (getCommit($branch) // getCommit("main")) }
  | getAssignment(.env; .hash)'

if [ -f "$file_path" ]; then
  data=$(cat "$file_path")
  all_hash_exports=$(jq --arg branch "$branch_name" "${jq_query}" <<< "$data") 
  # echo "$all_hash_exports" | sed 's/"//g'
  for keyval in $(echo "$all_hash_exports" | sed 's/"//g'); do
    echo "$keyval"
    export "$keyval"
  done
else
  echo "Error: Could not locate the repositories.json file!"
  exit 1
fi
