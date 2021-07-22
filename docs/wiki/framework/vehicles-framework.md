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

The engine has to be started before the vehicle can move. Delay can be configured per vehicle via config.
By default starting the engine takes aprox. 1 to 2 seconds.

{% raw %}
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
{% endraw %}