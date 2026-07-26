# Ultimate FreeMcBoot (ashorizonends)

Fork of [israpps/FreeMcBoot-Installer](https://github.com/israpps/FreeMcBoot-Installer), which itself builds on the original FreeMcBoot / FreeHdBoot installer by **sp193** / Ysai.

This tree is the **ashorizonends.com** / Ultimate FreeMcBoot package: branded installer, updated apps, and a few install-flow tweaks aimed at real USB → memory card installs.

Site: [ashorizonends.com](https://ashorizonends.com)

---

## Credits (upstream)

- **sp193** – original FMCB/FHDB installer source
- **israpps (Matias Israelson)** – modern FreeMcBoot-Installer packages, EXFAT variant, packaging work
- **ps2homebrew** – Open PS2 Loader / wOPL (Double OPL)
- **jbit** / **ShendoXT** – pad tester lineage (see Controller Tester)
- Cheat Device – [root670](https://github.com/root670/CheatDevicePS2) / community builds

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
| Controller Tester | Replaces stock Pad Test with [ashorizonends Controller Tester](https://github.com/horizonends/controllertester) (`CONTROLLERTESTER.ELF`, `PADTEST.ELF` kept as fallback name) |
| Cheat Device | NTSC + PAL packages under `APPS/cheats-ntsc/` and `APPS/cheats-pal/` |
| Cheat Chooser | Optional `CHEAT_CHOOSER.ELF` in APPS (region picker; see [PS2-Cheat-Chooser](https://github.com/horizonends/PS2-Cheat-Chooser)) |
| wOPL | Non-beta Double OPL build from [wOPL releases](https://github.com/ps2homebrew/wOPL/releases) |

### What we did **not** rewrite

Core FMCB/FHDB install logic, MagicGate binding, multi-install behaviour (still discouraged/blocked as upstream), and the overall israpps packaging model are unchanged unless listed above.

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

- [horizonends/controllertester](https://github.com/horizonends/controllertester) – Controller Tester ELF
- [horizonends/PS2-Cheat-Chooser](https://github.com/horizonends/PS2-Cheat-Chooser) – NTSC/PAL Cheat Device picker + packages

---

## Licence / disclaimer

Same terms as upstream FreeMcBoot-Installer / original FMCB work. Not affiliated with Sony. Use at your own risk. Always keep backups of memory cards before formatting or installing.
