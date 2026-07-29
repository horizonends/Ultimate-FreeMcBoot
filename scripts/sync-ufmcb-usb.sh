#!/usr/bin/env bash
# Sync UFMCB-Features / UFMCB-Toolkit onto a PS2 USB stick and remove old FMCBinst-* clutter.
set -euo pipefail
USB="${1:-/run/media/sammy/PS2}"
REPO="$(cd "$(dirname "$0")/.." && pwd)"
FEAT_SRC="${REPO}/UFMCB-Features"
TOOL_SRC="${REPO}/UFMCB-Toolkit"
ZIP_FEAT="${REPO}/UFMCB-Features-v1.0.3-alpha.4.zip"
ZIP_TOOL="${REPO}/UFMCB-Toolkit-v1.0.3-alpha.4.zip"

if [[ ! -d "$USB" ]]; then
  echo "USB not mounted at $USB" >&2
  exit 1
fi
if [[ ! -d "$FEAT_SRC" || ! -d "$TOOL_SRC" ]]; then
  echo "Missing UFMCB-Features / UFMCB-Toolkit under $REPO" >&2
  exit 1
fi

rm -rf "$USB/UFMCB-Features" "$USB/UFMCB-Toolkit"
mkdir -p "$USB/UFMCB-Features" "$USB/UFMCB-Toolkit"
rsync -a --delete --no-perms --no-owner --no-group "$FEAT_SRC/" "$USB/UFMCB-Features/"
rsync -a --delete --no-perms --no-owner --no-group "$TOOL_SRC/" "$USB/UFMCB-Toolkit/"
printf '%s\n' 'title=UFMCB Features v1.0.3-alpha.4' 'boot=ashorizonends_Installer_EXFAT.elf' > "$USB/UFMCB-Features/title.cfg"
printf '%s\n' 'title=UFMCB Toolkit v1.0.3-alpha.4' 'boot=ashorizonends_Installer_EXFAT.elf' > "$USB/UFMCB-Toolkit/title.cfg"

shopt -s nullglob
for d in "$USB"/FMCBinst-*; do
  [[ -d "$d" ]] && rm -rf "$d"
done
rm -f "$USB"/FMCBinst*.zip
rm -f "$USB"/UFMCB-Features-v1.0.3-alpha.{2,3}.zip "$USB"/UFMCB-Toolkit-v1.0.3-alpha.{2,3}.zip

[[ -f "$ZIP_FEAT" ]] && cp -f "$ZIP_FEAT" "$USB/"
[[ -f "$ZIP_TOOL" ]] && cp -f "$ZIP_TOOL" "$USB/"

echo "USB installers:"
ls -d "$USB"/UFMCB-* 2>/dev/null || true
ls "$USB"/*.zip 2>/dev/null || true
