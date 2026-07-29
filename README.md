# Ultimate FreeMcBoot (ashorizonends)

Fork of [israpps/FreeMcBoot-Installer](https://github.com/israpps/FreeMcBoot-Installer), which itself builds on the original FreeMcBoot / FreeHdBoot installer by **sp193** / Ysai.

This tree is the **ashorizonends.com** / **Ultimate FreeMcBoot** package: branded installer, updated apps, and a few install-flow tweaks aimed at real USB → memory card installs.

Site: [ashorizonends.com](https://ashorizonends.com)

### Packages

| Package | Audience | Role |
|---------|----------|------|
| **Ultimate FreeMcBoot** | Everyday players | Features — FMCB/FHDB, OPL/wOPL, File Manager, Controller Tester, Cheat Device, **POPStarter** |
| **Ultimate FreeMcBoot Toolkit** | Modders | Separate installer — PS2Ident, Apollo, MC tools, **ESR**, **SMS**, disc/media helpers, advanced utilities (not a “dev build”) |
| **OSDMenu** *(planned)* | Alternate menu | Separate installer — OSDMenu path vs classic FMCB OSD |

App-only bumps ship as patch versions (`1.0.x`); experimental app sets can use GitHub pre-releases (alphas) without renaming Toolkit as “dev.”

### USB / zip folder names

Keep installer **folder** names short for the PS2 file browser and USB sticks. Put the version in `title.cfg` (and in GitHub zip filenames), not in the folder name:

| USB folder | Package | `title.cfg` example |
|------------|---------|---------------------|
| `UFMCB-Features` | Everyday player installer | `title=UFMCB Features v1.0.3-alpha.5` |
| `UFMCB-Toolkit` | Modder installer | `title=UFMCB Toolkit v1.0.3-alpha.5` |

Release zip names stay descriptive for GitHub:

- `UFMCB-Features-v1.0.3-alpha.5.zip` (contains `UFMCB-Features/`)
- `UFMCB-Toolkit-v1.0.3-alpha.5.zip` (contains `UFMCB-Toolkit/`)

To refresh a stick at `/run/media/sammy/PS2`: `./scripts/sync-ufmcb-usb.sh`

### Memory card install size (v1.0.3-alpha.5)

Approximate space written to the **memory card** (SYS-CONF + BOOT + APPS, 1 KiB cluster roundup). Installer UI floors to whole MB. APPS-HDD / FSCK are HDD-only and not counted here.

| Package | Standard OPL | Double OPL | Both OPLs |
|---------|-------------:|-----------:|----------:|
| **Features** | **6.74 MB** (shows 6) | **6.91 MB** (shows 6) | **8.21 MB** (shows 8) |
| **Toolkit** | **9.84 MB** (shows 9) | **10.01 MB** (shows 10) | **11.31 MB** (shows 11) |

Notes:
- An **8 MB** card fits Features with a **single** OPL choice; **both** OPLs needs more free space.
- Toolkit needs a larger card (~16 MB+ recommended).
- Cheats ship one `cheatdevice.elf` per region (NTSC/PAL); no duplicate `CHEATDEVICE.ELF`. No stock PADTEST — Controller Tester only.

### Version pairing (Features ↔ Toolkit)

Ship matching numbers so Features and Toolkit stay aligned:

| Features | Toolkit |
|----------|---------|
| `vX.Y.Z` | `vX.Y.Z` (Toolkit package) |
| `vX.Y.Z-alpha.N` | `vX.Y.Z-alpha.N` (Toolkit package) |

Example: Features `v1.0.3-alpha.5` pairs with Toolkit `v1.0.3-alpha.5` (separate zips / folders).

**POPStarter** (`POPSTARTER.ELF`) is included in the Features package (and Toolkit). **OSDMenu** remains a planned separate installer.

---

## Credits

### Upstream

- **sp193** – original FMCB/FHDB installer source
- **israpps (Matias Israelson)** – modern FreeMcBoot-Installer packages, EXFAT variant, packaging work
- **ps2homebrew** – Open PS2 Loader / wOPL (Double OPL)
- **[saildot4k / wLaunchELF_R3Z](https://github.com/saildot4k/wLaunchELF_R3Z)** – file browser / ELF launcher (bundled as `BOOT.ELF`)
- **jbit** / **ShendoXT** – pad tester lineage (Controller Tester remake is inspired by their work)
- Cheat Device – [root670](https://github.com/root670/CheatDevicePS2) / community builds

### Related ashorizonends projects

- **[Controller Tester](https://github.com/horizonends/controllertester)** – pad tester remake (inspired by jbit / ShendoXT); bundled as `CONTROLLERTESTER.ELF`

Everything below is **what this fork changes** on top of israpps’ installer.

---

## Changes vs israpps FreeMcBoot-Installer

### Installer UI / flow

| Change | Detail |
|--------|--------|
| Branding | Custom wallpaper (`installer/resources/background.png`), version stamp **ashorizonends** |
| Memory card slot | Explicit **slot 1 / slot 2** prompt instead of relying on R1 extras menus |
| Format before install | Asks whether to **format the card before installing** |
| OPL choice | During FMCB/FHDB install: **Standard OPL**, **Double OPL**, or **Both** (only selected ELF(s) are copied) |

### 1.966 install package (`installer_res/1966/INSTALL`)

| Change | Detail |
|--------|--------|
| Menu branding | OSD header: **Ultimate FreeMcBoot [ashorizonends.com]** |
| Dual OPL | **Open PS2 Loader** (`OPNPS2LD.ELF`) and **Double OPL** (`WOPNPS2LD.ELF`) as separate menu items |
| Controller Tester | [ashorizonends Controller Tester](https://github.com/horizonends/controllertester) only (`CONTROLLERTESTER.ELF`); old Pad Test (`PADTEST.ELF`) removed |
| Cheat Device | NTSC + PAL packages under `APPS/cheats-ntsc/` and `APPS/cheats-pal/` |
| wOPL | Non-beta Double OPL build from [wOPL releases](https://github.com/ps2homebrew/wOPL/releases) |
| File Manager | [wLaunchELF_R3Z](https://github.com/saildot4k/wLaunchELF_R3Z) v4.76 replaces uLaunchELF as `BOOT.ELF` (OSD **File Manager**) |
| Features menu | Player-focused: OPL / wOPL / Cheats / Controller Tester / **POPStarter** / Launch Disc / File Manager (**ESR** & **SMS** moved to Toolkit) |
| USB drivers (MC) | Default `INSTALL/SYS-CONF` ships **stock** `USBD.IRX` / `USBHDFSD.IRX` (avoids FMCB logo hang). **EXFAT** copies stay under `FMCB_EXFAT/` and `READY_TO_USE/`; optional after install. POPStarter keeps EXFAT IRXes under `APPS/POPSTARTER/` |

### What we did **not** rewrite

Core FMCB/FHDB install logic, MagicGate binding, multi-install behaviour (still discouraged/blocked as upstream), and the overall israpps packaging model are unchanged unless listed above.

---


### USB mass-storage drivers on the memory card

The **default install** copies **stock** (FAT) `USBD.IRX` / `USBHDFSD.IRX` into `mc?:/SYS-CONF`. That matches classic FMCB and avoids a logo-screen hang seen with EXFAT drivers in SYS-CONF.

**EXFAT** drivers remain available for USB sticks/apps that need them:
- `FMCB_EXFAT/SYS-CONF/` in the package (manual copy / EXFAT path instructions)
- `installer_res/READY_TO_USE/FreeMcBoot/SYS-CONF/`
- POPStarter companions under `INSTALL/APPS/POPSTARTER/` (`usbd.irx` / `usbhdfsd.irx`)

The **EXFAT installer ELF** (`ashorizonends_Installer_EXFAT.elf`) only affects reading the *installer media*; it does not require EXFAT IRXes on the memory card.

---
## Built installer ELFs

After `make rebuild` in `installer/`:

| File | Use |
|------|-----|
| `installer_res/ashorizonends_Installer_EXFAT.elf` | **Preferred** from exFAT / modern USB |
| `installer_res/ashorizonends_Installer.elf` | Non-EXFAT USB |
| `FMCBInstaller*.elf` | Same builds under the classic filenames |

Run the ELF from the folder that also contains `INSTALL/` and `lang/` (same layout as upstream packages).

---

## Build (Podman / Docker)

Needs [ps2dev](https://github.com/ps2dev/ps2dev):

```bash
cd installer
podman run --rm -v "$PWD/..":/src:Z -w /src/installer docker.io/ps2dev/ps2dev:v1.0 \
  sh -c 'apk add --no-cache build-base >/dev/null && \
    make rebuild FMCB_INSTALLER_VERSION=ashorizonends EE_BIN_DIR=../installer_res/ && \
    make rebuild FMCB_INSTALLER_VERSION=ashorizonends EE_BIN_DIR=../installer_res/ EXFAT=1'
```

Then copy `UNC_FMCBInstaller*.elf` to `ashorizonends_Installer*.elf` if your Makefile does not already.

---

## Related projects

Same ashorizonends effort as this installer (also credited above):

- [horizonends/controllertester](https://github.com/horizonends/controllertester) – Controller Tester ELF

---

## Licence / disclaimer

Same terms as upstream FreeMcBoot-Installer / original FMCB work. Not affiliated with Sony. Use at your own risk. Always keep backups of memory cards before formatting or installing.
