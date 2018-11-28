#!/usr/bin/env sh

declare -a v
let i=0
while IFS=$'\n' read -r line; do
  v[i]="${line}"
  ((++i))
done < .rbenv_versions

echo "v = ${v[@]}"
