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

The `Fortify Framework` allows server admins or mission makers to give players the ability to place fortifications through self-interaction, using the `Fortify Tool`.


### 1.1 Chat commands

If the `Fortify Module` is present in the mission server admins can use chat commands to set-up or change the different parameters. Useful to give players additional resources based on progress on the mission for instance.

- `#fortify on` turns fortify mode on
- `#fortify off` turns fortify mode off
- `#fortify west small 500` registers the "small" preset for the west side with a budget of 500
- `#fortify west medium` registers the "medium" preset for the west side with no budget
- `#fortify o big` registers the "big" preset for the east side with no budget

### 1.2 Module

When placing the `Fortify Module` in Eden Editor you can change parameters such as side, budget, preset and enable/disable `Add Fortify Tool`. The latter give all players the `Fortify Tool` on mission start.

## 1.3 Adding custom presets

There are two ways of adding custom presets to your mission, either via code or through desciption.ext.

To add a preset via code you use `[west, 5000, [["Sandbag", 5], ["Bunker", 50]]] call acex_fortify_fnc_registerObjects` which adds a preset with Sandbag and Bunker for 5 and 50 resources. Also enables it for `west` with budget of 5000.

Adding it through description.ext you use:

```C++
class ACEX_Fortify_Presets {
    class myMissionObjects{
        objects[] = {
            {"Sandbag", 5}
            ,{"Bunker", 50}
        };
    };
 ```

 Then you will have to set the mission preset to `myMissionObjects` with `#fortify blufor myMissionObjects` to enable it.
