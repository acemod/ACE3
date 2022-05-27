---
layout: wiki
title: HunterKiller Framework
description: Explains configs of the hunter-killer addon
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 15
  patch: 1
---

## 1. Config Values

```cpp
// NO_ACTIONS = 0
// OBSERVE = 1
// OVERRIDE = 2
// OBSERVE_AND_OVERRIDE = 3

class CfgVehicles {
    class MyTankA {
        ace_hunterkiller = 1; // enable with default settings
    };
    class MyTankB {
        ace_hunterkiller[] = {{{0}, 1}, {{0,0}, 3}}; // Default settings: (gunner can observer, commander can observe and override gunner)
    };
    class MRAP_03_hmg_base_F {
        ace_hunterkiller[] = {{{0}, 1}, {{1}, 2}}; // e.g. vehicle where commander is [1] instead of [0,0]
    };
};
```


## 2. Variables

```cpp
this setVariable ["ace_hunterkiller", [[[0], 1], [[0,0], 3]]]; // enable at mission
this setVariable ["ace_hunterkiller", []]; // disable via mission
```
