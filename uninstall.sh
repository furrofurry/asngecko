#!/usr/bin/env bash
#
# Remove /usr/local/bin/asngecko

set -euo pipefail

DEST="/usr/local/bin/asngecko"

if [[ -f "$DEST" ]]; then
  echo "Removing $DEST …"
  rm -f "$DEST"
  echo "Uninstalled."
  echo syncing file system...
  sudo sync
  echo done
else
  echo "Nothing to do – $DEST not found."
fi
