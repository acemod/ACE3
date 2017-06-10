---
layout: wiki
title: Cargo Framework
description: Explains how to set-up the cargo framework for custom objects and vehicles.
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

### 1.1 Preparing a vehicle for ACE3 cargo

```cpp
class CfgVehicles {
    class yourVehicleBaseClass {
        ace_cargo_space = 4;  // Cargo space your vehicle has
        ace_cargo_hasCargo = 1;  // Enables cargo to be loaded inside the vehicle (1-yes, 0-no)
    };
};
```

### 1.2 Making an object loadable

```cpp
class staticBananaLauncher {
    class yourVehicleBaseClass {
        ace_cargo_size = 4;  // Cargo space the object takes
        ace_cargo_canLoad = 1;  // Enables the object to be loaded (1-yes, 0-no)
    };
};
```

<div class="panel callout">
    <h5>Note:</h5>
    <p>ace_cargo_hasCargo and ace_cargo_canLoad are only needed if you aren't inheriting from any of BI base classes or if you are trying to disable loading for a specific vehicle / object.</p>
</div>


## 2. Events

### 2.1 Listenable

Event Name | Passed Parameter(s) | Locality | Description
---------- | ----------- | ------------------- | --------
`ace_cargoLoaded` | [_item, _vehicle] | Global | Cargo has been Loaded into vehicle
`ace_cargoUnloaded` | [_item, _vehicle] | Global | Cargo has been Unloaded from vehicle

## 3. Scripting

### 3.1 Disabling cargo for a mission object

To disable cargo for a mission object use:

```cpp
this setVariable ["ace_cargo_size", -1];
```

### 3.2 Add cargo to vehicle 

`ace_cargo_fnc_loadItem` (Also callable from cba event `ace_loadCargo`)
Note first arg can be a in-game object or a classname of an object type.

```cpp
 * Arguments:
 * 0: Item <OBJECT or STRING>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * Object loaded <BOOL>
 *
 * Example:
 * [object, vehicle] call ace_cargo_fnc_loadItem
```

### 3.3 Unload cargo from vehicle 

`ace_cargo_fnc_unloadItem` (Also callable from cba event `ace_unloadCargo`)

```cpp
 * Arguments:
 * 0: Item <OBJECT or STRING>
 * 1: Vehicle <OBJECT>
 * 2: Unloader <OBJECT> (default: objNull)
 *
 * Return Value:
 * Object was unloaded <BOOL>
 *
 * Example:
 * [object, vehicle] call ace_cargo_fnc_unloadItem
```
