---
layout: wiki
title: Laser
description: Explains the functions available for laser designators.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 16
  patch: 4
---

## 1. Scripting

### 1.1. Get object's laser code

`ace_laser_fnc_getLaserCode`

|    | Arguments | Type | Optional (default value) |
|----| --------- | ---- | ------------------------ |
| 0  | Unit/Vehicle | Object | Required |
| **R** | Laser code | Number | Return value |

### 1.2. Set object's laser code

`ace_laser_fnc_setLaserCode`

|    | Arguments | Type | Optional (default value) |
|----| --------- | ---- | ------------------------ |
| 0  | Unit/Vehicle | Object | Required |
| 1  | Laser code | Number | Required |
| **R** | None | None | Return value |
