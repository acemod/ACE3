---
layout: wiki
title: Hellfire
description: AGM-114K Hellfire Missiles
group: feature
category: equipment
parent: wiki
mod: ace
version:
  major: 3
  minor: 10
  patch: 0
---

## 1. Overview

### 1.1 Guidance
Hellfire missile is a semi-active laser guided weapon.
It requires an observer (either the launch platform or an external source) to provide laser designation.

### 1.2 Attack profiles
Missile does not need line of sight to target when fired and can Lock-On-After-Launch (can also delay lasing target).
This and the attack profile used will effect missile's flight and max altitude.
- LOBL: Lock-On-Before-Launch, standard top attack.
- LOAL-DIR: Missile flies with a low altitude until acquiring a laser.
- LOAL-LOW: Missile immediately gains ~90m altitude.
- LOAL-HI: Missile immediately gains ~300m altitude.

## 2. Usage
- Switching to the hellfire weapon will show additional information about the weapon in weapon status display.
- Shows: lock mode, laser code and a laser receiver indicator.  E.G. `LOAL-DIR    CODE: 1111`
- Laser receiver indicator turns red when it detects a laser pulse set the the current code.
- Cycle attack profiles with vehicle's ACE3 Interaction Menu or with the missile guidance "Cycle Fire Mode" keybind (default: <kbd>Ctrl</kbd> + <kbd>Tab</kbd>)

## 3 Adding to vehicles
- Easiest way to add is via the 1.70 Pylons system.
- Hellfires can also be added to other vehicles via config or script.

### 3.1 Classnames
- Weapon: `ace_hellfire_launcher`
- Magazines: `6Rnd_ACE_Hellfire_AGM114K`
- Pylon Magazines: `PylonMissile_1Rnd_ACE_Hellfire_AGM114K`, `PylonRack_1Rnd_ACE_Hellfire_AGM114K`, `PylonRack_3Rnd_ACE_Hellfire_AGM114K`, `PylonRack_4Rnd_ACE_Hellfire_AGM114K`

### 3.2 Script Example
- Adding hellfires to the Cessna Civilian Plane:

```
if (local this) then {
    this addWeaponTurret ["ace_hellfire_launcher", [-1]];
    this addMagazineTurret ["6Rnd_ACE_Hellfire_AGM114K", [-1]];
};
```

## 4 Automaticly adding a laser designator
- Can automaticly add a laser designator if hellfire launcher is present
- Ideal for pylon dynamic loadouts

```cpp
class myChopper: HeliBase {
    ace_hellfire_addLaserDesignator = 1;
};
```

## 5. Dependencies

{% include dependencies_list.md component="hellfire" %}
