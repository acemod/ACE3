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

To quickly add a full ACE Arsenal to a box for all clients use the following code:

```sqf
[_box, true] call ace_arsenal_fnc_initBox;
```

`_box` being the object you wish to add ACE Arsenal to (or `this` when called from the box's init field).

## 1. Access to ACE Arsenal

### 1.1 Adding ACE Arsenal to a box

`ace_arsenal_fnc_initBox`

|  | Argument | Type | Optional (default value)
---| -------- | ---- | ------------------------
0  | Box | Object | Required
1  | Items | Array of strings or boolean | Required
2  | Initialize globally | Boolean | Optional (default: `false`)

This will add the virtual items passed as arguments and add an ACE interaction to open ACE Arsenal.

Examples:
- `[_box, ["MyItem1", "MyItem2", "MyItemN"]] call ace_arsenal_fnc_initBox`
- `[_box, true] call ace_arsenal_fnc_initBox`
- `[_box, false, false] call ace_arsenal_fnc_initBox`

Passing an empty array or `false` will still add an interaction but no additional virtual items will be added.  
Please note that at least one virtual item needs to be added otherwise ACE Arsenal will not open.

### 1.2 Opening an arsenal box manually

`ace_arsenal_fnc_openBox`

|  | Argument | Type | Optional (default value)
---| -------- | ---- | ------------------------
0  | Box | Object | Required
1  | Unit to open ACE Arsenal on | Object | Required
2  | Ignore virtual items and fill ACE Arsenal | Boolean | Optional (default: `false`)

Examples:
- `[_box, player] call ace_arsenal_fnc_openBox`
- `[player, player, true] call ace_arsenal_fnc_openBox`

In the second example a full ACE Arsenal will be opened on the player.

### 1.3 Removing the ACE Arsenal interaction

`ace_arsenal_fnc_removeBox`

|  | Argument | Type | Optional (default value)
---| -------- | ---- | ------------------------
0  | Box | Object | Required
2  | Remove globally | Boolean | Optional (default: `false`)

Example:
`[_box, true] call ace_arsenal_fnc_removeBox`

## 2. Virtual items

### 2.1 Adding virtual items

`ace_arsenal_fnc_addVirtualItems`

|  | Argument | Type | Optional (default value)
---| -------- | ---- | ------------------------
0  | Box | Object | Required
1  | Items | Array of strings or boolean | Required
2  | Add globally | Boolean | Optional (default: `false`)

Passing an array of strings (class names) will add each one of those items to the specified box, passing true will add ALL items that are compatible with ACE Arsenal (the sorting is done on game startup).

Examples:
- `[_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_addVirtualItems`
- `[_box, true, false] call ace_arsenal_fnc_addVirtualItems`

### 2.2 Removing virtual items

`ace_arsenal_fnc_removeVirtualItems`

|  | Argument | Type | Optional (default value)
---| -------- | ---- | ------------------------
0  | Box | Object | Required
1  | Items | Array of strings or boolean | Required
2  | Remove globally | Boolean | Optional (default: `false`)

Like adding virtual items, passing an array of string (class names) will remove each ones of those items, however passing true will remove all virtual items and also remove the interaction to access ACE Arsenal.

Examples:
- `[_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_removeVirtualItems`
- `[_box, true, false] call ace_arsenal_fnc_removeVirtualItems`

### 2.3 Arsenal only with items from default loadouts (See section 4)

Built upon the function of section 2.1, this can be used to make an Arsenal only with the items from your precreated loadouts. This is the best choice if you do not want to make a full arsenal available to have your loadouts spawnable.

1. Spawn the same amount of units as you have loadouts, give each unit one of them
2. Start the mission then press ESC once loaded
3. Clear the debug console then enter the following:
   ```sqf
   private _items = flatten (allUnits apply {getUnitLoadout _x});
   _items = _items arrayIntersect _items select {_x isEqualType "" && {_x != ""}};
   copyToClipboard str _items;
   ```

4. Paste the created array from your clipboard into the space where the items are listed using <kbd>Ctrl</kbd> + <kbd>V</kbd>. The array is created with brackets.

Examples:
- For a new box:  
  `[_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_initBox`
- For an existing box:  
  `[_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_addVirtualItems`

## 3. Config entries

ACE Arsenal has 2 new config entries for items:

- `ace_arsenal_hide`: `0`(shown) or `1` (hidden), used to hide items from ACE Arsenal or `-1` (forced show), for vehicle magazines.
- `ace_arsenal_uniqueBase`: Class name of the item that ACE Arsenal will replace it with when saving a loadout.

Both of them are optional.

## 4. Default loadouts

### 4.1 Adding default loadouts via 3DEN

While in 3DEN you have the ability to save default loadouts in ACE Arsenal, doing so will make the saved loadouts available to all players (those loadouts are still subject to loadout verification).
To do so:
- Open ACE Arsenal in 3DEN by editing a unit's loadout.
- Click on the "Loadouts" tab.
- Click on the "Default Loadouts" tab.
- Enter a loadout name and save.

This loadout list can be exported to the clipboard by using <kbd>Shift</kbd> + <kbd>LMB</kbd>. on the export button, doing the same on the import button will import the list currently in the clipboard.

### 4.2 Adding default loadouts via script

`ace_arsenal_fnc_addDefaultLoadout`

|  | Argument | Type | Optional (default value)
---| -------- | ---- | ------------------------
0  | Name of loadout | String | Required
1  | getUnitLoadout array | Array | Required

Example:
`["Squad Leader", getUnitLoadout sql1] call ace_arsenal_fnc_addDefaultLoadout`

If a loadout with the same name exists, it will be overwritten.

## 5. Stats

ACE Arsenal stats are customizable, this will show you how.

### 5.1 Adding stats via config

```cpp
class ace_arsenal_stats {
    class statBase;

    class TAG_myStat: statBase {
        scope = 2; // Only scope 2 show up in arsenal, scope 1 is used for base classes.
        displayName = "Test entry title"; // Title of the stat.
        priority = 0; // A higher value means the stat will be displayed higher on the page.
        stats[] = {"mySuperStat"}; // Array of strings to pass to the statements, typically
        showBar = 1; // 0 disabled; 1 enabled;
        showText = 1; // 0 disabled; 1 enabled;
        barStatement = "1"; // Statement evaluated to set the bar progress, needs to return a NUMBER.
        textStatement = "test entry"; // statement evaluated to set the text entry, can return anything.
        condition = "true"; // Condition for the stats to be displayed, default is true if not defined, needs to return a BOOL.
        tabs[] = { {0,1,2}, { } }; // Arrays of tabs, left array is left tabs, right array is right tabs.
    };
};
```

The arguments passed to the bar, text and condition statements are:
- The stats array `<ARRAY of STRINGS>`
- The config entry of the weapon `<CONFIG>`

### 5.2 Adding stats via a function

`ace_arsenal_fnc_addStat`

|   | Argument | Type | Optional (default value)
--- | -------- | ---- | ------------------------
0   | Tabs to add the stat to | Array of arrays | Required
0.1 | Left tab indexes | Array of numbers | Required
0.2 | Right tab indexes | Array of numbers | Required
1   | Stat class ID | String | Required
2   | Config entries to pass | Array of strings | Required
3   | Title | String | Required
4   | Show bar / show text bools | Array of booleans | Required
4.1 | Show bar | Boolean | Required
4.2 | Show text | Boolean | Required
5   | Array of statements | Array of arrays | Required
5.1 | Bar code | Code | Required
5.2 | Text code | Code | Required
5.3 | Condition | Code | Required
6   | Priority | Number | Optional (default: `0`)

Example:
```sqf
[[[0,1,2], [7]], "scopeStat", ["scope"], "Scope", [false, true], [{}, {
    params ["_statsArray", "_itemCfg"];
    getNumber (_itemCfg >> _statsArray select 0)
}, {true}]] call ACE_arsenal_fnc_addStat;
```

### 5.3 Removing stats via a function

`ace_arsenal_fnc_removeStat`

|  | Argument | Type | Optional (default value)
---| -------- | ---- | ------------------------
0  | Array of IDs | Array | Required

Stats IDs are unique, IDs are generated as follows:

`Class + side + tab`

For example: `testClassL03`
- Class: `testClass`
- Side: `L` for the left panel
- Tab: `03` for the 3rd tab

For config added stats the classname is used, for function added ones the string provided is used.

### 5.4 Stat tab numbers

Left tabs:

| Index  | Name |
| ---- | ---- |
| 0 | Primary |
| 1 | Handgun |
| 2 | Launcher |
| 3 | Uniform |
| 4 | Vests |
| 5 | Backpacks |
| 6 | Headgear |
| 7 | Goggles |
| 8 | NVGs |
| 9 | Binoculars |
| 10 | Map |
| 11 | GPS |
| 12 | Radio |
| 13 | Compass |
| 14 | Watch |

Right tabs:

| Index  | Name |
| ---- | ---- |
| 0 | Optics |
| 1 | Side accs |
| 2 | Muzzle |
| 3 | Bipod |
| 4 | Mag |
| 5 | Throw |
| 6 | Put |
| 7 | Misc |

## 6. Eventhandlers

All are local.

| Name  | Arguments | Added in |
| ------------- | ------------- | ------------- |
| ace_arsenal_displayOpened | Arsenal display (DISPLAY) |
| ace_arsenal_displayClosed | None |
| ace_arsenal_leftPanelFilled | Arsenal display (DISPLAY), current left panel IDC (SCALAR), current right panel IDC (SCALAR) |
| ace_arsenal_rightPanelFilled | Arsenal display (DISPLAY), current left panel IDC (SCALAR), current right panel IDC (SCALAR) |
| ace_arsenal_onLoadoutSave | Loadout index (SCALAR), [loadout name (STRING), loadout data (ARRAY)] |
| ace_arsenal_onLoadoutSaveExtended | Loadout index (SCALAR), [loadout name (STRING), CBA extended loadout data (ARRAY)] |
| ace_arsenal_onLoadoutLoad | loadout data (ARRAY), loadout name (STRING) |
| ace_arsenal_onLoadoutLoadExtended | CBA extended loadout data (ARRAY), loadout name (STRING) |
| ace_arsenal_onLoadoutDelete | loadout name (STRING) |
|  ace_arsenal_loadoutShared | Loadouts list listnBox control (CONTROL),, [loadout author (STRING), loadout name (STRING), loadout data (ARRAY)]  |
|  ace_arsenal_loadoutUnshared | Loadouts list listnBox control (CONTROL), loadout name (STRING) |
| ace_arsenal_cargoChanged | Arsenal display (DISPLAY), item (STRING), add or remove (BOOL), shiftState (BOOL) |
| ace_arsenal_loadoutImported | Arsenal display (DISPLAY), (import list (BOOL) |
| ace_arsenal_loadoutExported | Arsenal display (DISPLAY), export list (BOOL) |
| ace_arsenal_loadoutsDisplayOpened | loadouts screen display (DISPLAY) | 3.12.3 |
| ace_arsenal_loadoutsDisplayClosed | None | 3.12.3 |
| ace_arsenal_loadoutsTabChanged | loadouts screen display (DISPLAY), tab control (CONTROL) | 3.12.3 |
| ace_arsenal_loadoutsListFilled | loadouts screen display (DISPLAY), tab control (CONTROL) | 3.12.3 |

## 7. Custom sub item categories

### 7.1 Adding a sub item category

`ace_arsenal_fnc_addRightPanelButton`

|  | Argument | Type | Optional (default value)
---| -------- | ---- | ------------------------
0  | Misc. items | Array of strings | Required
1  | Tooltip | String | Optional (default: `""`)
2  | Picture path | String | Optional (default: `"\z\ace\addons\arsenal\data\iconCustom.paa"`)
3  | Override a specific button | Number | Optional (default: `-1`)

Return Value:
- successful: number of the slot (0-9)
- error: -1

This function creates a sub category under misc items in the ACE Arsenal.
Only items that are listed under 'Misc Items' are available for sub categories. 
If the 'Override a specific button' argument is not used, the button will added at the bottom of the rest.

Examples:
- `[["ACE_bloodIV_500", "ACE_fieldDressing"], "MedicalStuff"] call ace_arsenal_fnc_addRightPanelButton`
- `[["ACE_Banana"], "Fruits", "\path\to\a\picture.paa"] call ace_arsenal_fnc_addRightPanelButton`

Override Examples:
``` sqf
// a category 'Explosives' is created at the bottom (last possible location)
[["ACE_Clacker", "ACE_M26_Clacker"], "Explosives", nil, 9] call ace_arsenal_fnc_addRightPanelButton;
```
``` sqf
// a category 'Flashlights' is created and the buttonId is saved
private _buttonId = [["ACE_Flashlight_MX991", "ACE_Flashlight_KSF1"], "Flashlights", "\path\to\a\pictureWithAFlashlight.paa"] call ace_arsenal_fnc_addRightPanelButton;
// now the category 'better flashlight' is replacing the category 'Flashlights' because it is set on the same button index
[["ACE_Flashlight_XL50"], "better flashlight", "\path\to\a\pictureWithAFlashlight.paa", _buttonId] call ace_arsenal_fnc_addRightPanelButton
```
