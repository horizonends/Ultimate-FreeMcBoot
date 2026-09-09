Ultimate FreeMcBoot (ashorizonends)
====================================

Site: https://ashorizonends.com

What this is
------------
A FreeMcBoot / FreeHdBoot installer package for real USB → memory card (and HDD) installs,
branded for ashorizonends.

Packages
--------
UFMCB-Features  — everyday players (OPL, File Manager, cheats, POPStarter, …)
UFMCB-Toolkit   — modders (Ident, Apollo, MCA, ESR, SMS, …) — separate folder / install

How to install (Features)
-------------------------
1. Copy the UFMCB-Features folder to a USB stick (keep INSTALL/ and lang/ with the ELF).
2. On the PS2, run ashorizonends_Installer_EXFAT.elf (preferred) or ashorizonends_Installer.elf.
3. Pick memory card slot; format if you want a clean card.
4. Prefer Standard OPL only on 8MB cards.
5. After install, try booting with the USB unplugged.

Important
---------
- SYS-CONF uses stock USB drivers for reliable boot (do not mix in optional EXFAT IRXes).
- Use ashorizonends_Installer_EXFAT.elf on exFAT USB sticks; ashorizonends_Installer.elf on FAT32.
- Only run the ashorizonends installer ELFs in this folder (not FMCBInstaller.elf from other packages).
- Always back up memory cards before formatting or installing.

Not affiliated with Sony. Use at your own risk.
