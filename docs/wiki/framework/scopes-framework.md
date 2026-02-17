---
layout: wiki
title: Scopes Framework
description: Explains how to set-up scopes with ACE3 scope adjustment system.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Adding scope adjustment support

```cpp
class CfgWeapons {
    class InventoryOpticsItem_Base_F; // ItemInfo base class

    class YourScope {
        ACE_ScopeZeroRange = 100; // Overwrites the ace_setting default zero range
        ACE_ScopeHeightAboveRail = 3.8;  // Distance between center of scope and rail in centimeters
        ACE_ScopeAdjust_vertical[] = {-4, 30};  // Maxmimum vertical adjustment limits
        ACE_ScopeAdjust_horizontal[] = {-6, 6};  // Maximum horizontal adjustment limits
        ACE_ScopeAdjust_verticalIncrement = 0.1;  // Vertical increment
        ACE_ScopeAdjust_horizontalIncrement = 0.1;  // Horizontal increment
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    
    class YourWeapon {
        ACE_RailHeightAboveBore = 1.8;  // Distance between center of bore and rail in centimeters
        ACE_RailBaseAngle = 0.025; // Angular difference between bore and rail axis in degrees
        ACE_IronSightBaseAngle = -0.138; // Angular difference between bore and iron sight axis in degrees
    };
};
```

All scope config entries can also be applied directly to the weapon class, in case the weapon comes with an integrated scope.
