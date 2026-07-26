#!/usr/bin/env bash
# FMCB installer needs lang/ + INSTALL/ beside the ELF (PCSX2 host: root).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
exec /home/sammy/.local/bin/pcsx2 -fastboot -elf "$ROOT/installer_res/ashorizonends_Installer.elf" "$@"
