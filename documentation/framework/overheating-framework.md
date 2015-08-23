---
layout: wiki
title: overheating framework
description:
group: framework
order: 5
parent: wiki
---

## 1. Adding barrel switching

```c++
class CfgWeapons {

    class Rifle_Long_Base_F;  // base class for LMGs and MMGs
    class your_MMG: Rifle_Long_Base_F {

        // Dispersion, SlowdownFactor and JamChance arrays have 4 values for different temperatures, which are interpolated between.
        // These values correspond to temperatures Converted to real life values: 0: 0°C, 1: 333°C, 2: 666°C, 3: 1000°C.

        ACE_Overheating_allowSwapBarrel = 1;  // 1 to enable barrel swap. 0 to disable. Meant for machine guns where you can easily swap the barrel without dismantling the whole weapon.

        // Dispersion in radians. First value is for temp. 0, second for temp. 1 and so on. Values inbetween get interpolated. Negative values get ignored and can be used to move the starting point to hotter temperatures.
        ACE_Overheating_Dispersion[] = {0, -0.001, 0.001, 0.004};

        // How much the projectile gets slowed down before leaving the barrel. 0.9 means the bullet will lose 10% velocity. Values inbetween get interpolated. Numbers greater 1 increase the velocity, smaller 1 decrease it.
        ACE_Overheating_SlowdownFactor[] = {1, 1, 1, 0.9};

        // Chance to jam the weapon. 0.0003 means 3 malfunctions on 10,000 rounds fired at this temperature. Values inbetween get interpolated. Negative values get ignored and can be used to move the starting point to hotter temperatures.
        // When no reliable data exists for temperature vs. jam chance except MRBS, the following uniform criteria was adopted: [0, 1/MRBS, 5/MRBS, 25/MRBS].
        ACE_Overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
    };
};
```

## 2. Adding custom animations

```c++
class CfgWeapons {

    class Rifle_Long_Base_F;
    class your_MMG: Rifle_Long_Base_F {
        ACE_clearJamAction = "GestureReload";  // Custom jam clearing action. Default uses reload animation.
        ACE_checkTemperatureAction = "Gear";  // Custom check temperature action. Default uses gear animation.
        ACE_clearJamAction = "";  // Custom jam clearing action. Use empty string to undefine.
    };
};
```
