---
layout: wiki
title: Wirecutter Framework
description: Explains how to set-up items, backpacks and vests with ACE3 wirecutter system.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 16
  patch: 0
---

## 1. Config Values

```cpp
class CfgWeapons {
    class MyVest {
        ace_logistics_wirecutter_hasWirecutter = 1; //1 for true, 0 for false.
    };
    class MyItem {
        ACE_isWirecutter = 1; //1 for true, 0 for false.
    };
};
class CfgVehicles {
    class MyBackpack {
        ace_logistics_wirecutter_hasWirecutter = 1; //1 for true, 0 for false.
    };
};
```


## 2. Events

### 2.1 Listenable

Event Name | Description | Passed Parameter(s) | Locality
---------- | ----------- | ------------------- | --------
`ace_wireCuttingStarted` | Wire cutting started | `[_unit, _fence]` | Global
