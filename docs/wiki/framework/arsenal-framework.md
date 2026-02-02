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

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Box | Object | Required |
| 1  | Items | Array of strings or boolean | Required |
| 2  | Initialize globally | Boolean | Optional (default: `false`) |

This will add the virtual items passed as arguments and add an ACE interaction to open ACE Arsenal.

Examples:
- `[_box, ["MyItem1", "MyItem2", "MyItemN"]] call ace_arsenal_fnc_initBox`
- `[_box, true] call ace_arsenal_fnc_initBox`
- `[_box, false, false] call ace_arsenal_fnc_initBox`

Passing an empty array or `false` will still add an interaction but no additional virtual items will be added.
Please note that at least one virtual item needs to be added otherwise ACE Arsenal will not open.

### 1.2 Opening an arsenal box manually

`ace_arsenal_fnc_openBox`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Box | Object | Required |
| 1  | Unit to open ACE Arsenal on | Object | Required |
| 2  | Ignore virtual items and fill ACE Arsenal | Boolean | Optional (default: `false`) |

Examples:
- `[_box, player] call ace_arsenal_fnc_openBox`
- `[player, player, true] call ace_arsenal_fnc_openBox`

In the second example a full ACE Arsenal will be opened on the player.

### 1.3 Removing the ACE Arsenal interaction

`ace_arsenal_fnc_removeBox`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Box | Object | Required |
| 1  | Remove globally | Boolean | Optional (default: `false`) |

Example:
`[_box, true] call ace_arsenal_fnc_removeBox`

## 2. Virtual items

### 2.1 Adding virtual items

`ace_arsenal_fnc_addVirtualItems`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Box | Object | Required |
| 1  | Items | Array of strings or boolean | Required |
| 2  | Add globally | Boolean | Optional (default: `false`) |

Passing an array of strings (class names) will add each one of those items to the specified box, passing true will add ALL items that are compatible with ACE Arsenal (the sorting is done on game startup). Faces, voices and insignia can't be added via this function.

Examples:
- `[_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_addVirtualItems`
- `[_box, true, false] call ace_arsenal_fnc_addVirtualItems`

### 2.2 Removing virtual items

`ace_arsenal_fnc_removeVirtualItems`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Box | Object | Required |
| 1  | Items | Array of strings or boolean | Required |
| 2  | Remove globally | Boolean | Optional (default: `false`) |

Like adding virtual items, passing an array of string (class names) will remove each ones of those items, however passing true will remove all virtual items and also remove the interaction to access ACE Arsenal. Faces, voices and insignia can't be removed via this function.

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
   _items = (_items arrayIntersect _items) select {_x isEqualType "" && {_x != ""}};
   copyToClipboard str _items;
   ```

4. Paste the created array from your clipboard into the space where the items are listed using <kbd>Ctrl</kbd> + <kbd>V</kbd>. The array is created with brackets.

Examples:
- For a new box:
  `[_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_initBox`
- For an existing box:
  `[_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_addVirtualItems`

## 3. Config entries

### 3.1 Special config entries

ACE Arsenal uses 2 existing config entries to sort and display items.

- `baseWeapon`: Class name that is used to display an item in the arsenal, used for weapon/attachment variants that are not normally shown to the player (AI variants, PIP optics, and so on). This property can be applied to any weapon or weapon attachment in `CfgWeapons`. Items using CBA or RHS' Scripted Optics systems, or CBA Switchable Attachments do not need this property explictly set, and will automatically use their player-accessible class.
- `ACE_isUnique`: Classes in `CfgWeapons` or `CfgMagazines` with this property set to `1` will be treated and shown by the Arsenal as Misc. Items. Used for items with attached data that needs to be kept track of, such as Notepads or Spare Barrels.
- `ACE_asItem`: Classes in `CfgWeapons` or `CfgMagazines` with this property set to `1` will be treated and shown by the Arsenal as Items. Used for magazines that are not meant to be used in a weapon, such as Painkillers.

### 3.2 New config entries

ACE Arsenal has 2 new config entries for items:

- `ace_arsenal_hide`: `0`(shown) or `1` (hidden), used to hide items from ACE Arsenal or `-1` (forced show), for magazines.
- `ace_arsenal_uniqueBase`: Class name of the item that ACE Arsenal will replace it with when saving a loadout and displaying it in the arsenal. Supports configs in `CfgWeapons` (e.g. Maps, Compasses, Watches, GPS / UAV Terminals, Radios, NVGs, Uniforms, Vests - however no Primary, Secondary, Handgun, Launcher weapons or weapon attachments are supported), `CfgMagazines` (any magazine) and `CfgVehicles` (e.g. Backpacks). Item that replaces must be of the same config type as the original item.

Both of them are optional.

### 3.3 Adding items to ACE's sub-categories

ACE Arsenal includes a "Tools" sub-category by default:

- `ACE_isTool`: Items with this property set to `1` will be sorted to the Tools Tab.

ACE Medical Treatment and ACE Field Rations also add their own sub-categories, if they're present:

- `ACE_isMedicalItem`: Items with this property set to `1` will be sorted to the ACE Medical Tab.
- `ACE_isFieldRationItem`: Items with this property set to `1` will be sorted to the ACE Field Rations Tab.

Only Misc. Items will be checked for these properties. Magazines must have `ACE_isUnique` or `ACE_asItem` property.

## 4. Default loadouts

### 4.1 Adding default loadouts via 3DEN

While in 3DEN you have the ability to save default loadouts in ACE Arsenal, doing so will make the saved loadouts available to all players (those loadouts are still subject to loadout verification).
To do so:
- Open ACE Arsenal in 3DEN by editing a unit's loadout.
- Click on the "Loadouts" tab.
- Click on the "Default Loadouts" tab.
- Enter a loadout name and save.

This loadout list can be exported to the clipboard by using <kbd>Shift</kbd> + <kbd>LMB</kbd>. on the export button, doing the same on the import button will import the list currently in the clipboard.

You can also save one of your personal loadouts as a default loadout by <kbd>Shift</kbd> + <kbd>LMB</kbd> on the save button while highlighting or saving a loadout in My Loadouts.

### 4.2 Adding default loadouts ingame

Players with Zeus access can save default loadouts ingame, doing so will make the saved loadout available to all players. The procedure is the same as with 3DEN, but loadouts cannot be exported or imported in Multiplayer. Default loadouts are not deleted when their creator disconnects, unlike Public Loadouts.

### 4.3 Adding default loadouts via script

`ace_arsenal_fnc_addDefaultLoadout`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Name of loadout | String | Required |
| 1  | getUnitLoadout array or CBA extended loadout array | Array | Required |
| 2  | Add loadout globally | Boolean | Optional (default: `false`) |

Example:
`["Squad Leader", getUnitLoadout sql1, true] call ace_arsenal_fnc_addDefaultLoadout`

If a loadout with a similar name exists (case insensitive), it is overwritten.

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
        textStatement = "test entry"; // statement evaluated to set the text entry, can return anything. Arrays will have a linebreak added after each element.
        condition = "true"; // Condition for the stats to be displayed, default is true if not defined, needs to return a BOOL.
        tabs[] = { {0,1,2}, { } }; // Arrays of tabs, left array is left tabs, right array is right tabs.
    };
};
```

The arguments passed to the bar, text and condition statements are:
- The stats array `<ARRAY of STRINGs>`
- The config entry of the item `<CONFIG>`

### 5.2 Adding stats via a function

`ace_arsenal_fnc_addStat`

|     | Arguments | Type(s) | Optional (default value) |
| --- | --------- | ------- | ------------------------ |
| 0   | Tabs to add the stat to | Array of arrays | Required |
| 0.1 | Left tab indexes | Array of numbers | Required |
| 0.2 | Right tab indexes | Array of numbers | Required |
| 1   | Stat class ID | String | Required |
| 2   | Config entries to pass | Array of strings | Required |
| 3   | Title | String | Required |
| 4   | Show bar / show text bools | Array of booleans | Required |
| 4.1 | Show bar | Boolean | Required |
| 4.2 | Show text | Boolean | Required |
| 5   | Array of statements | Array of code | Required |
| 5.1 | Bar code | Code | Required |
| 5.2 | Text code | Code | Required |
| 5.3 | Condition | Code | Required |
| 6   | Priority | Number | Optional (default: `0`) |

Return Value:
- Array of stat IDs

Example:
```sqf
[[[0, 1, 2], [7]], "scopeStat", ["scope"], "Scope", [false, true], [{}, {
    params ["_statsArray", "_itemCfg"];
    getNumber (_itemCfg >> _statsArray select 0)
}, {true}]] call ace_arsenal_fnc_addStat;
```

If a stat already exists (so same class ID and tab), it will ignore the new addition.

### 5.3 Removing stats via a function

`ace_arsenal_fnc_removeStat`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Array of IDs | Array | Required |

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

## 6. Sorting

ACE Arsenal sorting methods are customizable, this will show you how.

### 6.1 Adding sorting methods via config

```cpp
class ace_arsenal_sorts {
    class sortBase;

    class TAG_myStat: sortBase {
        scope = 2; // Only scope 2 show up in arsenal, scope 1 is used for base classes.
        displayName = "Test entry title"; // Title of the sort.
        statement = ""; // The returned value will be used to sort alphabetically. The statement's return value is converted to STRING, so anything can be returned by the statement.
        condition = "true"; // Condition for the sorts to be displayed, default is true if not defined, needs to return a BOOL.
        tabs[] = { {0,1,2}, { } }; // Arrays of tabs, left array is left tabs, right array is right tabs.
    };
};
```

The arguments passed to the statement are:
- The config entry of the item `<CONFIG>`
- The item classname `<STRING>`
- Quantity of items present `<NUMBER>`

The argument passed to the condition is:
- If the sorting occurs in a right panel of uniforms, vest or backpacks. `<BOOL>`

### 6.2 Adding sorting methods via a function

`ace_arsenal_fnc_addSort`

|     | Arguments | Type(s) | Optional (default value) |
| --- | --------- | ------- | ------------------------ |
| 0   | Tabs to add the sort to | Array of arrays | Required |
| 0.1 | Left tab indexes | Array of numbers | Required |
| 0.2 | Right tab indexes | Array of numbers | Required |
| 1   | Stat class ID | String | Required |
| 2   | Title | String | Required |
| 3   | Algorithm | Code | Required |
| 4   | Condition | Code | Optional (default: `{true}`) |

Return Value:
- Array of sort IDs

Example:
```sqf
[[[0, 1], []], "fireRateSort", "Sort by fire rate", {
    params ["_itemCfg"];
    private _fireModes = getArray (_itemCfg >> "modes");
    private _fireRate = [];

    {
        _fireRate pushBackUnique (getNumber (_itemCfg >> _x >> "reloadTime"));
    } forEach _fireModes;

    _fireRate sort true;
    _fireRate param [0, 0]
}] call ace_arsenal_fnc_addSort;
```

Sorting method IDs are unique and are generated in the same fashion as the stat IDs (see `5.3 Removing stats via a function`).

If a sorting method already exists (so same class ID and tab), it will ignore the new addition.

### 6.3 Removing sorting methods via a function

`ace_arsenal_fnc_removeSort`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Array of IDs | Array | Required |

Sorting method IDs are unique and are generated in the same fashion as the stat IDs (see `5.3 Removing stats via a function`).

For config added sorts the classname is used, for function added ones the string provided is used.

### 6.4 Sort tab numbers

The same numbers are used for sorting methods as for stats (see `5.4 Stat tab numbers`).

## 7. Actions

Actions are a way to execute mission/addon-maker defined scripting from a user-interactable control. They can be used to, for example, equip earplugs, modify weapons, or interact with an equipped gunbag directly from the arsenal.
When an action is executed (i.e. the button is clicked), the action's code is executed, and the arsenal display is refreshed on the following frame to take external changes into account.

For actions involving frame delays or timers, a second call of the `ace_arsenal_fnc_refresh` function may be required.

Since CBA frame functions are deactivated during preInit as of Oct 24th 2023, the refresh function is executed immediatelly after the action code is executed. Take note of this information and the comment below if you'd like your actions to be usable in 3DEN.

By default actions are updated whenever the arsenal is refreshed (`ace_arsenal_fnc_refresh`) and whenever item info (the bottom right GUI element that shows item name and author) is updated. If any action with the `updateOnCargoChanged` property is added, then actions will also be updated on container inventory changes.

### 7.1 Adding actions via config

```cpp
class ace_arsenal_actions {
    class TAG_myActions {
        displayName = "My Actions";
        condition = QUOTE(true);
        scopeEditor = 2; // Only actions with scopeEditor = 2 are shown in 3DEN. Actions working with variables should take object variables being reset between editor view and mission start into account.
        updateOnCargoChanged = 1; // See comment above.
        tabs[] = {0,5};
        class text {
            // A simple text label
            text = "My text";
        };
        class statement {
            // Statement output as text
            // Return can be string or array of strings: for array each entry is automatically displayed on a separate line
            textStatement = QUOTE([_this select 0] call tag_fnc_myTextStatement);
        };
        class button {
            label = "My Action";
            condition = QUOTE(true);
            statement = QUOTE(_this call tag_fnc_myAction);
        };
    };
};
```
The focused unit object is passed to the condition and statement functions.

### 7.2 Adding actions via scripting

`ace_arsenal_fnc_addAction`

|     | Arguments | Type(s) | Optional (default value) |
| --- | --------- | ------- | ------------------------ |
| 0   | Tabs to add the sort to | Array of numbers | Required |
| 1   | Action class ID | String | Required |
| 2   | Title | String | Required |
| 3   | Actions | Array of arrays | Required |
| 4   | Condition | Code | Optional (default: `{true}`) |
| 5   | Scope editor | Number | Optional (default: `2`) |
| 6   | Update on cargo change | Boolean | Optional (default: `false`) |

Return Value:
- Array of action IDs

Example:
```sqf
[[0, 5], "TAG_myActions", "My Actions", [
    ["text", "Text", {true}, "Text"],
    ["statement", "Statement", {true}, "", {[_this select 0] call tag_fnc_myTextStatement}],
    ["button", "Button", {true}, "", {}, {_this call tag_fnc_myAction}]
]] call ace_arsenal_fnc_addAction;
```

The example above results in the same actions as in `7.1 Adding actions via config`.

Action IDs are unique and are generated as a string in the following fashion:
`_rootClassName + "~" + _class + "~" + _tab`

The example above returns:
`["TAG_myActions~text~0","TAG_myActions~statement~0","TAG_myActions~button~0","TAG_myActions~text~5","TAG_myActions~statement~5","TAG_myActions~button~5"]`

If an action already exists (so same class ID and tab within an action), it will ignore the new addition.

### 7.3 Removing actions via scripting

`ace_arsenal_fnc_removeAction`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Array of IDs | Array | Required |

Action IDs are unique and their generation is explained in `7.2 Adding sorting methods via a function`.

For config added actions the classname is used, for function added ones the string provided is used.

### 7.4 Action tab numbers

The same numbers are used for actions as for stats (see `5.4 Stat tab numbers`).

## 8. Eventhandlers

All are local.

| Name  | Arguments | Added in |
| ------------- | ------------- | ------------- |
| `ace_arsenal_boxInitialized` | Arsenal box (OBJECT), items (BOOL or ARRAY) |
| `ace_arsenal_boxRemoved` | Arsenal box (OBJECT) |
| `ace_arsenal_displayOpened` | Arsenal display (DISPLAY) |
| `ace_arsenal_displayClosed` | None |
| `ace_arsenal_leftPanelFilled` | Arsenal display (DISPLAY), current left panel IDC (NUMBER), current right panel IDC (NUMBER) |
| `ace_arsenal_rightPanelFilled` | Arsenal display (DISPLAY), current left panel IDC (NUMBER), current right panel IDC (NUMBER) |
| `ace_arsenal_onLoadoutSave` | Loadout index (NUMBER), [loadout name (STRING), loadout data (ARRAY)] |
| `ace_arsenal_onLoadoutSaveExtended` | Loadout index (NUMBER), [loadout name (STRING), CBA extended loadout data (ARRAY)] | 3.15.1
| `ace_arsenal_onLoadoutLoad` | loadout data (ARRAY), loadout name (STRING) |
| `ace_arsenal_onLoadoutLoadExtended` | CBA extended loadout data (ARRAY), loadout name (STRING) | 3.15.1
| `ace_arsenal_onLoadoutDelete` | loadout name (STRING) |
| `ace_arsenal_loadoutShared` | Loadouts list listnBox control (CONTROL), loadout author (STRING), loadout name (STRING), loadout data (ARRAY) |
| `ace_arsenal_loadoutUnshared` | Loadouts list listnBox control (CONTROL), loadout author (STRING), loadout name (STRING) |
| `ace_arsenal_cargoChanged` | Arsenal display (DISPLAY), item (STRING), add or remove (NUMBER), shiftState (BOOL) |
| `ace_arsenal_loadoutImported` | Arsenal display (DISPLAY), import list (BOOL) |
| `ace_arsenal_loadoutExported` | Arsenal display (DISPLAY), export list (BOOL) |
| `ace_arsenal_loadoutsDisplayOpened` | loadouts screen display (DISPLAY) | 3.12.3 |
| `ace_arsenal_loadoutsDisplayClosed` | None | 3.12.3 |
| `ace_arsenal_loadoutsTabChanged` | loadouts screen display (DISPLAY), tab control (CONTROL) | 3.12.3 |
| `ace_arsenal_loadoutsListFilled` | loadouts screen display (DISPLAY), tab control (CONTROL) | 3.12.3 |
| `ace_arsenal_loadoutVerified` | loadout data (ARRAY), loadout CBA extended data (HASHMAP), null items (ARRAY), unavailable items (ARRAY), unavailable extended data (ARRAY) | 3.17.0 |
| `ace_arsenal_weaponItemChanged` | weapon classname (STRING), item classname (STRING), item index (NUMBER, 0-5: muzzle, side, optic, bipod, magazine, underbarrel) | 3.16.0 |

## 9. Custom sub item categories

### 9.1 Adding a sub item category

`ace_arsenal_fnc_addRightPanelButton`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Misc. items | Array of strings | Required |
| 1  | Tooltip | String | Optional (default: `""`) |
| 2  | Picture path | String | Optional (default: `"\z\ace\addons\arsenal\data\iconCustom.paa"`) |
| 3  | Override a specific button | Number | Optional (default: `-1`) |
| 4  | Move button on overwrite | Bool | Optional (default: `false`) |

Return Value:
- Successful: Number of the slot (0-9)
- Error: -1

This function creates a sub-category just above misc items in the ACE Arsenal.
Only items that are listed under 'Misc. Items' or other sub-categories are available for sub-categories.
If the 'Override a specific button' argument is not used, the button will added at the bottom of the rest.
If the 'Move button on overwrite' argument is used, the button will be moved to the bottom of the rest if its position is overridden.

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
If an overwritten button is not moved, its items will be added back to Misc. Items.

## 10. Scripting Examples

### 10.1 Getting a list of all virtual items available to an arsenal

```sqf
private _items = [cursorObject] call ace_arsenal_fnc_getVirtualItems
systemChat str _items
```

### 10.2 Blacklist items from all arsenals

The following code can be used to remove items from any arsenal a player opens. Modify the `TAG_my_arsenal_blacklist` variable with a list of classnames you'd like to remove.
The code will only have effect on clients where it is executed. It can placed in a mission's `initPlayerLocal.sqf` file or any object's init box in the editor. Do not add more than once.

```sqf
TAG_my_arsenal_blacklist = ["arifle_AK12_F", "LMG_03_F"]; // modify this

["ace_arsenal_displayOpened", {
    // Use execNextFrame to ensure it applies to current opened arsenal
    [{ call ace_arsenal_fnc_removeVirtualItems }, [ace_arsenal_currentBox, TAG_my_arsenal_blacklist]] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addEventHandler;
```

Alternatively you can use the following code to blacklist items for all arsenals at the creation of the arsenal, instead of when a player opens it. 

```sqf
TAG_my_arsenal_blacklist = ["arifle_AK12_F", "LMG_03_F"]; // modify this

["ace_arsenal_boxInitialized", {
	params ["_box"];
	[_box, TAG_my_arsenal_blacklist] call ace_arsenal_fnc_removeVirtualItems;
}] call CBA_fnc_addEventHandler;
```

### 10.3 Making items available to all arsenals

Same as above, but instead of `ace_arsenal_fnc_removeVirtualItems`, use `ace_arsenal_fnc_addVirtualItems`.

```sqf
TAG_my_arsenal_essentials = ["arifle_AK12_F", "LMG_03_F"];

["ace_arsenal_displayOpened", {
    [ace_arsenal_currentBox, TAG_my_arsenal_essentials] call ace_arsenal_fnc_addVirtualItems
}] call CBA_fnc_addEventHandler;
```

### 10.4 Saving loadouts to profile
A loadout can be saved to the player's profile using `ace_arsenal_fnc_saveLoadout`.

```sqf
private _loadout = [ACE_player] call CBA_fnc_getLoadout; // or getUnitLoadout ACE_player
private _replaceExisting = true; // optional, default: false
["Current Loadout", _loadout, _replaceExisting] call ace_arsenal_fnc_saveLoadout;
```
