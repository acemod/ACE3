---
layout: wiki
title: Scopes Framework
description: Explains how to set-up scopes with ACE3 scope adjustment system.
group: framework
order: 5
parent: wiki
---

## 1. Adding scope adjustment support

```c++
class CfgWeapons {
    class InventoryOpticsItem_Base_F; // ItemInfo base class

    class YourScope {
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
};
```
