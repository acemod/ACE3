---
layout: wiki
title: Refuel Framework
description: Explains how to set-up refueling of objects with the ACE3 refuel system.
group: framework
order: 5
parent: wiki
---

## 1. Config Values

### 1.1. Setting Vehicle Fuel Capacity

```cpp
class CfgVehicles {
    class MyFuturisticMBT {
        ace_refuel_fuelCapacity = 3000;  // Fuel capacity in liters
    };
};
```

<div class="panel callout">
    <h5>Note:</h5>
    <p>ace_refuel_fuelCapacity is only needed if you aren't inheriting from any of BI base classes or if your vehicle has a different fuel tank size.</p>
</div>

### 1.2. Setting Refuel Station/Vehicle

- Remove `transportFuel` setting from the object (e.g. `transportFuel = 0`)
- Add cargo fuel capacity: `ace_refuel_fuelCargo = 1000;`
- Add [XEH support](https://github.com/CBATeam/CBA_A3/wiki/Extended-Event-Handlers-(new)#compatibility-without-dependance) (only necessary for non-vehicle objects)
- Inherit from another refuel vehicle (preferred) or add interaction menu actions

<div class="panel callout">
    <h5>Note:</h5>
    <p>Adding interaction menu actions is not public API and is likely to change in the future!</p>
</div>

Example:
```cpp
class CfgVehicles {
    class ThingX;
    class MyRefuelStation: ThingX {
        // Add XEH support (only necessary for non-vehicle objects)
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers{};
        };

        // Add interaction menu actions
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "$STR_ace_interaction_MainAction";
                selection = "";
                distance = 10;
                condition = "true";
                class ace_refuel_Refuel {
                    displayName = "$STR_ace_refuel_Refuel";
                    distance = 7;
                    condition = "true";
                    statement = "";
                    exceptions[] = {"isNotInside"};
                    showDisabled = 0;
                    priority = 2;
                    icon = "\z\ace\addons\refuel\ui\icon_refuel_interact.paa";
                    class ace_refuel_TakeNozzle {
                        displayName = "$STR_ace_refuel_TakeNozzle";
                        condition = "[_player, _target] call ace_refuel_fnc_canTakeNozzle";
                        statement = "[_player, _target, objNull] call ace_refuel_fnc_TakeNozzle";
                        icon = "\z\ace\addons\refuel\ui\icon_refuel_interact.paa";
                    };
                    class ace_refuel_CheckFuelCounter {
                        displayName = "$STR_ace_refuel_CheckFuelCounter";
                        condition = "true";
                        statement = "[_player, _target] call ace_refuel_fnc_readFuelCounter";
                        icon = "\z\ace\addons\refuel\ui\icon_refuel_interact.paa";
                    };
                    class ace_refuel_CheckFuel {
                        displayName = "$STR_ace_refuel_CheckFuel";
                        condition = "[_player, _target] call ace_refuel_fnc_canCheckFuel";
                        statement = "[_player, _target] call ace_refuel_fnc_checkFuel";
                        icon = "\z\ace\addons\refuel\ui\icon_refuel_interact.paa";
                    };
                    class ace_refuel_Connect {
                        displayName = "$STR_ace_refuel_Connect";
                        condition = "[_player, _target] call ace_refuel_fnc_canConnectNozzle";
                        statement = "[_player, _target] call ace_refuel_fnc_connectNozzle";
                        icon = "\z\ace\addons\refuel\ui\icon_refuel_interact.paa";
                    };
                    class ace_refuel_Return {
                        displayName = "$STR_ace_refuel_Return";
                        condition = "[_player, _target] call ace_refuel_fnc_canReturnNozzle";
                        statement = "[_player, _target] call ace_refuel_fnc_returnNozzle";
                        icon = "\z\ace\addons\refuel\ui\icon_refuel_interact.paa";
                    };
                };
            };
        };
    };
};
```


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
