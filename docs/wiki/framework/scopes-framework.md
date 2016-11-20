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
        ace_scopeZeroRange = 100; // Overwrites the ace_setting default zero range
        ace_scopeHeightAboveRail = 3.8;  // Distance between center of scope and rail in centimeters
        ace_scopeAdjust_vertical[] = {-4, 30};  // Maxmimum vertical adjustment limits
        ace_scopeAdjust_horizontal[] = {-6, 6};  // Maximum horizontal adjustment limits
        ace_scopeAdjust_verticalIncrement = 0.1;  // Vertical increment
        ace_scopeAdjust_horizontalIncrement = 0.1;  // Horizontal increment
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
        ace_railHeightAboveBore = 1.8;  // Distance between center of bore and rail in centimeters
    };
};
```

All scope config entries can also be applied directly to the weapon class, in case the weapon comes with an integrated scope.
