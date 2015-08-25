---
layout: wiki
title: Overpressure Framework
description: Explains how to set-up launchers and cannon backblasts with ACE3 overpressure system.
group: framework
order: 5
parent: wiki
---

## 1. Config Values

### 1.1 Launchers

```c++
class CfgWeapons {

    class MyLauncher {
        ACE_overpressure_angle = 60;  // cone in which the damage is applied (in degrees from the back end of the launcher)
        ACE_overpressure_range = 15;  // range in meters in which the damage is applied
        ACE_overpressure_damage = 0.7;  // damage multiplier
    };
};
```

### 1.2 Cannons

```c++
class CfgWeapons {

    class MyBananaCannon {
        ACE_overpressure_angle = 90;  // cone in which the damage is applied (in degrees from the muzzle of the cannon)
        ACE_overpressure_range = 50;  // range in meters in which the damage is applied
        ACE_overpressure_damage = 0.85;  // damage multiplier
    };
};
```

- You can note that the angle range and damage are higher, that's because this is a cannon and the backblast is higher.
