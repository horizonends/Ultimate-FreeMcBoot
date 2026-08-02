# Ultimate FreeMcBoot — Changelog (ashorizonends)

Site: https://ashorizonends.com  
Packages: **Features** (players) · **Toolkit** (modders)

## v1.0.3 — 2026-08-02 (Features live)

### Features
- Branded FMCB/FHDB installer for USB → memory card
- Memory card slot choice + optional format before install
- OPL choice: Standard / Double / Both
- File Manager: [wLaunchELF_R3Z](https://github.com/saildot4k/wLaunchELF_R3Z) as `BOOT.ELF`
- Controller Tester, Cheat Device (NTSC/PAL), POPStarter
- Stock USB drivers in `SYS-CONF` (stable boot). EXFAT helpers stay under `FMCB_EXFAT/` only

### Toolkit
- Separate modder installer (not in this release zip) — PS2Ident, Apollo, MCA, ESR, SMS, …
- Needs a larger memory card than Features (~16 MB+)

## Notes
- Do not put EXFAT `USBD.IRX` / `USBHDFSD.IRX` into the main `SYS-CONF` install path (can hang at logo)
- Credits for upstream FMCB/installer lineage: sp193, israpps — see main README
