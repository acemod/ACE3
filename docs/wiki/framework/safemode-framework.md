---
layout: wiki
title: Safemode Framework
description: Explains how to use the weapon safety API.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Scripting

### 1.1 Setting weapon safety status

`ace_safemode_fnc_setWeaponSafety`
If you want the state of the currently selected muzzle, either pass the muzzle by name or leave it blank (= `nil`).
If the unit doesn't have a weapon, its safety can't be locked, but it can be unlocked.

```sqf
 * Lock or unlock the given weapon based on weapon state.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: State <BOOL>
 * 3: Show hint <BOOL> (default: true)
 * 4: Muzzle <STRING> (default: current muzzle of weapon)
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety
```

### 1.2 Getting weapon safety status

`ace_safemode_fnc_getWeaponSafety`
If you want the state of the currently selected muzzle, either pass the muzzle by name or leave it blank (= `nil`).

```sqf
 * Getter for weapon safety state.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: Muzzle <STRING> (default: current muzzle of weapon)
 *
 * Return Value:
 * Safety status <BOOL>
 *
 * Example:
 * [ACE_player, currentWeapon ACE_player] call ace_safemode_fnc_getWeaponSafety
```
