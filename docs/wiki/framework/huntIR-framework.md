---
layout: wiki
title: HuntIR Framework
description: Explains how to add HuntIR support to a weapon.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 1
  patch: 0
---

## 1. Config Values

```cpp
class CfgWeapons {
  class MyRifle {
      class MyGL: UGL_F {
          magazines[] = {
              // All default UGL magazines
              "MyFirstMag",
              "MySecondMag",
              "MyLastMag",
              // HuntIR magazine
              "ACE_HuntIR_M203"
          };
      };  
  };
};
```

## 2. Player Animation

Player animation when entering the HuntIR Monitor can be disabled by setting `ace_huntir_animatePlayer` to `false`.

```sqf
// Disable player animation locally
missionNamespace setVariable ["ace_huntir_animatePlayer", false];

// Disable player animation for everyone
missionNamespace setVariable ["ace_huntir_animatePlayer", false, true];
```
