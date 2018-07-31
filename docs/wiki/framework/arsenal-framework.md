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
To do so:
- Open ACE Arsenal in 3DEN by editing a unit's loadout.
- Click on the "Loadouts" tab.
- Click on the "Default Loadouts" tab.
- Enter a loadout name and save.

This loadout list can be exported to the clipboard by using <kbd>Shift</kbd>. + <kbd>LMB</kbd>. on the export button, doing the same on the import button will import the list currently in the clipboard.

## 5. Stats

ACE Arsenal stats are customizable, this will show you how.

### 5.1. Adding stats via config

```cpp
class ace_arsenal_stats {
    class statBase;

    class TAG_myStat: statBase {
        scope = 2; // Only scope 2 show up in arsenal, scope 1 is used for base classes.
        displayName= "Test entry title"; // Title of the stat.
        priority = 0; // A higher value means the stat will be displayed higher on the page.
        stats[] = {"mySuperStat"}; // Array of strings to pass to the statements, typically 
        showBar = 1; // 0 disabled; 1 enabled;
        showText = 1; // 0 disabled; 1 enabled;
        barStatement = "1"; // Statement evaluated to set the bar progress, needs to return a NUMBER.
        textStatement = "test entry" // statement evaluated to set the text entry, can return anything.
        condition = "true"; // Condition for the stats to be displayed, default is true if not defined, needs to return a BOOL.
        tabs[] = { {0,1,2}, { } }; // Arrays of tabs, left array is left tabs, right array is right tabs.
    };
};
```

The arguments passed to the bar, text and condition statements are:
- The stats array `<ARRAY of STRINGS>`
- The config entry of the weapon `<CONFIG>`

### 5.2 Adding stats via a function

To add a stat simply call `ace_arsenal_fnc_addStat`
```cpp
/*
 * Author: Alganthe
 * Add a stat to ACE Arsenal.
 *
 * Arguments:
 * 0: Tabs to add the stat to (ARRAY of ARRAYS)
   * 0.1: Left tab indexes (ARRAY of NUMBERS)
   * 0.2 Right tab indexes (ARRAY of NUMBERS)
 * 1: Stat class (STRING) (A unique string for each stat)
 * 2: Config entries to pass (ARRAY of STRINGS)
 * 3: Title (STRING)
 * 4: Show bar / show text bools (ARRAY of BOOLS)
   * 4.1 Show bar (BOOL)
   * 4.2 Show text (BOOL)
 * 5: Array of statements (ARRAY of ARRAYS)
   * 5.1: Bar code (CODE)
   * 5.2 Text code (CODE)
   * 5.3 Condition code (CODE)
 * 6: Priority (NUMBER) (Optional)
 *
 * Return Value:
 * 0: Array of IDs (ARRAY of STRINGS)
 *
 * Example:
 * [[[0,1,2], [7]], "scopeStat", ["scope"], "Scope", [false, true], [{}, {
        params ["_statsArray", "_itemCfg"];
        getNumber (_itemCfg >> _statsArray select 0)
    }, {true}]] call ACE_arsenal_fnc_addStat
 *
 * Public: Yes
*/
```

### 5.3 Removing stats via a function

Removing a stat is as simple as adding one, call `ace_arsenal_fnc_removeStat`

Stats IDs are unique, IDs are generated as follows:

`Class + side +  tab`

For example: `testClassL03`
- Class: `testClass`
- Side: `L` for the left panel
- Tab: `03` for the 3rd tab

For config added stats the classname is used, for function added ones the string provided is used.

```cpp
/*
 * Author: Alganthe
 * Remove a stat from ACE Arsenal.
 *
 * Arguments:
 * 0: Array of IDs (ARRAY)
 *
 * Return Value:
 * None
 *
 * Example:
 * [["scopeStatL00","scopeStatL01","scopeStatL02","scopeStatR07"]] call ace_arsenal_fnc_removeStat;
 *
 * Public: Yes
*/
```

#### 6.0 Eventhandlers

All are local.

| Name  | Arguments |
| ------------- | ------------- |
| ace_arsenal_displayOpened  | Arsenal display (DISPLAY) |
| ace_arsenal_displayClosed | None |
| ace_arsenal_leftPanelFilled | Arsenal display (DISPLAY), current left panel IDC (SCALAR), current right panel IDC (SCALAR) |
| ace_arsenal_rightPanelFilled | Arsenal display (DISPLAY), current left panel IDC (SCALAR), current right panel IDC (SCALAR) |
| ace_arsenal_onLoadoutSave | Loadout index (SCALAR), [loadout name (STRING), loadout data (ARRAY)] |
| ace_arsenal_onLoadoutLoad | loadout data (ARRAY), loadout name (STRING) |
|  ace_arsenal_loadoutShared | Loadouts list listnBox control (CONTROL),, [loadout author (STRING), loadout name (STRING), loadout data (ARRAY)]  |
|  ace_arsenal_loadoutUnshared | Loadouts list listnBox control (CONTROL), loadout name (STRING) |
| ace_arsenal_cargoChanged | Arsenal display (DISPLAY), item (STRING), add or remove (BOOL), shiftState (BOOL) |
| ace_arsenal_loadoutImported | Arsenal display (DISPLAY), (import list (BOOL) |
| ace_arsenal_loadoutExported | Arsenal display (DISPLAY), export list (BOOL) |
