---
layout: wiki
title: Hearing Framework
description: Explains how to set-up headgear with ACE3 hearing system.
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

```cpp
class CfgWeapons {
    class MyHelmet {
        ace_hearing_protection = 0.80;  // Protection against deafening (0 to 1, higher means more protection)
        ace_hearing_lowerVolume = 0.60; // Muffling of the sound (0 to 1, higher means more muffling)
        ace_hearing_hasEHP = 1;         // Is electronic hearing protection (0 to disable, 1 to enable)
    };
};
```

The protection/muffling is a multiplier and not an absolute value, you can still be deafened/muffled with a value of 1.

```cpp
class CfgAmmo {
    class MyAmmo {
        ace_hearing_hearingDamageFactor = 0;    // Allows to tune how much hearing damage the ammo causes when being fired/exploding (default: 1)
                                                // Example: Removing hearing damage from throwables such as Molotovs
    };
};
```

You can define an upper limit on a magazine's loudness regardless of ammo used, which can be useful for large caliber guns with high rates of fire.

```cpp
class CfgMagazines {
    class MyLoudCannonMagazine {
        ace_hearing_maxLoudness = 2;
    };
};
```

## Temporarily disable Hearing adjusting the Volume

To temporarly disable ACE Hearing changing the volume use the global Variable `ace_hearing_disableVolumeUpdate`.

```sqf
ace_hearing_disableVolumeUpdate = true;
/*
your code with audio
*/
ace_hearing_disableVolumeUpdate = false;
```
