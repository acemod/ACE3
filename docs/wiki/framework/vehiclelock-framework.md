---
layout: wiki
title: Vehicle Lock Framework
description: Explains how to configure the Vehicle Lock system.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Overview

These modules allow you to lock and unlock vehicles and their inventory using a key. Players don't receive a key automatically.

## 2. Mission Setup

Vehicle Lock can be configured through a mission module or [functions](#scripting).

For key names, see [Class Names](../class-names.html#vehicle-lock).

Sync the module with vehicles and players. Custom keys will be handed to players for every synced vehicle. It is only valid for objects present at mission start.


## 3. Scripting

### 3.1 Assing Vehicle Key

`ace_vehiclelock_fnc_addKeyForVehicle`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Unit | Object | Required
1  | Vehicle | Object | Required
2  | Use Custom Key | Boolean | Optional (default: `false`, `false` for side key, `true` for custom key)
**R** | None | None | Return value

#### 3.1.1 Example

`[bob, car1, true] call ace_vehiclelock_fnc_addKeyForVehicle;`

   | Arguments | Explanation
---| --------- | -----------
0  | `bob` | Unit the key will be added to
1  | `car1` | Vehicle the key will work on
2  | `true` | Set custom key

### 3.2 Override Side

To override a vehicle's side, allowing locking and unlocking using a different side's key, use the following on that vehicle (use wanted side instead of `west`):

```js
this setVariable ["ace_vehiclelock_lockSide", west];
```

### 3.3 Set Lock Pick Strength

To override default lock pick strength for a vehicle, that is how long lock picking will take, use the following on that vehicle (use wanted time in seconds instead of `5`):

```js
this setVariable ["ace_vehiclelock_lockpickStrength", 5];
```
