# Ultimate FreeMcBoot Toolkit

Separate **modder** installer (not a “dev build”). Same FMCB/FHDB core as Features; different apps and menu.

## Audience

People who dump, test discs/media, manage saves/cards, and service consoles — not everyday game launching (use **Ultimate FreeMcBoot** for that).

## On-console apps (alpha)

| App | Role | Status |
|-----|------|--------|
| **ESR** | ESR-patched disc helper | Included (`BOOT/ESR.ELF`) |
| **SMS** | Simple Media System | Included (`BOOT/SMS.ELF`) |
| **PS2Ident** | Console / ROM identify & dump | Included (`APPS/PS2Ident.ELF`) |
| **Apollo Save Tool** | Saves (v1.0.2) | Included (`APPS/APOLLO.ELF`) |
| **Memory Card Annihilator** | MC backup / format (v2.2 packed) | Included (`APPS/MCA.ELF`) |
| Features baseline | OPL, wOPL, File Manager (R3Z), Cheats, Controller Tester | Included from Features `1966/INSTALL` |

## Layout

```
toolkit/
  README.md
  SYS-CONF/          ← source CNFs (FREEMCB / FREEHDB)
  INSTALL/           ← full install tree for packaging
```

## Versioning

Ship as its own zip / GitHub asset (`…-Toolkit-…`). Use the same patch/alpha rules as Features; do not label it “dev.”

## PC-side (document only)

hdl-dump, pfsshell, KELFTool, OPL NBD — link from docs, not installed to the memory card.
