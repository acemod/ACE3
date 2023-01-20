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

## 1. Array Info

HunterKiller needs a 2 element array to know what seats to run on.
Each element is a tuple of a turret path and operating mode.
```cpp
// NO_ACTIONS = 0
// OBSERVE = 1
// OVERRIDE = 2
// OBSERVE_AND_OVERRIDE = 3
```


## 2. Configs

{% raw %}
```cpp
class CfgVehicles {
    class MyTankA {
        ace_hunterkiller = 1; // enable with default settings
    };
    class MyTankB {
        ace_hunterkiller[] = {{{0}, 1}, {{0,0}, 3}}; // Default settings: (gunner can observe, commander can observe and override gunner)
    };
    class MRAP_03_hmg_base_F {
        ace_hunterkiller[] = {{{0}, 1}, {{1}, 2}}; // e.g. vehicle where commander is [1] instead of [0,0]
    };
};
```
{% endraw %}

## 2. Variables

```cpp
this setVariable ["ace_hunterkiller", true]; // enable for vic using default settings
this setVariable ["ace_hunterkiller", [[[0], 1], [[0,0], 3]]]; // enable using custom array
this setVariable ["ace_hunterkiller", false]; // disabled
this setVariable ["ace_hunterkiller", []]; // disabled
```
