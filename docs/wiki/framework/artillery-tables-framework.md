---
layout: wiki
title: Artillery Tables
description: Explains the configs for artillery tables.
group: framework
parent: wiki
mod: ace
version:
  major: 3
  minor: 13
  patch: 0
---

## 1. Magazine Configs

```cpp
class CfgMagazines {
    class yourMag {
        ace_artillerytables_airFriction = -0.00006; // default value
        // drag coefficient (when Air Resistance setting is enabled)
        // can set to 0 to disable all muzzle effects and airFriction
        // can set to +1 to use the ammo's native airFriction (not common, as most artillery ammo will have none)
```

## 2. Vehicle Configs

```cpp
class CfgVehicles {
    class yourVic {
        ace_artillerytables_showRangetable = 1; // [0 disabled, 1 enabled] falls back to artilleryScanner
        // Show rangetable for this vehicle

        ace_artillerytables_showGunLaying = 1; // [0 disabled, 1 enabled, 2 enabled w/ alt elevationMode] falls back to artilleryScanner
        // Shows gun laying info (elev/azimuth)

        ace_artillerytables_applyCorrections = 1; // [0 disabled, 1 enabled] falls back to artilleryScanner
        // Apply advanced corrections (when setting enabled)
```
