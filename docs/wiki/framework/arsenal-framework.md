---
layout: wiki
title: ACE arsenal framework
description: Explains how to interact with ACE arsenal APIs
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

To quickly add a full ACE arsenal to a box for all clients (do not use in init box):
`[_box, true] call ace_arsenal_fnc_initBox`  
`_box` being the object you wish to add arsenal to.

## 1. Virtual items

Each box has an array of virtual items, it is sorted internally when adding items via `ace_arsenal_fnc_addVirtualItems`

### 1.1 Adding virtual items

`ace_arsenal_fnc_addVirtualItems`
```cpp
 * Arguments:
 * 0: Box <OBJECT>
 * 1: Items <ARRAY of strings> or <BOOL>
 * 2: Add globally <BOOL>
```

Passing an array of strings (classnames) will add each one of those items to the specified box, passing true will add ALL items that are compatible with ACE arsenal (that sorting is done on game startup).

Examples:

- `[_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_addVirtualItems`
- `[_box, true, false] call ace_arsenal_fnc_addVirtualItems`

### 1.2 Removing virtual items

```cpp
 * 0: Box <OBJECT>
 * 1: Items <ARRAY of strings> <BOOL>
 * 2: Add globally <BOOL>
 ```

Like adding virtual items, passing an array of string will remove each ones of those items, however passing true will remove all virtual items and also remove the interaction to access ACE arsenal.

Examples:

- `[_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_removeVirtualItems`
- `[_box, true, false] call ace_arsenal_fnc_removeVirtualItems`

## 2. Access to ACE arsenal

### 2.1 Adding ACE arsenal to a box

`ace_arsenal_fnc_initBox`
```cpp
 * 0: Box <OBJECT>
 * 1: Items <BOOL> or <ARRAY>
 * 2: Initialize globally <BOOL>
```

This will add the virtual items passed as arguments and add an ACE interaction to open arsenal.

Examples:

- `[_box, ["MyItem1", "MyItem2", "MyItemN"]] call ace_arsenal_fnc_initBox`
- `[_box, true] call ace_arsenal_fnc_initBox`
- `[_box, false, false] call ace_arsenal_fnc_initBox`

Passing an empty array or `false` will still add an interaction but no additional virtual items will be added.  
Please note that at least one virtual item need to be added otherwise ACE arsenal will not open.

if you wish to open a full ACE arsenal on yourself or open ACE arsenal via a custom action you can use `ace_arsenal_fnc_openBox`.

`ace_arsenal_fnc_openBox`
```cpp
 * 0: Box <OBJECT>
 * 1: Unit to open the arsenal on <OBJECT>
 * 2: Ignore virtual items and fill arsenal <BOOL>
```

Examples:

- `[_box, player] call ace_arsenal_fnc_openBox`
- `[player, player, true] call ace_arsenal_fnc_openBox`

In the second example a full ACE arsenal will be opened on the player.

### 2.2 Removing the ACE arsenal interaction

In order to remove the ACE interaction added by initBox you need to either use removeBox or remove all virtual items, since we saw how to remove all virtual items above we'll be focusing on removeBox.

`ace_arsenal_fnc_removeBox`
```cpp
 * 0: Box <OBJECT>
 * 1: Remove globally <BOOL>
```

Example:
`[_box, true] call ace_arsenal_fnc_removeBox`

## 3. Config entries

ACE arsenal has 2 new config entries for items:

- `ace_arsenal_hide`: `0`(shown) or `1` (hidden), used to hide items from ACE arsenal.
- `ace_arsenal_uniqueBase`: Classname of the item that ACE arsenal will replace it with when saving a loadout.

Both of them are optional.

## 4. Default loadouts

While in 3DEN you have the ability to save default loadouts in ACE arsenal, doing so will make the saved loadouts available to all players (those loadouts are still subject to loadout verification).

This loadout list can be exported to the clipboard by using <kbd>Shift</kbd>. + <kbd>LMB</kbd>. on the export button, doing the same on the import button will import the list currently in the clipboard.
