---
layout: wiki
title: Viewports Framework
description: How to configure a vehicle for viewports
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 15
  patch: 0
---

## 1. Config Values

Reference [ace_viewports_fnc_getViewports](https://github.com/acemod/ACE3/blob/master/addons/viewports/functions/fnc_getViewports.sqf)

```cpp
class myVehicle {
    class ace_viewports {
        class Template {
            // type [STRING] - Optional
            type = "";
             // camLocation [ARRAY or STRING] - Required
            camLocation = "memoryPointP1";
            camLocation[] = {1,2,3}; // model offset
            // camAttach [ARRAY or NUMBER] - Required
            camAttach[] = {0,0}; // Turret path
            camAttach = 55; // Direction in degrees
            // screenLocation [ARRAY or STRING] - Optional
            screenLocation = "memoryPointP1x";
            screenLocation[] = {1,2,3};
            // maxDistance [NUMBER] - Optional
            maxDistance = 0.75;
            // compartments [ARRAY] - Optional
            compartments[]={"Compartment1"};
            // roles [ARRAY] - Optional
            roles[]={"cargo"};
        };
        class periscope_0 {
            camLocation[] = {0.987915, -0.324707, -0.0673385};
            camAttach = 70;
            roles[]={"cargo"};
        };
        class commandersView {
            screenLocation[] = {0.729126,-0.191597,-0.573349};
            maxDistance = 5;
            type = "screen";
            camLocation[] = {0,0,0.05};
            camAttach[] = {0,0};
            roles[]={"cargo"};
        };
    };
};
```
