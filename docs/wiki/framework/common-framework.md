---
layout: wiki
title: Common Framework
description: Notes on ACE3 Common.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 14
  patch: 2
---

## 1. Config Values

### 1.1 `CfgWeapons`

```cpp
class CfgWeapons {
    class yourWeaponClass {
        ACE_unloadAction = "GestureUnloadMyWeaponClass"; // Animation to play when weapon is unloaded with ace_common_fnc_unloadUnitWeapon
        ACE_unloadSound = "A3\Sounds_F\arsenal\weapons\Rifles\Katiba\reload_Katiba.wss";  // Sound to play when weapon is unloaded with ace_common_fnc_unloadUnitWeapon
    };
};
```
