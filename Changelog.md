# Ultimate FreeMcBoot (ashorizonends) Changelog

## v1.0.3-alpha.5 — 2026-07-30 (Features) — boot recovery
- Recovery: restore known-working `ULE_ISR` as `BOOT.ELF` / `ULE_ISR_HDD.ELF` (R3Z temporarily rolled back pending logo fix)
- Rebuild `FREEMCB.CNF` / `FREEHDB.CNF` from known-good `bd2dcfa` base with minimal Features edits only (File Manager rename, drop ESR/SMS menu items, add POPStarter, no PADTEST fallbacks; keep ESR_Path_* / OSDSYS keys / hotkeys)
- Stock `SYS-CONF` USB IRXes retained (USBD 26933 / USBHDFSD 48845)
- Title: UFMCB Features v1.0.3-alpha.5 (boot recovery)

## v1.0.3-toolkit-alpha.5 — 2026-07-30 — boot recovery
- Same ULE_ISR BOOT restore as Features; toolkit apps kept
- Stock SYS-CONF USB IRXes; version matched to Features `v1.0.3-alpha.5`

## v1.0.3-alpha.4 — 2026-07-30 (Features)
- Fix FMCB logo hang: revert `INSTALL/SYS-CONF` `USBD.IRX` / `USBHDFSD.IRX` to **stock** (non-EXFAT) drivers
- Default MC install uses stock USB IRXes again; EXFAT remains optional via `FMCB_EXFAT/` / EXFAT installer path
- POPStarter keeps EXFAT `usbd.irx` / `usbhdfsd.irx` under `APPS/POPSTARTER/` for mass:/POPSTARTER/

## v1.0.3-toolkit-alpha.4 — 2026-07-30
- Same SYS-CONF stock USB IRX restore as Features (logo hang fix)
- Version matched to Features `v1.0.3-alpha.4`

## v1.0.3-alpha.3 — 2026-07-29 (Features)
- Removed old Pad Test (`PADTEST.ELF` / `PADTEST/`) entirely
- Controller Tester only: `CONTROLLERTESTER.ELF` (no PADTEST CNF fallbacks)
- Dedupe Cheat Device: keep lowercase `cheatdevice.elf` only (drop identical `CHEATDEVICE.ELF`)
- Documented MC install sizes in README: Features ~6.74 MB (STD) / ~8.21 MB (both OPLs)

## v1.0.3-toolkit-alpha.3 — 2026-07-29
- Same Pad Test removal as Features; Controller Tester only
- Same Cheat Device ELF dedupe as Features
- Version matched to Features `v1.0.3-alpha.3`
- Documented MC install sizes: Toolkit ~9.84 MB (STD) / ~11.31 MB (both OPLs)

## v1.0.3-alpha.2 — 2026-07-29 (Features)
- POPStarter.ELF added under `INSTALL/APPS/POPSTARTER/` and `APPS-HDD`
- OSD menu entry for POPStarter (Features FREEMCB/FREEHDB)

## v1.0.3-toolkit-alpha.2 — 2026-07-29
- Version matched to Features `v1.0.3-alpha.2` (same Features baseline + toolkit apps)
- POPStarter.ELF + menu entry included with Toolkit INSTALL

## v1.0.3-alpha.1 — 2026-07-29 (Features)
- Features OSD: ESR/SMS removed (modder tools)
- Pre-release for testing Features menu cleanup

## v1.0.0-toolkit-alpha.1 — 2026-07-29
- First Ultimate FreeMcBoot Toolkit alpha (separate modder installer)
- Includes: ESR, SMS, PS2Ident, Apollo Save Tool v1.0.2, MCA v2.2 (packed), plus Features baseline apps

## v1.0.2-alpha.1 — 2026-07-29

Alpha (pre-release): app updates only.
- Controller Tester → horizonends/controllertester v1.0.0
- Cheat Device → root670/CheatDevicePS2 v1.7.5

## v1.0.1 — 2026-07-29

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
- OPL 1.0.0; uLaunchELF 4.43x_isr / _hdd (replaced in ashorizonends v1.0.1 by wLaunchELF_R3Z)
- Installers rebuilt with ps2dev:v1.0
