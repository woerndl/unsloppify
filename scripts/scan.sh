#!/bin/sh
# Scan text for catalogued slop phrases.
# Usage: scan.sh file [file...]   or   ... | scan.sh
# Prints file:line:match per hit. Exits 0 when hits were found, 1 when clean.
set -u
dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
patterns="$dir/references/phrases.txt"
tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT
grep -v -e '^#' -e '^[[:space:]]*$' "$patterns" > "$tmp"
[ -s "$tmp" ] || { echo "scan.sh: no patterns found in $patterns" >&2; exit 2; }
if command -v rg >/dev/null 2>&1; then
  if [ "$#" -eq 0 ]; then rg -i -n -f "$tmp" -
  else rg -i -n -f "$tmp" -- "$@"
  fi
else
  if [ "$#" -eq 0 ]; then grep -E -i -n -f "$tmp" -
  else grep -E -i -n -f "$tmp" -- "$@"
  fi
fi
