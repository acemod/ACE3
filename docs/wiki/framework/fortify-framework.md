---
layout: wiki
title: Fortify Framework
description: Explains how to set-up the Fortify component.
group: framework
order: 6
parent: wiki
mod: acex
version:
  major: 3
  minor: 3
  patch: 0
redirect_from: "/wiki/frameworkx/fortify-framework.html"
---

## 1. Overview

The Fortify framework allows server admins or mission makers to give players the ability to place fortifications through self-interaction, using the `Fortify Tool`.


### 1.1 Chat commands

If the Fortify module is present in the mission, server admins can use chat commands to set-up or change the different parameters. Useful to give players additional resources based on progress on the mission for example.

- `#ace-fortify on` turns fortify mode on
- `#ace-fortify off` turns fortify mode off
- `#ace-fortify west small 500` registers the "small" preset for the west side with a budget of 500
- `#ace-fortify west medium` registers the "medium" preset for the west side with no budget
- `#ace-fortify o big` registers the "big" preset for the east side with no budget

### 1.2 Adding custom presets

There are three ways of adding custom presets to your mission, either via code, through description.ext or through config.

To add a preset via code you use the function `call ace_fortify_fnc_registerObjects`. Also enables Fortify.

```sqf
* Registers the given objects in the given side's player interaction menu.
* Players on that side must have the `Fortify Tool` item in their inventory to access the menu.
* MUST BE CALLED ON SERVER!
*
* Arguments:
* 0: Side <SIDE>
* 1: Budget <NUMBER>
* 2: Object classnames in format [classname, cost, category (optional)] <ARRAY<STRING, NUMBER, STRING>>
*
* Return Value:
* None
*
* Example:
* [west, 5000, [["Land_BagFence_Long_F", 5], ["Land_BagBunker_Small_F", 50]]] call ace_fortify_fnc_registerObjects
* [west, 5000, [["Land_BagFence_Long_F", 5, "tan"], ["Land_BagFence_01_long_green_F", 5, "green"]]] call ace_fortify_fnc_registerObjects
```

Adding it through `description.ext` or config you use:

```cpp
class ACEX_Fortify_Presets {
    class TAG_MyPreset {
        displayName = "My Preset";
        objects[] = {
            {"Sandbag", 5},
            {"Bunker", 50}
        };
    };
    class TAG_categories {
        displayName = "My Categories";
        objects[] = {
            {"Sandbag", 5, "A Category"},
            {"Bunker", 50, "TAG_MyPreset"} // will use the localized displayName of that preset ("My Preset")
        };
    };
};
 ```

Then you will have to set the mission preset to `TAG_MyPreset` by either using the Fortify editor module or the chat command: `#ace-fortify blufor TAG_MyPreset`.

### 1.3 Adding custom deploy handlers

A custom deploy handler allows missions makers to decide if an object can be placed or not.

To verify that an object isn't above a certain terrain height we can check the height of the object before it is confirmed as placed. Returning `false` from the code block means that placement is not allowed.

```sqf
[{
    params ["_unit", "_object", "_cost"];
    private _return = (getPosATL _object) select 2 < 1;
    _return
}] call ace_fortify_fnc_addDeployHandler;
```

### 1.4 Updating budget

The Fortify budget can be updated for any side using the function.

```sqf
* Updates the given sides budget.
*
* Arguments:
* 0: Side <SIDE>
* 1: Change <NUMBER> (default: 0)
* 2: Display hint <BOOL> (default: true)
*
* Return Value:
* None
*
* Example:
* [west, -250, false] call ace_fortify_fnc_updateBudget
```

### 1.5 Tokens

Fortify budget can be distributed to individual units as a physical item. 
Each `ACE_FortifyToken` item grants the equivalent of $5.

### 1.6 Limiting build locations

Fortify can be limited to on specific areas.
Push locations to `ace_fortify_locations`.
Can be any of the area types supported by [inArea](https://community.bistudio.com/wiki/inArea) (either syntax)
```sqf
ace_fortify_locations pushBack "myMarker"; // a marker string name
ace_fortify_locations pushBack [myVehicle, 50, 50, 0, false]; // 50m radius around a moveable vehicle
```


## 2. Config Values

### 2.1 Enabling fortify tools on an item or backpack
```cpp
class CfgWeapons { // same config also works on backpacks (CfgVehicles)
    class yourBaseClass;
    class yourFortifyToolClass: yourBaseClass {
        ace_fortify_fortifyTool = 1;
    };
};
```


## 3. Events

### 3.1 Listenable

| Event Name | Passed Parameter(s) | Locality | Description |
| ---------- | ----------- | ------------------- | -------- |
| `acex_fortify_objectPlaced` | [player, side, objectPlaced] | Global | Fortify object placed |
| `acex_fortify_objectDeleted` | [player, side, objectDeleted] | Global | Fortify object deleted |
| `acex_fortify_onDeployStart` | [player, object, cost] | Local | Player starts placing object |
| `ace_fortify_onDeployStop` | [player, object, cost] | Local | Player stops placing object. Raised only if stopped before trying to place (= before progress bar appears). If it's during progress bar, only `ace_fortify_deployCanceled` is raised. |
| `ace_fortify_deployFinished` | [[player, side, configName, posASL, vectorDir, vectorUp, cost], elapsedTime, totalTime, errorCode] | Local | Player successfully finishes building object |
| `ace_fortify_deployCanceled` | [[player, side, configName, posASL, vectorDir, vectorUp, cost], elapsedTime, totalTime, errorCode] | Local | Player cancels building object |
