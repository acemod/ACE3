---
layout: wiki
title: Check PBOs Framework
description: Explains how to set-up the Check PBOs system.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Check PBOs

If you are worried that players haven't updated ACE3 or other mods to the version you're using on the server, you can place the "Check PBOs" module on your map. You can choose one of 3 possible actions that are being executed when a player joins that has a wrong version of ACE3 or another mod:

- Warn once
- Warn permanent
- Kick

### 1.1 Whitelist

You can make a whitelist of mods that don't have to be on the server or are optional for clients. If you want to use the "Check all addons" option of this module and allow the usage of client side modifications like Blastcore or JSRS, you have to list them here.

The list must be in the following format: `["ADDON1","ADDON2",...]` where the strings are `CfgPatches` classes to all PBOs of the optional mod. To figure these out, you can use the script:

```sqf
copyToClipboard str ("true" configClasses (configFile >> "CfgPatches") apply {configName _x});
```

in the editor while those mods are enabled.

It is also possible to list [Regex patterns](https://community.bistudio.com/wiki/Arma_3:_Regular_Expressions) that match the `CfgPatches` classes (addons). Example: You want to whitelist JSRS 2025 and all its compat addons. In the case of JSRS 2025, all addons begin with the prefix `jsrs_soundmod_2025_`. Instead of listing each addon, you can now write the Regex pattern `jsrs_soundmod_2025_.+` to match all JSRS 2025 addons.

#### 1.1.1 Example 1

Mods: `@cyp_pushtohear_a3`

Whitelist: `["cyp_pushtohear_a3"]`

#### 1.1.2 Example 2

Mods: `@BC-Phoenix`

Whitelist: `["blastcore_sun", "blastcore_smokecs", "warfxpe", "blastcore_vep"]`


#### 1.1.3 Example 3

Mods: `@cyp_pushtohear_a3`, `@BC-Phoenix`

Whitelist: `["cyp_pushtohear_a3", "blastcore_sun", "blastcore_smokecs", "warfxpe", "blastcore_vep"]`

#### 1.1.4 Example 4

Mods: `@JSRS SOUNDMOD 2025 Beta - RC2.1`, `@JSRS SOUNDMOD 2025 Beta - AiO Compat Files RC2.1`

Whitelist (using Regex pattern): `["jsrs_soundmod_2025_.+"]`
