---
layout: wiki
title: Overpressure Framework
description: Explains how to set-up launchers and cannons with backblast and overpressure areas with the ACE3 overpressure system.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Config Values

### 1.1 Man-Portable Launchers

```cpp
class CfgWeapons {
    class MyLauncher {
        ace_overpressure_angle = 60;    // Cone in which the damage is applied (in degrees from the back end of the launcher towards the side)
        ace_overpressure_range = 10;    // Range in meters in which the damage is applied
        ace_overpressure_damage = 0.7;  // Damage multiplier
        ace_overpressure_offset = 1;    // Offset from the projectile origin backwards, to where the backblast should originate (backblast is always directed backwards, regardless of the number's sign)
    };
};
```

### 1.2 Vehicle-mounted/Static Cannons, forward-facing overpressure

```cpp
class CfgWeapons {
    class MyBananaCannon {
        ace_overpressure_angle = 90;    // Cone in which the damage is applied (in degrees from the muzzle of the cannon towards the side)
        ace_overpressure_range = 50;    // Range in meters in which the damage is applied
        ace_overpressure_damage = 0.85; // Damage multiplier
        ace_overpressure_offset = 1;    // Offset from the projectile origin forward, to where the overpressure should originate (positive number to direct the overpressure forward)
    };
};
```

- You can note that the angle, range and damage values are higher, that's because this is a cannon and the overpressure area is much larger.

### 1.3 Vehicle-mounted/Static Missile launchers and Recoilless Guns, rear-facing overpressure

```cpp
class CfgWeapons {
    class MyStaticATGM {
        ace_overpressure_angle = 60;    // Cone in which the damage is applied (in degrees from the back end of the launcher towards the side)
        ace_overpressure_range = 15;    // Range in meters in which the damage is applied
        ace_overpressure_damage = 0.8;  // Damage multiplier
        ace_overpressure_offset = -1;   // Offset from the projectile origin backwards, to where the backblast should originate (negative number to direct the overpressure backwards)
    };
};
```

## 2. Events

### 2.1 Listenable

| Event Name | Description | Passed Parameter(s) | Locality |
| ---------- | ----------- | ------------------- | -------- |
| `ace_overpressure` | Overpressure damage inflicted | `[_firer, _posASL, _direction, _weapon, _magazine, _ammo]` | Target |
