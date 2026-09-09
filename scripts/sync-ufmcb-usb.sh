#!/usr/bin/env bash
# Sync UFMCB-Features onto a PS2 USB stick (Features only; no Toolkit/zips/clutter).
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
VER="${1:-v1.0.4}"
FEAT_SRC="${REPO}/UFMCB-Features"
FEAT_DEST="UFMCB-Features"

if [[ ! -d "$FEAT_SRC" ]]; then
  echo "Run scripts/pack-ufmcb.sh first." >&2
  exit 1
fi

USB="${USB:-}"
if [[ -z "$USB" ]]; then
  for d in /run/media/sammy/* /run/media/"$USER"/*; do
    if [[ -d "$d" && -w "$d" ]]; then
      USB="$d"
      break
    fi
  done
fi

if [[ -z "$USB" || ! -d "$USB" ]]; then
  echo "Set USB=/path/to/stick or plug in the stick." >&2
  exit 1
fi

echo "USB: $USB"

# Remove all UFMCB / FMCB installer clutter and old layouts
rm -rf "$USB"/FMCBinst-* "$USB"/FMCBinst_* 2>/dev/null || true
rm -f "$USB"/FMCBInstaller.elf "$USB"/FMCBInstaller_EXFAT.elf 2>/dev/null || true
rm -f "$USB"/UNC_FMCBInstaller*.elf "$USB"/ashorizonends_Installer*.elf 2>/dev/null || true
rm -rf "$USB"/UFMCB-Features-latest "$USB"/UFMCB-Toolkit-latest 2>/dev/null || true
rm -rf "$USB"/UFMCB-Toolkit "$USB"/UFMCB-Features 2>/dev/null || true
rm -f "$USB"/UFMCB-*.zip 2>/dev/null || true
rm -f "$USB"/UFMCB-*-alpha*.zip 2>/dev/null || true

# Remove other top-level folders (installer stick = Features only)
for name in "New folder" THM VMC; do
  rm -rf "$USB/$name" 2>/dev/null || true
done

mkdir -p "$USB/$FEAT_DEST"
rsync -a --delete --no-perms --no-owner --no-group "$FEAT_SRC/" "$USB/$FEAT_DEST/"

printf '%s\n' "title=UFMCB Features ${VER}" 'boot=ashorizonends_Installer_EXFAT.elf' > "$USB/$FEAT_DEST/title.cfg"

sync
echo "Synced $FEAT_DEST (${VER}) — Features only"
ls -ld "$USB/$FEAT_DEST"
ls -lh "$USB/$FEAT_DEST/ashorizonends_Installer_EXFAT.elf"
test -f "$USB/$FEAT_DEST/INSTALL/SYSTEM/FMCB.XLF" && echo "INSTALL tree OK"
