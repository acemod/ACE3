---
layout: wiki
title: Overheating Framework
description: Explains how to set-up weapon overheating with ACE3 overheating system.
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

### 1.1 Barrel Switching

```cpp
class CfgWeapons {
    class Rifle_Long_Base_F ;

    class MyMG : Rifle_Long_Base_F {
        ace_overheating_mrbs = 3000; //Mean Rounds Between Stoppages (this will be scaled based on the barrel temp)
        ace_overheating_slowdownFactor = 1; //Slowdown Factor, reduces the velocity of the projectile (this will be scaled based on the barrel temp)
        ace_overheating_allowSwapBarrel = 1; // 1 to enable barrel swap. 0 to disable. Meant for machine guns where you can easily swap the barrel without dismantling the whole weapon.
        ace_overheating_dispersion = 0.75; //Dispersion Factor, increases the dispersion of the projectile (this will be scaled based on the barrel temp)
    };
};
```

### 1.2 Custom jam types

```cpp
class CfgWeapons {
    class Pistol_Base_F;
    class MyRevolver: Pistol_Base_F {
        ace_overheating_jamTypesAllowed[] = {"Fire", "Dud"}; // Allowed and default values are ["Eject", "Extract", "Feed", "Fire", "Dud"]. In the example here a revolver does not eject, extract, or feed on each shot so those values are removed.
    };
};
```
### 1.3 Custom jam clearing animation

```cpp
class CfgWeapons {
    class MyMG {
        ACE_clearJamAction = "GestureReloadMX"; // Custom jam clearing action. Default uses reload animation, use an empty string to undefine
    };
};
```

### 1.4 Cook Off

```cpp
class CfgWeapons {
    class Rifle_Base_F;
    class Rifle_Long_Base_F;

    class MyRifle: Rifle_Base_F {
        ace_overheating_closedBolt = 1; // Closed bolt, can cook off from barrel heat.
        ace_overheating_barrelMass = 1.5895; // Mass of the area heated by firing, not strictly just the barrel. Higher mass gives slower heat buildup and faster cooling. Default estimation is 55% of weapon weight in kg.
    };

    class MySniper: Rifle_Long_Base_F {
        ace_overheating_closedBolt = 1;
    };

    class MyMG: Rifle_Long_Base_F {
        ace_overheating_closedBolt = 0; // Open bolt, can only cook off on failure to fire type jams.
    };
};
```
