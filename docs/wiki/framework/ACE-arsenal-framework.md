---
layout: wiki
title: ACE arsenal framework
description: Explains how to interact with ACE arsenal's APIs
group: framework
parent: wiki
mod: ace
version:
  major: 3
  minor: 12
  patch: 0
---

<div class="panel callout">
    <h5>BI functions and variables from BI arsenal DO NOT apply to ACE arsenal!</h5>
</div>

<div class="panel callout">
    <h5>Note:</h5>
    <p>Units and objects that can have ACE arsenal added to them will be called "Boxes" in this documentation</p>
</div>

## 1. Virtual items

Each box has an array of virtual items, it is sorted internally when adding items.


### 1.1 Adding virtual items

`ace_arsenal_fnc_addVirtualItems`
```cpp
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Items <ARRAY of strings> or <BOOL>
 * 2: Add globally <BOOL>
```

Passing an array of strings will add each one of those items to the specified box, passing true will add ALL items that are compatible with ACE arsenal (that sorting is done on game startup).

Examples:
- `[_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_addVirtualItems`
- `[_box, true, false] call ace_arsenal_fnc_addVirtualItems`

### 1.2 Removing virtual items

```cpp
 * 0: Target <OBJECT>
 * 1: Items <ARRAY of strings> <BOOL>
 * 2: Add globally <BOOL>
 ```

Same as adding virtual items, passing an array of string will remove each ones of those items, however passing true will remove all virtual items and also remove the interaction to access ACE arsenal.

Examples:
- `[_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_removeVirtualItems`
- `[_box, true, false] call ace_arsenal_fnc_removeVirtualItems`