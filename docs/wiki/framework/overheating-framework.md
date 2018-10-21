---
layout: wiki
title: Overheating Framework
description: Explains how to set-up weapon overheating with ACE3 overheating system.
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

### 1.1 Barrel Switching

```cpp
class CfgWeapons {
    class MyMG {
        ace_overheating_mrbs = 3000; //Mean Rounds Between Stoppages (this will be scaled based on the barrel temp)
        ace_overheating_slowdownFactor = 1; //Slowdown Factor (this will be scaled based on the barrel temp)
        ace_overheating_allowSwapBarrel = 1; // 1 to enable barrel swap. 0 to disable. Meant for machine guns where you can easily swap the barrel without dismantling the whole weapon.
        ace_overheating_dispersion = 0.75; //Dispersion Factor (this will be scaled based on the barrel temp)
    };
};
```

### 1.2 Custom jam clearing animation

```cpp
class CfgWeapons {
    class MyMG {
        ACE_clearJamAction = "GestureReloadMX"; // Custom jam clearing action. Default uses reload animation, use an empty string to undefine
    };
};
```
