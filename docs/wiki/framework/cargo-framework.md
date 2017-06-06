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

### 2.2 Callable

Event Name | Passed Parameter(s) | Locality | Description
---------- | ----------- | ------------------- | --------
`ace_addCargo` | [_item (CLASSNAME or OBJECT), _vehicle, _cargoCount] | Target | Scripted way to add cargo to vehicle
`ace_loadCargo` | `[_object, _vehicle, _showHint]` | Target | Load object into vehicle.
`ace_unloadCargo` | `[_object, _vehicle]` | Target | Unload object from vehicle.


## 3. Scripting

### 3.1 Disabling cargo for a mission object

To disable cargo for a mission object use:

```cpp
this setVariable ["ace_cargo_size", -1];
```
