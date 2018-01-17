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


## 2. Functions

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
