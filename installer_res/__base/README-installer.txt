Ultimate FreeMcBoot installer (ashorizonends)
=============================================

This ELF installs FreeMcBoot (memory card) and FreeHdBoot (HDD).

Setup
-----
Keep this folder intact: INSTALL/, lang/, and the installer ELF(s) together on USB.
Run from USB mass storage.

Recommended: ashorizonends_Installer_EXFAT.elf
Fallback:    ashorizonends_Installer.elf

Install tips
------------
- Choose the correct memory card slot when asked.
- Format first if the card is messy or you want a clean install.
- On small (8MB) cards, choose Standard OPL only (not Both).
- After install, boot without USB if you hit odd USB-related issues.

Memory card dump / restore is available from the installer extras
(saves mc0.bin / mc1.bin next to the installer ELF).

Packages
--------
Features = players
Toolkit  = modders (separate package)

Site: https://ashorizonends.com
