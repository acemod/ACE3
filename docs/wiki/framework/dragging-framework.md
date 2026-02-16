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
        ace_dragging_ignoreWeight = 1; // Ignore weight limitation for dragging (0-no, 1-yes)

        // Carrying
        ace_dragging_canCarry = 1;  // Can be carried (0-no, 1-yes)
        ace_dragging_carryPosition[] = {0, 1.2, 0};  // Offset of the model from the body while dragging (same as attachTo) (default: [0, 1, 1])
        ace_dragging_carryDirection = 0;  // Model direction while dragging (same as setDir after attachTo) (default: 0)
        ace_dragging_ignoreWeightCarry = 1; // Ignore weight limitation for carrying (0-no, 1-yes)
    };
};
```


## 2. Functions

You will **not** be able to carry / drag objects that are too heavy, the mass is also affected by what is inside the object. To bypass this empty the object. You can change the weight limits by setting `ACE_maxWeightDrag` (default 800) and `ACE_maxWeightCarry` (default 600).

### 2.1 Enabling / disabling dragging

`ace_dragging_fnc_setDraggable`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Any object | Object | Required |
| 1  | Enable dragging, true to enable, false to disable | Boolean | Required |
| 2  | Position to offset the object from player | Array | Optional (default: `[0, 1.5, 0]`) |
| 3  | Direction in degree to rotate the object | Number | Optional (default: `0`) |
| 4  | Ignore weight limitation for dragging | Boolean | Optional (default: `false`) |
| 5  | Apply changes globally | Boolean | Optional (default: `false`) |
| **R** | None | None | Return value |

#### 2.1.1 Example 1

`[foo, true, [0, 2, 0], 45] call ace_dragging_fnc_setDraggable;`

|    | Arguments | Explanation |
|----| --------- | ----------- |
| 0  | `foo` | My object |
| 1  | `true` | Dragging is enabled |
| 2  | `[0,2,0]` | 0 meters sideways, 2 meters forward, 0 meters upwards |
| 3  | `45` | Rotated by 45° |

#### 2.1.2 Example 2

`[bar, false, [3, -2, 2], 20] call ace_dragging_fnc_setDraggable;`

|    | Arguments | Explanation |
|----| --------- | ----------- |
| 0  | `bar` | My object |
| 1  | `false` | Dragging is disabled |
| 2  | `[3, -2, 2]` | 3 meters sideways, 2 meters backwards, 2 meters upwards |
| 3  | `20` | Rotated by 20° |


### 2.2 Enabling / disabling carrying

`ace_dragging_fnc_setCarryable`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Any object | Object | Required |
| 1  | Enable carrying, true to enable, false to disable | Boolean | Required |
| 2  | Position to offset the object from player | Array | Optional (default: `[0, 1, 1]`) |
| 3  | Direction in degree to rotate the object | Number | Optional (default: `0`) |
| 4  | Ignore weight limitation for carrying | Boolean | Optional (default: `false`) |
| 5  | Apply changes globally | Boolean | Optional (default: `false`) |
| **R** | None | None | Return value |

#### 2.2.1 Example

`[foo, true, [0, 3, 1], 10] call ace_dragging_fnc_setCarryable;`

|    | Arguments | Explanation |
|----| --------- | ----------- |
| 0  |  `foo` | My object |
| 1  |  `true`| Carrying is enabled |
| 2  | `[0,3,1]` | 0 meters sideways, 3 meters forward, 1 meter upwards |
| 3  | `10` | Rotated by 10° |

## 3. Corpse moving
Added in 3.18.0, ACE allows you to drag and carry corpses.

### 3.1 Config Values

```cpp
class CfgVehicles {
    class MyUnit {
        ace_dragging_cloneClass = "MyClone"; // Allows you to define what type of clone is used for moving the corpse (default: "ace_dragging_clone")
    };
    
    class ace_dragging_clone;
    class MyClone: ace_dragging_clone {}; // Custom clones must inherit from ace_dragging_clone
};
```

### 3.2 Enabling / disabling corpse moving

By default, corpse moving is enabled. If you wish to disable it, you can set the variable below to `false`:

```sqf
ace_dragging_canMoveDead = false;
```
