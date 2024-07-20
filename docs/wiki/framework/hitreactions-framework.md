---
layout: wiki
title: Hit Reactions Framework
description: Explains how to set-up weapons with ACE3 hit reactions system.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 18
  patch: 0
---

## 1. Config Values

```cpp
class CfgWeapons {
    class MyWeapon {
         ace_hitreactions_undroppable = 1;  // Prevents weapon from being dropped
    };
};
```

## 2. Mission Variables

### 2.1 Safe pickup distance for AI

Allows 3rd party mods to set the distance between AI and the nearest hostile that is considered safe to go pickup a dropped weapon.
```sqf
ace_hitreactions_safePickupDistance = 10; // default is 8
```
