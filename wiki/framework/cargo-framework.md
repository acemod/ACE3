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
        ace_cargo_space = 4;  // The cargo space your vehicle has
        ace_cargo_hasCargo = 1;  // Enables cargo to be loaded inside the vehicle (1 = yes, 0 = no, default = 1)

    };
};
```

### 1.2 Making an object loadable

```c++
class staticBananaLauncher {
    class yourVehicleBaseClass {
        ace_cargo_size = 4;  // The cargo space the object takes
        ace_cargo_canLoad = 1;  // Enables the object to be loaded (1 = yes, 0 = no, default = 1)

    };
};
```

<div class="panel callout">
    <h5>Note:</h5>
    <p>ace_cargo_hasCargo and ace_cargo_canLoad are only needed if you aren't inheriting from any of BI base classes or if you are trying to disable loading for a specific vehicle / object</p>
</div>


## 2. Events

### 2.1 Listenable

Event Name | Description | Passed Parameter(s) | Locality
---------- | ----------- | ------------------- | --------
`cargoLoaded` | Loaded cargo. | ` [_item, _vehicle]` | Global
`cargoUnloaded` | Unloaded cargo. | `[_item, _vehicle]` | Global
`cargoAddedByClass` | Cargo items added. | `[_itemClass, _vehicle, _amount]` | Global

### 2.2 Callable

Event Name | Description | Passed Parameter(s) | Locality
---------- | ----------- | ------------------- | --------
`LoadCargo` | Load object into vehicle. | `[_object, _vehicle, _showHint]` | Local
`UnloadCargo` | Unload object from vehicle. | `[_object, _vehicle]` | Local
`AddCargoByClass` | Adds a cargo item to the vehicle. | `[_itemClass, _vehicle, _amount, _showHint]` | Local
