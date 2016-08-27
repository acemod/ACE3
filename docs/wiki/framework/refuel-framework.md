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

```cpp
class CfgVehicles {
    class MyFuturisticMBT {
        ace_refuel_fuelCapacity = 3000; // set to correct path static model
    };
};
```

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
0  |  `can` | My jerry can object

The jerry can will have the default 20 liters volume.

#### 2.2.2 Example 2

`[can, 200] call ace_refuel_fnc_makeJerryCan;`

   | Arguments | Explanation
---| --------- | -----------
0  |  `can` | My jerry can object
1  |  `200` | Vehicle class name

The jerry can will now have a volume of 200 liters.

### 2.3 Reset a broken fuel truck

`ace_refuel_fnc_reset`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Fuel Truck | Object | Required
**R** | None | None | Return value

#### 2.3.1 Example

`[truck] call ace_refuel_fnc_reset;`

   | Arguments | Explanation
---| --------- | -----------
0  |  `truck` | My object

This function will try to reset the fuel truck to a pristine state.

### 2.4 Setting the fuel supply

`ace_refuel_fnc_setFuel`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Fuel Truck | Object | Required
1  | Amount (in liters) | Number | Required
**R** | None | None | Return value

#### 2.4.1 Example

`[fuelTruck, 428] call ace_refuel_fnc_setFuel;`

   | Arguments | Explanation
---| --------- | -----------
0  |  `fuelTruck` | My fuel truck object
1  |  `428` | New fuel supply
