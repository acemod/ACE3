---
layout: wiki
title: Overpressure Framework
description: Explains how to set-up launchers and cannons with backblast and overpressure areas with the ACE3 overpressure system.
group: framework
order: 5
parent: wiki
---

## 1. Config Values

### 1.1 Launchers

```c++
class CfgWeapons {
    class MyLauncher {
        ace_overpressure_angle = 60;  // Cone in which the damage is applied (in degrees from the back end of the launcher)
        ace_overpressure_range = 15;  // Range in meters in which the damage is applied
        ace_overpressure_damage = 0.7;  // Damage multiplier
    };
};
```

### 1.2 Cannons

```c++
class CfgWeapons {
    class MyBananaCannon {
        ace_overpressure_angle = 90;  // Cone in which the damage is applied (in degrees from the muzzle of the cannon)
        ace_overpressure_range = 50;  // Range in meters in which the damage is applied
        ace_overpressure_damage = 0.85;  // Damage multiplier
    };
};
```

- You can note that the angle range and damage values are higher, that's because this is a cannon and the backblast area is bigger.


## 2. Events

### 2.1 Listenable

Event Name | Description | Passed Parameter(s) | Locality
---------- | ----------- | ------------------- | --------
`"overpressure"` | Overpressure damage inflicted | `[_firer, _position, _direction, _weapon]` | Target
