---
layout: wiki
title: Refuel Framework
description: Explains how to set-up refueling of objects with the ACE3 refuel system.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 4
  patch: 0
---

## 1. Config Values

{% raw %}
```cpp
class CfgVehicles {
    class MyFuelTruck {
        ace_refuel_fuelCargo = 3000; // Fuel cargo
        ace_refuel_hooks[] = {{0.38,-3.17,-.7},{-0.41,-3.17,-.7}}; // Nozzle hooks positions
    };
    class MyCar {
        ace_refuel_fuelCapacity = 100; // Fuel tank volume
    };
    class MyElectricCar {
        ace_refuel_canReceive = 0; // For vehicles which can't be refueled
    };
};
```
{% endraw %}

<div class="panel callout">
    <h5>Note:</h5>
    <p>ace_refuel_fuelCapacity is only needed if you aren't inheriting from any of BI base classes or if your vehicle has a different fuel tank size.</p>
</div>

## 2. Functions

### 2.1 Getting the fuel supply

`ace_refuel_fnc_getFuel`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Fuel Truck | Object | Required
**R** | Fuel left (in liters) | Number | Return value

#### 2.1.1 Example

`[fuelTruck] call ace_refuel_fnc_getFuel;`

   | Arguments | Explanation
---| --------- | -----------
0  | `fuelTruck` | My fuel truck object

### 2.2 Make a jerry can

`ace_refuel_fnc_makeJerryCan`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | My Object | Object | Required
1  | Fuel amount (in liters) | Number | Optional (default: `20`)
**R** | None | None | Return value

#### 2.2.1 Example 1

`[can] call ace_refuel_fnc_makeJerryCan;`

   | Arguments | Explanation
---| --------- | -----------
0  | `can` | My jerry can object

The jerry can will have the default 20 liters volume.

#### 2.2.2 Example 2

`[can, 200] call ace_refuel_fnc_makeJerryCan;`

   | Arguments | Explanation
---| --------- | -----------
0  | `can` | My jerry can object
1  | `200` | Vehicle class name

The jerry can will now have a volume of 200 liters.

### 2.3 Setting the fuel supply

`ace_refuel_fnc_setFuel`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Fuel Truck | Object | Required
1  | Amount (in liters) | Number | Required
**R** | None | None | Return value

#### 2.3.1 Example

`[fuelTruck, 428] call ace_refuel_fnc_setFuel;`

   | Arguments | Explanation
---| --------- | -----------
0  | `fuelTruck` | My fuel truck object
1  | `428` | New fuel supply

### 2.4 Make an object into a refuel source
*Added in ACE3 3.11.0*

`ace_refuel_fnc_makeSource`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Fuel Source | Object | Required
1  | Amount (in liters) | Number | Optional (default: `0`)
2  | Hooks positions | Array | Optional (default: `[[0,0,0]]`)
**R** | None | None | Return value

#### 2.4.1 Example

`[cursorObject, 100] call ace_refuel_fnc_makeSource`

   | Arguments | Explanation
---| --------- | -----------
0  | `cursorObject` | Fuel source object
1  | `100` | Fuel supply
