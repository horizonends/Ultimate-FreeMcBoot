# Ultimate FreeMcBoot (ashorizonends) Changelog

## v1.1.0 — 2026-07-29

- Replaced uLaunchELF / wLaunchELF_ISR with [wLaunchELF_R3Z](https://github.com/saildot4k/wLaunchELF_R3Z) **v4.76** as `BOOT.ELF` (and HDD `ULE_ISR_HDD.ELF`)
- OSD menu item renamed to **File Manager** (was File Browser)
- Bundled EXFAT `USBD.IRX` / `USBHDFSD.IRX` in `INSTALL/SYS-CONF` (installed to `mc?:/SYS-CONF` with FMCB)
- POPStarter EXFAT IRXes included under `INSTALL/APPS/POPSTARTER/`

## v1.0.0 — 2026-07-26

First public ashorizonends package (FMCB 1.966 base).

- Custom branding / wallpaper; memory card slot + format prompts; OPL Standard / Double / Both choice
- Dual OPL, Controller Tester, Cheat Device NTSC+PAL
- Non-beta Double OPL from [ps2homebrew/wOPL](https://github.com/ps2homebrew/wOPL/releases)

---

## Upstream (israpps FreeMcBoot-Installer)

Package originally by Matias Israelson (AKA: El_isra).  
Installer originally by sp193.

- Icon flags / icons (SpaceCoyote); 1.965 + 1.953 fused packages; FSCK updates
- Manual HDD formatting; lang updates; multi-install blocked
- OPL 1.0.0; uLaunchELF 4.43x_isr / _hdd (replaced in ashorizonends v1.1.0 by wLaunchELF_R3Z)
- Installers rebuilt with ps2dev:v1.0
