---
layout: wiki
title: Cargo Framework
description: Explains how to set-up the cargo framework for custom objects and vehicles.
group: framework
order: 5
parent: wiki
---

## 1. Config Values

### 1.1 Preparing a vehicle for ACE3 cargo

```c++
class CfgVehicles {
    class yourVehicleBaseClass {
        ace_cargo_space = 4;  // Cargo space your vehicle has
        ace_cargo_hasCargo = 1;  // Enables cargo to be loaded inside the vehicle (1-yes, 0-no)
    };
};
```

### 1.2 Making an object loadable

```c++
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

Event Name | Description | Passed Parameter(s) | Locality
---------- | ----------- | ------------------- | --------
`cargoLoaded` | Cargo has been loaded | ` [_item, _vehicle]` | Global
`cargoUnloaded` | Cargo has been unloaded | `[_item, _vehicle]` | Global
`cargoAddedByClass` | Cargo items have been added | `[_itemClass, _vehicle, _amount]` | Global

### 2.2 Callable

Event Name | Description | Passed Parameter(s) | Locality
---------- | ----------- | ------------------- | --------
`LoadCargo` | Load object into vehicle. | `[_object, _vehicle, _showHint]` | Local
`UnloadCargo` | Unload object from vehicle. | `[_object, _vehicle]` | Local
`AddCargoByClass` | Adds a cargo item to the vehicle. | `[_itemClass, _vehicle, _amount, _showHint]` | Local

## 2. Scripting

### 2.1 Disabling cargo for a mission object

To disable cargo for a mission object use:
```c++
this setVariable ["ace_cargo_size", -1];
```
