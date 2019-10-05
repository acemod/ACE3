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

## 1.2 Adding custom presets

There are two ways of adding custom presets to your mission, either via code or through desciption.ext.

To add a preset via code you use the function `call acex_fortify_fnc_registerObjects`. Also enables Fortify.

```cpp
* Registers the given objects in the given side's player interaction menu.
* Players on that side must have the `Fortify Tool` item in their inventory to access the menu.
* Classnames must be in the format [<classname>, <cost>]
* MUST BE CALLED ON SERVER!
*
* Arguments:
* 0: Side <SIDE>
* 1: Budget <NUMBER>
* 2: Object Classnames <ARRAY>
*
* Return Value:
* None
*
* Example:
* [west, 5000, [["Land_BagFence_Long_F", 5], ["Land_BagBunker_Small_F", 50]]] call acex_fortify_fnc_registerObjects
```

Adding it through `description.ext` you use:

```cpp
class ACEX_Fortify_Presets {
    class myMissionObjects {
        objects[] = {
            {"Sandbag", 5},
            {"Bunker", 50}
        };
    };
 ```

 Then you will have to set the mission preset to `myMissionObjects` with `#ace-fortify blufor myMissionObjects` to enable it.
 
## 1.3 Adding custom deploy handlers

A custom deploy handler allows missions makers to decide if an object can be placed or not.

To verify that an object isn't above a certain terrain height we can check the height of the object before it is confirmed as placed. Returning `false` from the code block means that placement is not allowed.

```cpp
[{
    params ["_unit", "_object", "_cost"];
    private _return = (getPosATL _object) select 2 < 1;
    _return
}] call acex_fortify_fnc_addDeployHandler;
```


## 2. Events

### 2.1 Listenable

Event Name | Passed Parameter(s) | Locality | Description
---------- | ----------- | ------------------- | --------
`acex_fortify_objectPlaced` | [player, side, objectPlaced] | Global | Foritfy object placed
`acex_fortify_objectDeleted` | [player, side, objectDeleted] | Global | Foritfy object deleted
`acex_fortify_onDeployStart` | [player, object, cost] | Local | Player starts placing object
