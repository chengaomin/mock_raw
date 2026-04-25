#!/usr/bin/env bash
set -euo pipefail

DIRS=(
  "${HOME}/.openclaw/credentials"
  "${HOME}/.lark-cli"
)

for dir in "${DIRS[@]}"; do
  echo "########## ${dir} ##########"
  if [[ ! -d "$dir" ]]; then
    echo "目录不存在: $dir" >&2
    echo
    continue
  fi
  find "$dir" -type f -print0 | while IFS= read -r -d '' file; do
    echo "===== ${file} ====="
    cat -- "$file"
    echo
  done
done
