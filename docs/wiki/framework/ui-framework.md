---
layout: wiki
title: User Interface Framework
description: Explains how to use the selective user interface framework to add custom elements and toggle them using different methods.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 6
  patch: 0
---

Only advanced elements can be modified using Selective User Interface framework, basic elements can only be changed using `showHUD` SQF command.

## 1. Config Values

### 1.1 Adding an element

```cpp
class ACE_UI {
    class elementName {
        idd = 300;  // IDD of display where the element is located
        elements[] = {3000, 3001};  // List of control IDCs of the elements to toggle (some can have background as a separate control, this allows grouping them together)
        location = 0;  // Location where the element is present (0 - anywhere, 1 - ground only, 2 - vehicle only)
        // Custom conditions base class (read below)
        class conditions {};
    };
};
```

### 1.2 Setting an existing element

```cpp
class ACE_UI {
    class elementName {
        // Custom conditions of where the element can be visible, each condition has its own entry (use prefixes for easy identification and prevention of overwriting)
        // As soon as one condition returns `false` the element will be hidden, this can be included when adding a new element
        class conditions {
            my_source = "vehicle player == 'B_Heli_Attack_01_F'";  // Condition which makes the element visible only when player is in `'B_Heli_Attack_01_F'` vehicle.
        };
    };
};
```


## 2. Scripting

Adding new elements through scripting is currently not possible.

### 2.1 Setting an existing element

`ace_ui_fnc_setElementVisibility`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Source | String | Required
1  | Set/Unset | Boolean | Required
2  | Element Name | String | Required
3  | Show/Hide | Boolean | Optional (default: `false`)
**R** | Successfully Modified | Boolean | Return value

#### 2.1.1 Example

`["ace_reload", true, "ammoCount", false] call ace_ui_fnc_setElementVisibility;`

   | Arguments | Explanation
---| --------- | -----------
0  | `"ace_reload"` | Source displayed in hint when trying to edit this element from in-game settings or in RPT when some other source tries to edit it
1  | `true` | Set element, preventing others to change it (except config, which always has priority)
2  | `"ammoCount"` | Element name to modify
3  | `false` | Hide the element
