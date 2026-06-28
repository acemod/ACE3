---
layout: wiki
title: Recoil Framework
description: Recoil overhaul.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 3
  patch: 0
---


## 1. Configs

Custom recoil shake coef

```cpp
class CfgRecoils {
    class myRecoil {
        ace_recoil_customShakeCoef = 2; // default is 1
    };
};
```

## 2. Variables

Secondary launchers have extra shake, this can be refined by setting

`ace_recoil_extraLauncherShake = 10;` // default is 25
