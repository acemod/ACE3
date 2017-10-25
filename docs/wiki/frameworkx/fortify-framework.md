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

```
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
* [west, 5000, [["Sandbag", 5], ["Bunker", 50]]] call acex_fortify_fnc_registerObjects
```

Adding it through `description.ext` you use:

```c++
class ACEX_Fortify_Presets {
    class myMissionObjects {
        objects[] = {
            {"Sandbag", 5},
            {"Bunker", 50}
        };
    };
 ```

 Then you will have to set the mission preset to `myMissionObjects` with `#fortify blufor myMissionObjects` to enable it.
