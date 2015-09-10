---
layout: wiki
title: Overheating Framework
description: Explains how to set-up weapon overheating with ACE3 overheating system.
group: framework
order: 5
parent: wiki
---

## 1. Config Values

### 1.1 Barrel Switching

```c++
class CfgWeapons {
    class MyMG {
        ace_overheating_allowSwapBarrel = 1;  // Enable barrel swap (0-disabled, 1-enabled) - information below
        ace_overheating_dispersion[] = {0, -0.001, 0.001, 0.004};  // Bullet dispersion (in radians) - information below
        ace_overheating_slowdownFactor[] = {1, 1, 1, 0.9};  // Slowdown factor inside the barrel - information below
        ace_overheating_jamChance[] = {0, 0.0003, 0.0015, 0.0075};  // Jam chance - information below
    };
};
```

#### 1.1.1 Temperatures

`ace_overheating_dispersion[]`  
`ace_overheating_slowdownFactor[]`  
`ace_overheating_jamChance[]`

Above arrays have 4 values for different temperatures, which are interpolated between. These values correspond to temperatures converted to real life values from.

Config | Real Life
------ | ---------
0      | 0°C
1      | 333°C
2      | 666°C
3      | 1000°C

### 1.1.2 Barrel Swapping

`ace_overheating_allowSwapBarrel`

Meant for machine guns where you can easily swap the barrel without dismantling the whole weapon.

### 1.1.3 Dispersion

`ace_overheating_dispersion[]`

Dispersion in radians. First value is for temperature 0, second for temperature 1 and so on. Values in-between get interpolated. Negative values are ignored and can be used to move the starting point to hotter temperatures.

### 1.1.4 Slowdown Factor

`ace_overheating_slowdownFactor[]`

How much the projectile gets slowed down before leaving the barrel. `0.9` means the bullet will lose 10% velocity. Values in-between get interpolated. Numbers greater than `1` increase the velocity, smaller decrease it.

### 1.1.5 Jam Chance

`ace_overheating_jamChance[]`

Chance to jam the weapon. `0.0003` means 3 malfunctions on 10,000 rounds fired at this temperature. Values in-between get interpolated. Negative values are ignored and can be used to move the starting point to hotter temperatures.

When no reliable data exists for temperature versus jam chance except MRBS, the following uniform criteria was adopted.  
`[0, 1/MRBS, 5/MRBS, 25/MRBS]`


### 1.2 Custom Animations

```c++
class CfgWeapons {
    class MyMG {
        ace_clearJamAction = "GestureReload";  // Custom jam clearing action, default uses reload animation
        ace_checkTemperatureAction = "Gear";  // Custom check temperature action, default uses gear animation
        ace_clearJamAction = "";  // Custom jam clearing action, use empty string to undefine
    };
};
```
