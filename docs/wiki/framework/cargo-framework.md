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
`ace_cargoRemoved` | [_itemClass, _vehicle, _amountRequested, _amountRemoved] | Global | Cargo has been removed (deleted) from vehicle

## 3. Editor Attributes

In the 3D mission editor attributes for "Cargo Size" and "Cargo Space" are available on suitable objects. These can be adjusted to change the respective value on a per-object basis - as well as to enable loading for objects and vehicles which would usually not support it.

If you wish to enable loading for an object/vehicle which does not have these editor attributes, see the `ace_cargo_fnc_setSize` and `ace_cargo_fnc_setSpace` functions.

## 4. Scripting

### 4.1 Disabling cargo for a mission object

To disable cargo for a mission object use:

```cpp
[this, -1] call ace_cargo_fnc_setSize;
```

### 4.2 Adjusting cargo size of an object

`ace_cargo_fnc_setSize`
Note that this function can be used to make objects loadable/unloadable (set to `-1` for unloadable).

```cpp
 * Set the cargo size of any object. Has global effect.
 * Adds the load action menu if necessary.
 * Negative size makes unloadable.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Cargo size <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object, 3] call ace_cargo_fnc_setSize
```

### 4.3 Adjusting cargo space of a vehicle

`ace_cargo_fnc_setSpace`
Note that this function can be used to enable/disable a vehicle's cargo space (set to `0` to disable).

```cpp
 * Set the cargo space of any object. Has global effect.
 * Adds the cargo action menu if necessary.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Cargo space <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, 20] call ace_cargo_fnc_setSpace
```

### 4.4 Load cargo into vehicle 

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

### 4.5 Unload cargo from vehicle 

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

### 4.6 Remove/ Delete cargo from vehicle (Added in ACE3 3.11.0)

`ace_cargo_fnc_removeCargoItem`

```cpp
 * Arguments:
 * 0: Item <STRING> or <OBJECT>
 * 1: Vehicle <OBJECT>
 * 2: Amount <NUMBER> (default: 1)
 *
 * Return Value:
 * Number of items removed <NUMBER>
 *
 * Example:
 * ["ACE_Wheel", vehicle, 2] call ace_cargo_fnc_removeCargoItem
 * [crate_7, truck] call ace_cargo_fnc_removeCargoItem
```
