#!/usr/bin/env bash
# Build UFMCB-Features / UFMCB-Toolkit folders and versioned zips (ashorizonends installers only).
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
RES="$REPO/installer_res"
BASE="$RES/__base"
VER="${1:-v1.0.4}"

need_elf() {
  local f="$1"
  if [[ ! -f "$f" ]]; then
    echo "Missing $f — run installer build first (see README Build section)." >&2
    exit 1
  fi
}

need_elf "$RES/ashorizonends_Installer.elf"
need_elf "$RES/ashorizonends_Installer_EXFAT.elf"

pack_dir() {
  local out_name="$1"
  local install_src="$2"
  local title_label="$3"
  local dest="$REPO/$out_name"

  rm -rf "$dest"
  mkdir -p "$dest"

  cp -a "$BASE/lang" "$BASE/Changelog" "$dest/"
  cp "$BASE/README.txt" "$BASE/README-installer.txt" "$BASE/LEEME-instalador.txt" "$BASE/Changelog.md" "$dest/"
  cp -a "$install_src/INSTALL" "$dest/INSTALL"
  cp "$RES/ashorizonends_Installer.elf" "$RES/ashorizonends_Installer_EXFAT.elf" "$dest/"

  printf '%s\n' "title=UFMCB ${title_label} ${VER}" 'boot=ashorizonends_Installer_EXFAT.elf' > "$dest/title.cfg"

  if [[ "$out_name" == UFMCB-Toolkit ]]; then
    cp "$RES/toolkit/README.md" "$dest/README-toolkit.md"
  fi

  echo "Packed $dest"
}

pack_dir UFMCB-Features "$RES/1966" Features
pack_dir UFMCB-Toolkit "$RES/toolkit" Toolkit

(
  cd "$REPO"
  rm -f "UFMCB-Features-${VER}.zip" "UFMCB-Toolkit-${VER}.zip"
  zip -rq "UFMCB-Features-${VER}.zip" UFMCB-Features
  zip -rq "UFMCB-Toolkit-${VER}.zip" UFMCB-Toolkit
)

ls -lh "$REPO/UFMCB-Features-${VER}.zip" "$REPO/UFMCB-Toolkit-${VER}.zip"
echo "Done: UFMCB packages ${VER} (installers: ashorizonends_Installer*.elf only)"
