---
layout: wiki
title: Dragging/Carrying Framework
description: Explains how to set-up dragging and carrying of objects with the ACE3 dragging and carrying system.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Config Values

```cpp
class CfgVehicles {
    class MyVehicle {
        // Dragging
        ace_dragging_canDrag = 1;  // Can be dragged (0-no, 1-yes)
        ace_dragging_dragPosition[] = {0, 1.2, 0};  // Offset of the model from the body while dragging (same as attachTo) (default: [0, 1.5, 0])
        ace_dragging_dragDirection = 0;  // Model direction while dragging (same as setDir after attachTo) (default: 0)
        ace_dragging_ignoreWeight = 0; // Whether object's (and its inventory's) weight is ignored for dragging (default: 0)

        // Carrying
        ace_dragging_canCarry = 1;  // Can be carried (0-no, 1-yes)
        ace_dragging_carryPosition[] = {0, 1.2, 0};  // Offset of the model from the body while dragging (same as attachTo) (default: [0, 1, 1])
        ace_dragging_carryDirection = 0;  // Model direction while dragging (same as setDir after attachTo) (default: 0)
        ace_dragging_ignoreWeightCarry = 0; // Whether object's (and its inventory's) weight is ignored for carrying (default: 0)
    };
};
```


## 2. Functions

<div class="panel callout">
    <h5>Note:</h5>
    <p>The following functions are NOT public and are likely to change in the future!</p>
</div>

You will **not** be able to carry / drag objects that are too heavy, the mass is also affected by what is inside the object. To bypass this empty the object. You can change the weight limits by setting `ACE_maxWeightDrag` (default 800) and `ACE_maxWeightCarry` (default 600).

### 2.1 Enabling / disabling dragging

`ace_dragging_fnc_setDraggable`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Any object | Object | Required
1  | Enable dragging, true to enable, false to disable | Boolean | Required
2  | Position to offset the object from player | Array | Optional (default: `[0, 1.5, 0]`)
3  | Direction in degree to rotate the object | Number | Optional (default: `0`)
4  | Whether object and inventory weight is ignored | Boolean | Optional (default: `false`)
**R** | None | None | Return value

#### 2.1.1 Example 1

`[foo, true, [0, 2, 0], 45, true] call ace_dragging_fnc_setDraggable;`

   | Arguments | Explanation
---| --------- | -----------
0  | `foo` | My object
1  | `true` | Dragging is enabled
2  | `[0,2,0]` | 0 meters sideways, 2 meters forward, 0 meters upwards
3  | `45` | Rotated by 45°
4  | `true` | Ignore object weight

#### 2.1.2 Example 2

`[bar, false, [3, -2, 2], 20, false] call ace_dragging_fnc_setDraggable;`

   | Arguments | Explanation
---| --------- | -----------
0  | `bar` | My object
1  | `false` | Dragging is disabled
2  | `[3, -2, 2]` | 3 meters sideways, 2 meters backwards, 2 meters upwards
3  | `20` | Rotated by 20°
4  | `false` | Object weight is taken into account


### 2.2 Enabling / disabling carrying

`ace_dragging_fnc_setCarryable`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Any object | Object | Required
1  | Enable carrying, true to enable, false to disable | Boolean | Required
2  | Position to offset the object from player | Array | Optional (default: `[0, 1, 1]`)
3  | Direction in degree to rotate the object | Number | Optional (default: `0`)
4  | Whether object and inventory weight is ignored | Boolean | Optional (default: `false`)
**R** | None | None | Return value

#### 2.2.1 Example

`[foo, true, [0, 3, 1], 10, false] call ace_dragging_fnc_setCarryable;`

   | Arguments | Explanation
---| --------- | -----------
0  |  `foo` | My object
1  |  `true`| Carrying is enabled
2  | `[0,2,0]` | 0 meters sideways, 3 meters forward, 1 meter upwards
3  | `10` | Rotated by 10°
4  | `false` | Weight is taken into account
