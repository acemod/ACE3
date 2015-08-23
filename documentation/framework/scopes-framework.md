---
layout: wiki
title: Scopes framework
description:
group: framework
order: 5
parent: wiki
---

## 1. Adding scope adjustement support

```c++
class CfgWeapons {
    class ItemCore;
    class InventoryOpticsItem_Base_F;

    class yourHighPoweredScope : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -4, 30 };  // max vertical adjustement limits
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };  // max horizontal adjustement limits
        ACE_ScopeAdjust_VerticalIncrement = 0.1;  // vertical incrementation
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;  // horizontal incrementation
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
};
```
