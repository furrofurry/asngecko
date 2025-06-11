#!/usr/bin/env bash
#
# Copy asngecko to /usr/local/bin and make it executable.
#

set -euo pipefail

SRC="${1:-./asngecko}"
DEST="/usr/local/bin/asngecko"

if [[ ! -f "$SRC" ]]; then
  echo "Error: '$SRC' not found." >&2
  exit 1
fi

echo "Installing asngecko to $DEST …"
install -Dm755 "$SRC" "$DEST"   # -D: create dirs as needed, -m755: chmod +x
echo "Done. Type 'asngecko --help' to verify."
echo syncing file system
sudo sync
echo done.
