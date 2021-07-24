---
layout: wiki
title: Vehicles Framework
description: Explains how to set-up vehicles startup delay.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 14
  patch: 0
---

## 1. Engine startup delay

The engine has to be started before the vehicle can move. Delay can be configured per class via config or per vehicle via script.
By default starting the engine takes aprox. 1 to 2 seconds.

### 1.1 Setting the startup delay by config

```cpp
class CfgVehicles {
    class MyFuelTruck {
        ace_vehicles_engineStartDelay = 3; // Startup delay in seconds
    };
    class MyCar {
        ace_vehicles_engineStartDelay = 2.2;
    };
    class MyElectricCar {
        ace_vehicles_engineStartDelay = 0.1;
    };
};
```

### 1.2 Setting the startup delay by script

`ace_vehicles_fnc_setVehicleStartDelay`
Has global effects.

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Vehicle | Object | Required
1  | Delay (in seconds) | Number | Required
**R** | None | None | Return value


#### 1.2.1 Example

`[myCar, 2.2] call ace_vehicles_fnc_setVehicleStartDelay;`

   | Arguments | Explanation
---| --------- | -----------
0  | `myCar` | My car object
1  | `2.2` | New startup delay
