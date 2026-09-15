---
layout: wiki
title: Missile CLGP Framework
description: Explains how to set-up ammo for the cannon-launched-guided-projectile system.
group: framework
parent: wiki
order: 7
mod: ace
version:
  major: 3
  minor: 19
  patch: 0
---

## 1. Overview

CLGP allows firing submunition shells that will deploy into missiles that can use the Missile Guidance framework.

## 2. Config Values

### 2.1 Example Config
```cpp
class CfgAmmo {
    class x_submunition: SubmunitionBase { // this ammo can be fired normally
        ace_missile_clgp_deployCondition = "your_fnc"; // function that returns true when it should be triggered
        ace_missile_clgp_artilleryDrag = 1;
        submunitionAmmo = "x_missile";
        class Eventhandlers {
            fired = "call ace_missile_clgp_fnc_submunition_ammoFired"; // need to add the EH yourself to all ammos
        };
    };

    class x_missile: MissileBase {
        class ace_missileguidance {
            enabled = 2;
            // rest of normal ace missile guidance config
```

### 2.2 Configs

`ace_missile_clgp_deployCondition`
- A function that will trigger the ammo when returning true, passed `[_projectile, _guidanceArgs]`
- Is optional, can just use normal submuntion triggers

`ace_missile_clgp_artilleryDrag`
- Optional (Leave undefined (or set to -1) to ignore)
- Used as a coefficient on drag from ace_artilleryTables's advancedCorrections
- Value of 0 is valid and will not apply drag but still keep nose pointed correctly (for unpowered missiles)

## 3. Note on adding magazines via mission

```cpp
if (local turretLocal [0]) then {
    this addMagazineTurret ["ace_1rnd_155mm_m712", [0]];
};
```
