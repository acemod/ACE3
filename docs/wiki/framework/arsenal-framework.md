---
layout: wiki
title: ACE Arsenal Framework
description: Explains how to interact with the ACE Arsenal API.
group: framework
parent: wiki
mod: ace
version:
  major: 3
  minor: 12
  patch: 0
---

<div class="panel callout">
    <h5>BI functions and variables from BI Virtual Arsenal DO NOT apply to ACE Arsenal!</h5>

    <p>Units and objects that can have ACE Arsenal added to them will be called "Boxes" in this documentation.</p>
</div>

```cpp
// To quickly add a full ACE Arsenal to a box for all clients
[_box, true] call ace_arsenal_fnc_initBox;
```

`_box` being the object you wish to add ACE Arsenal to. (or `this` when called from the box's init field)

## 1. Virtual items

### 1.1 Adding virtual items

`ace_arsenal_fnc_addVirtualItems`
```cpp
 * Arguments:
 * 0: Box <OBJECT>
 * 1: Items <ARRAY of strings> or <BOOL>
 * 2: Add globally <BOOL> (optional)
```

Passing an array of strings (class names) will add each one of those items to the specified box, passing true will add ALL items that are compatible with ACE Arsenal (the sorting is done on game startup).

Examples:
- `[_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_addVirtualItems`
- `[_box, true, false] call ace_arsenal_fnc_addVirtualItems`

### 1.2 Removing virtual items

```cpp
 * 0: Box <OBJECT>
 * 1: Items <ARRAY of strings> <BOOL>
 * 2: Add globally <BOOL> (optional)
 ```

Like adding virtual items, passing an array of string (class names) will remove each ones of those items, however passing true will remove all virtual items and also remove the interaction to access ACE Arsenal.

Examples:
- `[_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_removeVirtualItems`
- `[_box, true, false] call ace_arsenal_fnc_removeVirtualItems`

## 2. Access to ACE Arsenal

### 2.1 Adding ACE Arsenal to a box

`ace_arsenal_fnc_initBox`
```cpp
 * 0: Box <OBJECT>
 * 1: Items <BOOL> or <ARRAY>
 * 2: Initialize globally <BOOL> (optional)
```

This will add the virtual items passed as arguments and add an ACE interaction to open ACE Arsenal.

Examples:
- `[_box, ["MyItem1", "MyItem2", "MyItemN"]] call ace_arsenal_fnc_initBox`
- `[_box, true] call ace_arsenal_fnc_initBox`
- `[_box, false, false] call ace_arsenal_fnc_initBox`

Passing an empty array or `false` will still add an interaction but no additional virtual items will be added.  
Please note that at least one virtual item needs to be added otherwise ACE Arsenal will not open.

if you wish to open a full ACE Arsenal on yourself or open ACE Arsenal via a custom action you can use `ace_arsenal_fnc_openBox`.

`ace_arsenal_fnc_openBox`
```cpp
 * 0: Box <OBJECT>
 * 1: Unit to open ACE Arsenal on <OBJECT>
 * 2: Ignore virtual items and fill ACE Arsenal <BOOL> (optional)
```

Examples:
- `[_box, player] call ace_arsenal_fnc_openBox`
- `[player, player, true] call ace_arsenal_fnc_openBox`

In the second example a full ACE Arsenal will be opened on the player.

### 2.2 Removing the ACE Arsenal interaction

In order to remove the ACE interaction added by `ace_arsenal_fnc_initBox` you need to either use `ace_arsenal_fnc_removeBox` or remove all virtual items, since we saw how to [remove all virtual items](#12-removing-virtual-items) above we'll be focusing on `ace_arsenal_fnc_removeBox`.

`ace_arsenal_fnc_removeBox`
```cpp
 * 0: Box <OBJECT>
 * 1: Remove globally <BOOL> (optional)
```

Example:  
`[_box, true] call ace_arsenal_fnc_removeBox`

## 3. Config entries

ACE Arsenal has 2 new config entries for items:

- `ace_arsenal_hide`: `0`(shown) or `1` (hidden), used to hide items from ACE Arsenal.
- `ace_arsenal_uniqueBase`: Class name of the item that ACE Arsenal will replace it with when saving a loadout.

Both of them are optional.

## 4. Default loadouts

While in 3DEN you have the ability to save default loadouts in ACE Arsenal, doing so will make the saved loadouts available to all players (those loadouts are still subject to loadout verification).

This loadout list can be exported to the clipboard by using <kbd>Shift</kbd>. + <kbd>LMB</kbd>. on the export button, doing the same on the import button will import the list currently in the clipboard.
