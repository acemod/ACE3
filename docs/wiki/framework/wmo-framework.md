---
layout: wiki
title: Walkable Objects Framework
description: Explains how to control which objects units can walk on, and how to hook the anchoring events.
group: framework
order: 0
parent: wiki
mod: ace
version:
  major: 3
  minor: 20
  patch: 0
---

## 1. Config Values

### 1.1 Making an object walkable

By default land vehicles, air vehicles and ships are walkable, and everything else is
not. `ace_wmo_walkable` overrides that for a class and everything
inheriting from it.

```cpp
class CfgVehicles {
    class MyBaseClass;
    class MyObject: MyBaseClass {
        ace_wmo_walkable = 1; // 1 walkable, 0 excluded, -1 use the default
    };
};
```

`-1` is the inherited default and means "decide from the object kind", so a class only
needs the property when it differs from that.

Excluding a class is the more common case. A parachute canopy is technically an air
vehicle, but standing on one is never wanted:

```cpp
class ParachuteBase;
class MyParachute: ParachuteBase {
    ace_wmo_walkable = 0;
};
```

### 1.2 Objects without a config entry

Some engine objects, such as rope segments, have no `CfgVehicles` class to carry the
property. Those are excluded at runtime by classname:

```sqf
ace_wmo_excludedClasses set ["MyEngineClass", true];
```

## 2. Events

Both events are raised locally on the machine of the unit doing the walking.

| Event | Arguments | Raised when |
|-------|-----------|-------------|
| `ace_wmo_anchored` | `[_unit, _anchor]` | Unit starts being carried by an object |
| `ace_wmo_detached` | `[_unit, _anchor]` | Unit stops being carried |

```sqf
["ace_wmo_anchored", {
    params ["_unit", "_anchor"];
    systemChat format ["%1 is riding %2", name _unit, typeOf _anchor];
}] call CBA_fnc_addEventHandler;
```

`ace_wmo_anchor` holds the current anchor, or `objNull` when the unit is
not being carried:

```sqf
private _anchor = ace_wmo_anchor;
```
