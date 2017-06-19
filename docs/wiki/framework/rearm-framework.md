---
layout: wiki
title: Rearm Framework
description: Explains how to set-up rearming of objects with the ACE3 rearm system.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 5
  patch: 0
---

## 1. Config Values

### 1.1 Ammo Configs

```cpp
class CfgAmmo {
    class MyLaserGuidedRocket {
        ace_rearm_caliber = 250;  // Set to the correct caliber
        ace_rearm_dummy = "ace_rearm_MyLaserGuidedRocket";  // Set to correct vehicle classname
    };
};

class CfgVehicles {
    class ace_rearm_defaultCarriedObject;
    class ace_rearm_MyLaserGuidedRocket: ace_rearm_defaultCarriedObject {
        model = "\directory\model.p3d";  // Set to correct static model path
    };
};
```

<div class="panel callout">
    <h5>Note:</h5>
    <p>ace_rearm_caliber is only needed if you aren't inheriting from any of BI base classes or if your ammo has a different caliber.</p>
    <p>ace_rearm_dummy is only needed if you have a custom ammunition model. For each model you should create a dummy vehicle extending ace_rearm_defaultCarriedObject.</p>
</div>

### 1.2 Setting vehicle as a supply
A vehicle will be set as a supply vehicle based on the config `ace_rearm_defaultSupply`
```cpp
class MyTruck: Car_F {
    ace_rearm_defaultSupply = 1200;
};
```
<div class="panel callout">
    <h5>Note:</h5>
    <p>Mission makers can also use `this setVariable ["ace_rearm_isSupplyVehicle", true]`</p>
</div>

## 2. Functions

### 2.1 Adding specific magazines

`ace_rearm_fnc_addMagazineToSupply`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Ammo Truck | Object | Required
1  | Magazine Classname | String | Required
2  | Only add content of one ammo box | Boolean | Optional (default: `false`)
**R** | None | None | Return value

This function is most useful with the module setting `Only specific Magazines`. Note that this function only adds one magazine of a specific class. Other magazines of the same size are not available on this module setting. It has to be used to replenish the ammo truck on `Only specific Magazines` setting.

This function can also be used to increase the supply count on setting `Limited ammo supply based on caliber` by a certain caliber value.

#### 2.1.1 Example

`[ammo_truck, "32Rnd_155mm_Mo_shells"] call ace_rearm_fnc_addMagazineToSupply;`

   | Arguments | Explanation
---| --------- | -----------
0  | `ammo_truck` | My ammo truck object
1  | `"32Rnd_155mm_Mo_shells"` | Some magazine class

The 32 artillery shells are added to the supply count or the magazine storage of the specified ammo truck.

### 2.2 Adding all magazines of a specific vehicle

`ace_rearm_fnc_addVehicleMagazinesToSupply`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Ammo Truck | Object | Required
1  | Any vehicle object or class name | Object or String | Required
**R** | None | None | Return value

This functions wraps `ace_rearm_fnc_addMagazineToSupply` and  uses it to add all default magazines of all supported turrets of the vehicle to the ammo truck.

#### 2.2.1 Example 1

`[ammo_truck, tank] call ace_rearm_fnc_addVehicleMagazinesToSupply;`

   | Arguments | Explanation
---| --------- | -----------
0  |  `ammo_truck` | My ammo truck object
1  |  `tank`| A vehicle object

All magazines found in the class config of the object `tank` are made available.

#### 2.2.2 Example 2

`[ammo_truck, "B_MBT_01_arty_F"] call ace_rearm_fnc_addVehicleMagazinesToSupply;`

   | Arguments | Explanation
---| --------- | -----------
0  |  `ammo_truck` | My ammo truck object
1  |  `"B_MBT_01_arty_F"`| Vehicle class name

All magazines found in the config of the vehicle class `B_MBT_01_arty_F` are made available.

### 2.3 Enabling / disabling rearming

`ace_rearm_fnc_disable`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Any object | Object | Required
1  | Disable rearming, true to disable, false to enable | Boolean | Optional (default: `true`)
**R** | None | None | Return value

This functions disables rearming for all supported turrets of a certain vehicle.

#### 2.3.1 Example 1

`[tank] call ace_rearm_fnc_disable;`

   | Arguments | Explanation
---| --------- | -----------
0  |  `tank` | My object

Disables rearming on the object `tank`.

#### 2.3.2 Example 2

`[tank, false] call ace_rearm_fnc_disable;`

   | Arguments | Explanation
---| --------- | -----------
0  |  `tank` | My object
1  |  `false`| Rearming is enabled

Enables rearming on the object `tank`.

### 2.4 Getting the supply count

`ace_rearm_fnc_getSupplyCount`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Ammo Truck | Object | Required
**R** | Supply count | Number | Return value

This functions returns the current supply count of the ammo truck.

#### 2.4.1 Example

`[ammo_truck] call ace_rearm_fnc_getSupplyCount;`

   | Arguments | Explanation
---| --------- | -----------
0  |  `ammo_truck` | My object

The remaining supply count of `ammo_truck` will be returned.

### 2.5 Removing magazines from supply

`ace_rearm_fnc_removeMagazineFromSupply`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Ammo Truck | Object | Required
1  | Magazine Classname | String | Required
2  | Number of Rounds to withdraw | Number | Optional (default: `-1`)
**R** | Magazine could be removed successfully | Boolean | Return value

#### 2.5.1 Example 1

`[ammo_truck, "500Rnd_127x99_mag_Tracer_Red"] call ace_rearm_fnc_removeMagazineFromSupply;`

   | Arguments | Explanation
---| --------- | -----------
0  |  `ammo_truck` | My ammo truck object
1  |  `"500Rnd_127x99_mag_Tracer_Red"`| Carrying is enabled

Removes one ammo box worth of 500Rnd_127x99_mag_Tracer_Red from the supply. Depending on the module setting the ammo box does hold an entire magazine or only the caliber based amount of rounds.

#### 2.5.2 Example 2

`[ammo_truck, "500Rnd_127x99_mag_Tracer_Red", 50] call ace_rearm_fnc_removeMagazineFromSupply;`

   | Arguments | Explanation
---| --------- | -----------
0  |  `ammo_truck` | My ammo truck object
1  |  `"500Rnd_127x99_mag_Tracer_Red"`| Carrying is enabled
2  |  `50` | Number of rounds

Removes one ammo box with 50 rounds of 500Rnd_127x99_mag_Tracer_Red from the supply. This is 10% of the supply of an entire magazine.

### 2.6 Setting the supply count

`ace_rearm_fnc_setSupplyCount`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Ammo Truck | Object | Required
1  | Supply Count | Boolean | Required
**R** | None | None | Return value

This function sets the current supply count of the ammo truck. It can be used to replenish the ammo truck on `Limited ammo supply based on caliber` setting.

#### 2.6.1 Example

`[ammo_truck, 1000] call ace_rearm_fnc_setSupplyCount;`

   | Arguments | Explanation
---| --------- | -----------
0  |  `ammo_truck` | My ammo truck object
1  |  `1000`| Supply Count
