---
layout: wiki
title: Fire Framework
description: Explains how to ignite thing using CBA events.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 14
  patch: 0
---


## 1. Events

Use `CBA_fnc_serverEvent` to use the following features. Events are defined only on the server in the system.

### 1.1 Adding a new fire source

`ace_fire_addFireSource`

|    | Arguments | Type | Optional (default value) |
|----| --------- | ---- | ------------------------ |
| 0  | Source of flame | Object/Position ASL | Required |
| 1  | Radius of fire | Number | Required |
| 2  | Intensity of fire (1, 10] | Number | Required |
| 3  | Fire source ID | Array/Boolean/Code/Config/Group/Namespace/NaN/Number/Object/Side/String | Required |
| 4  | Condition to stop fire | Code | Optional (default: `{true}`) |
| 5  | Arguments to pass to condition | Any | Optional (default: `[]`) |

### 1.2 Removing fire source

`ace_fire_removeFireSource`

|    | Arguments | Type | Optional (default value) |
|----| --------- | ---- | ------------------------ |
| 0  | Fire source ID | Array/Boolean/Code/Config/Group/Namespace/NaN/Number/Object/Side/String  | Required |

## 2. Variables

Screams can be disabled for an individual unit by setting the `ace_fire_enableScreams` variable on the unit, which can be synced across machines.

```sqf
_unit setVariable ["ace_fire_enableScreams", false, _isGlobal];
```
