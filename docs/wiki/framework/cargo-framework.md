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

{% raw %}
```cpp
class CfgVehicles {
    class yourVehicleBaseClass {
        ace_cargo_space = 4;  // Cargo space your vehicle has
        ace_cargo_hasCargo = 1;  // Enables cargo to be loaded inside the vehicle (1-yes, 0-no)
        ace_cargo_loadmasterTurrets[] = {{1}}; // If vehicle inherits from "Air", you can set this attribute.
                                             // When sitting in the turret paths you define here, you can paradrop cargo items. By default, pilots and co-pilots can paradrop cargo items.
    };
};
```
{% endraw %}

### 1.2 Making an object loadable

```cpp
class CfgVehicles {
    class staticBananaLauncher {
        ace_cargo_size = 4;  // Cargo space the object takes
        ace_cargo_canLoad = 1;  // Enables the object to be loaded (1-yes, 0-no)
        ace_cargo_noRename = 1;  // Blocks renaming object (1-blocked, 0-allowed)
        ace_cargo_blockUnloadCarry = 1; // Blocks object from being automatically picked up by player on unload
    };
};
```

<div class="panel callout">
    <h5>Note:</h5>
    <p>ace_cargo_hasCargo and ace_cargo_canLoad are only needed if you aren't inheriting from any of BI base classes or if you are trying to disable loading for a specific vehicle / object.</p>
</div>

### 1.3 Adding predefined cargo via config

```cpp
class CfgVehicles {
    class yourVehicleClass {
        ace_cargo_space = 4;  // Add if necessary
        ace_cargo_hasCargo = 1;  // Add if necessary
        class ace_cargo {
            class cargo {
                class ACE_medicalSupplyCrate { // Doesn't have to have the same name as the item you're adding
                    type = "ACE_medicalSupplyCrate";
                    amount = 1;
                };
            };
        };
    };
};
```

## 2. Events

### 2.1 Listenable

Event Name | Passed Parameter(s) | Locality | Description
---------- | ----------- | ------------------- | --------
`ace_cargoAdded` | [_itemClass, _vehicle, _amount] | Global | Cargo has been added to vehicle
`ace_cargoLoaded` | [_item, _vehicle] | Global | Cargo has been loaded into vehicle
`ace_cargoUnloaded` | [_item, _vehicle, _unloadType] | Global | Cargo has been unloaded from vehicle
`ace_cargoRemoved` | [_itemClass, _vehicle, _amountRequested, _amountRemoved] | Global | Cargo has been removed (deleted) from vehicle

## 3. Editor Attributes

In the 3D mission editor attributes for "Cargo Size" and "Cargo Space" are available on suitable objects. These can be adjusted to change the respective value on a per-object basis - as well as to enable loading for objects and vehicles which would usually not support it.

If you wish to enable loading for an object/vehicle which does not have these editor attributes, see the `ace_cargo_fnc_setSize` and `ace_cargo_fnc_setSpace` functions.

## 4. Scripting

### 4.1 Disabling cargo for a mission object

To disable cargo for a mission object use:

```sqf
[this, -1] call ace_cargo_fnc_setSize;
```

### 4.2 Adjusting cargo size of an object

`ace_cargo_fnc_setSize`
Note that this function can be used to make objects loadable/unloadable (set to `-1` to disable cargo interactions).

```sqf
 * Sets the cargo size of any object. Has global effect.
 * Adds the load action menu if necessary.
 * A negative size disables the object's cargo interactions.
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

```sqf
 * Sets the cargo space of any object. Has global effect.
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

`ace_cargo_fnc_loadItem` (Also callable from CBA event `ace_loadCargo`)
Note first argument can be a in-game object or a classname of an object type.

```sqf
 * Load an object into a vehicle.
 * Objects loaded via classname remain virtual until unloaded.
 *
 * Arguments:
 * 0: Item to be loaded <STRING> or <OBJECT>
 * 1: Holder object (vehicle) <OBJECT>
 * 2: Ignore interaction distance and stability checks <BOOL> (default: false)
 *
 * Return Value:
 * Object loaded <BOOL>
 *
 * Example:
 * [object, vehicle] call ace_cargo_fnc_loadItem
```

### 4.5 Unload cargo from vehicle 

`ace_cargo_fnc_unloadItem` (Also callable from CBA event `ace_unloadCargo`)

```sqf
 * Arguments:
 * 0: Item to be unloaded <STRING> or <OBJECT>
 * 1: Holder object (vehicle) <OBJECT>
 * 2: Unloader <OBJECT> (default: objNull)
 *
 * Return Value:
 * Object unloaded <BOOL>
 *
 * Example:
 * [object, vehicle] call ace_cargo_fnc_unloadItem
```

### 4.6 Remove/ Delete cargo from vehicle (Added in ACE3 3.11.0)

`ace_cargo_fnc_removeCargoItem`

```sqf
 * Arguments:
 * 0: Item to be removed <STRING> or <OBJECT>
 * 1: Holder object (vehicle) <OBJECT>
 * 2: Amount <NUMBER> (default: 1)
 *
 * Return Value:
 * Number of items removed <NUMBER>
 *
 * Example:
 * ["ACE_Wheel", vehicle, 2] call ace_cargo_fnc_removeCargoItem
 * [crate_7, truck] call ace_cargo_fnc_removeCargoItem
```

### 4.7 Disable cargo renaming via script

```sqf
cargoBox setVariable ["ace_cargo_noRename", true, _disableGlobally]
```
