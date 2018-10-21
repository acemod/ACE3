---
layout: wiki
title: Advanced Ballistics Framework
description: Explains how to use the Advanced Ballistics framework.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Configs Values

Reference [CfgAmmo Reference](https://github.com/acemod/ACE3/blob/master/extras/CfgAmmoReference.hpp) for examples of bullets with correct configs. It is probably best to modify an example that's close to the bullet you are trying to add.

<div class="panel callout">
    <h5>All values are in METRIC units!</h5>
</div>

### 1.1 `CfgWeapons`

Example: M4

```cpp
class CfgWeapons {
    class yourWeaponClass {
        // >1:7 inch rifle twist
        // 7 inches * 25.4(mm/in) = 177.8 mm
        // Same as the Capital T in [Miller twist rule](https://en.wikipedia.org/wiki/Miller_twist_rule){:target="_blank"} (convert to metric)
        ACE_barrelTwist = 177.8;

        // >14.5 in (370 mm)
        ACE_barrelLength = 368.3;

        // Right handed is 1, Left is -1, none is 0
        // Leaving blank will default to 1 (almost everything is right-handed)
        // A smooth-bore gun (e.g. shotgun) would be `0`.
        ACE_twistDirection = 1;
    };
};
```

### 1.2 `CfgAmmo`

Example: `B_556x45_Ball`

```cpp
class CfgAmmo {
    class yourAmmoClass {
        // Bullet diameter in mm (diameter is a little different from caliber)
        ACE_caliber = 5.69;

        ACE_bulletLength = 23.012;  // Bullet Length in mm
        ACE_bulletMass = 4.0176;  // Mass in grams (example is roughly 62 grains)

        // Standard deviation of the muzzle velocity variation in percent
        // Example: With a muzzle velocity of 850 m/s and a standard deviation of 0.35%, 68% of the shots will be between 847 m/s and 853 m/s
        ACE_muzzleVelocityVariationSD = 0.35;

        // Array of muzzle velocity shifts in m/s with 11 data points from -15 °C to 35 °C
        // Example: At 0°C the shift will be -21.0
        ACE_ammoTempMuzzleVelocityShifts[] = {-27.20, -26.44, -23.76, -21.00, -17.54, -13.10, -7.95, -1.62, 6.24, 15.48, 27.75};

        // Array of ballistic coefficients (contains one element more than the velocity boundary array)
        ACE_ballisticCoefficients[] = {0.151};

        ACE_velocityBoundaries[] = {};  // Array of velocity boundaries
        ACE_standardAtmosphere = "ASM";  // "ASM" or "ICAO"
        ACE_dragModel = 7;  // Number that specifies the drag model [1, 2, 5, 6, 7, 8]

        // Array of muzzle velocities (same size as barrel length array)
        ACE_muzzleVelocities[] = {723, 764, 796, 825, 843, 866, 878, 892, 906, 915, 922, 900};

        // Array of barrel lengths (same size as muzzle velocity array)
        // Example, when shooting with the M4 barrel (`368.3`mm).
        // The length is between the 5th and 6th barrelLengths (`360.68, 391.16`).
        // So the muzzle velocity will be between 5th and 6th muzzleVelocities (`866, 878`).
        ACE_barrelLengths[] = {210.82, 238.76, 269.24, 299.72, 330.2, 360.68, 391.16, 419.1, 449.58, 480.06, 508.0, 609.6};
    };
};
```
