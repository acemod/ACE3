---
layout: wiki
title: Repair Framework
description: Explains how to set-up repair system.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 3
  patch: 0
---

## 1. Config Values

### 1.2 Setting Vehicle As Repair Location

A vehicle will be set as a repair truck based on the config `ace_repair_canRepair`.
Setting `fullRepairLocation` needs to be enabled and is by *disabled* default.

```cpp
class CfgVehicles: Car_F{
    class MyRepairTruck {
        ace_repair_canRepair = 1; // Make repair vehicle
    };
};
```

## 2. Variables

## 2.1 Make A Vehicle Into A Repair Truck

A vehicle can be turned into a repair truck by setting the variable `ace_repair_canRepair` to `1` to enable, `0` to disable.
- Setting `fullRepairLocation` needs to be enabled and is by *disabled* default.
- Can be set via 3den attribute.

```cpp
VEHICLE setVariable ["ace_repair_canRepair", 1, true];
```

## 2.2 Make An Object Into A Repair Facility

An object can be turned into a repair facility by setting the variable `ace_isRepairFacility` to `1` to enable, `0` to disable.
- Setting `fullRepairLocation` needs to be enabled and is by *disabled* default.
- Can be set via 3den attribute.
- Object cannot be a vehicle.

```cpp
OBJECT setVariable ["ace_isRepairFacility", 1, true];
```

## 2.3 Set Engineer Trait Level On Unit

Determines if a unit can repair damaged hitpoints and if so, how much can be restored. See ACE - Logistics settings for more details.
- Can easily be set via 3den attribute.

To set a units engineer trait level set the variable `ace_isEngineer` to:
- `0` / false: Untrained, only be able to replace wheels, based on settings.
- `1` / true: Engineer.
- `2` : Advanced Engineer, allowing a higher level of repairs, based on settings. (by default settings is the only one with access to full repair)

```cpp
UNIT setVariable ["ace_isEngineer", 1, true];
```
