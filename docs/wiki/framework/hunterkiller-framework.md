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
  patch: 0
---

## 1. Config Values

```cpp
class CfgVehicles {
    class MyTank {
        ace_hunterkiller_enabled = 1; // required
        ace_hunterkiller_puppetTurret[] = {0}; // rarely used, default of [0] will be correct for most vehicles 
        ace_hunterkiller_masterTurret[] = {1}; // rarely used, default of [0,0] will be correct for most vehicles 
    };
};
```


## 2. Variables

```cpp
this setVariable ["ace_hunterkiller_enabled", true]
```
