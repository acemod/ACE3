---
layout: wiki
title: Trenches Framework
description: Explains how to set-up surface whitelisting and entrenching tools.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 5
  patch: 0
---

## 1. Config Values

### 1.1 Whitelisting surfaces for digging

Single surfaces can be whitelisted by adding `ACE_canDig = 1` into `CfgSurfaces`.
```cpp
class CfgSurfaces {
    class myAwesomeSurface {
        ACE_canDig = 1;
    };
};
```

### 1.2 Enabling entrenching tool features on an item or backpack

```cpp
class CfgWeapons { // same config also works on backpacks (CfgVehicles)
    class yourBaseClass;
    class yourEntrenchingToolClass: yourBaseClass
        ace_trenches_entrenchingTool = 1;
    };
};
```

## 2. Scripting

### 2.1 Checking if unit has entrenching tool

`ace_trenches_fnc_hasEntrenchingTool`
Used to check if unit has any entrenching capable tool.

```sqf
 * Checks if unit has entrenching tool.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Has entrenching tool <BOOL>
 *
 * Example:
 * [bob] call ace_trenches_fnc_hasEntrenchingTool
```
