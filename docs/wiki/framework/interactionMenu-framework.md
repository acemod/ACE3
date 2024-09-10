---
layout: wiki
title: Interaction Menu Framework
description: Explains how to add items to ACE's Interaction Menu.
group: framework
order: 0
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Types of actions

- **External** (Type 0 / `ACE_Actions`)
Something the user would do to an external object (eg. Tap another unit's shoulder)
- **Self** (Type 1 / `ACE_SelfActions`)
Something the user would do to themselves or to their vehicle (eg. Put in ear plugs / Check mounted Static Weapon's ammo)
- **Zeus** (`ACE_ZeusActions`)
Available to Zeus

`ACE_Actions` and `ACE_SelfActions` can be added via config or by calling functions. Be aware that the functions modify the UI, and therefore need to be executed on client-side to take effect.

The simplest action is just a condition and statement. The code to these are passed `[_target, _player, _actionParams]`. `_player` is `ace_player`; `_target` is the object being interacted with; and the 3rd argument is the optional action parameters (default `[]`).

## 2. Adding actions via config

### 2.1 Class interactions

Example:

```cpp
class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class danceParty {
                displayName = "dance";
                condition = "[_player] call onDanceFloor";
                exceptions[] = {};
                statement = "_player switchMove 'TestDance'";
                icon = "\z\dance.paa";
            };
        };
    };
};
```

| Config Name | Type | Description |
| ---------- | ----------- | ------------------- |
| `displayName` | String | Text shown to user |
| `condition` | String (of code) | Condition to show the action |
| `statement` | String (of code) | Statement run when selected |
| `icon` | String (file path) | Icon shown (OPTIONAL) |
| `exceptions` | Array (of strings) | Exceptions to `canInteractWith` conditions (e.g. `"notOnMap"`) (OPTIONAL) |
| `insertChildren` | String (of code) | Code to return sub actions (OPTIONAL) |
| `modifierFunction` | String (of code) | Code to modify this action (OPTIONAL) |
| `runOnHover` | Number or String | (1=true) OR Condition code - Will run the statement on hover (OPTIONAL) |
| `distance` | Number | External Base Actions Only, Max distance player can be from action point |
| `position` | String (of code) | External Base Actions Only, Code to return a position in model cords (priority over `selection`) |
| `selection` | String | External Base Actions Only, A memory point for `selectionPosition` |
| `doNotCheckLOS` | Number | (1=true) - Ignores blocked LOS to the interaction node even when beyond 1.2m |
| `showDisabled` | Number | Currently has no effect |
| `enableInside` | Number | Currently has no effect |
| `canCollapse` | Number | Currently has no effect |

Actions can be inserted anywhere on the config tree, e.g. hearing's earplugs is a sub action of `ACE_Equipment`:

```cpp
class CAManBase: Man {
    class ACE_SelfActions {
        class ACE_Equipment {
            class ACE_PutInEarplugs {};
        };
    };
};
```

Interaction exceptions are defined by several components:

| Component | Exception | Description |
| ---------- | ----------- | ------------------- |
| `captives` | `"isNotEscorting"` | Can interact while escorting a captive |
|  | `"isNotHandcuffed"` | Can interact while handcuffed |
|  | `"isNotSurrendering"` | Can interact while surrendering |
| `common` | `"isNotDead"` | Can interact while dead |
|  | `"notOnMap"` | Can interact while in Map |
|  | `"isNotInside"` | Can interact while inside a vehicle |
|  | `"isNotInZeus"` | Can interact while in the zeus interface |
|  | `"isNotUnconscious"` | Can interact while unconscious |
| `dragging` | `"isNotDragging"` | Can interact while dragging |
|  | `"isNotCarrying"` | Can interact while carrying |
| `interaction` | `"isNotSwimming"` | Can interact while swimming/diving |
|  | `"isNotOnLadder"` | Can interact while climbing a ladder |
| `refuel` | `"isNotRefueling"` | Can interact while carrying refueling nozzle |
| `sitting` | `"isNotSitting"` | Can interact while sitting in a chair |

### 2.2 Vehicle interactions based on animations

Some classes (usually vehicles) might have `AnimationSources` defined, which can hide/show e.g. spare wheels, ammo boxes, tools, doors etc. ACE offers a framework to be able to interact with those animations, which would allow players to e.g. remove the spare wheel from the vehicle, by hiding the spare wheel and spawning in a wheel object.

{% raw %}
```cpp
class Car_F;
class Offroad_01_base_F: Car_F {
    class ace_interaction_anims {
        class HideBackpacks { // Class name of the animation (has to be defined in 'AnimationSources' of the class, with scope > 0)
            phase = 0; // The phase which is set after the action has successfully completed (default: 1)
            // At least 1 selection or position must be defined, otherwise an error will be raised and the interaction not added
            // Both selections[] and positions[] can be used at the same time
            selections[] = {"vhc_bags"}; // Selections where to have the interaction appear, equivalent to "_target selectionPosition 'vhc_bags'" if put in positions[] (default: [])
            positions[] = {{-1.15, -1.15, -0.2}, "_target selectionPosition ['vhc_bags', 'FireGeometry', 'AveragePoint']"}; // Positions where to have the interaction appear. It can either be model coordinates (in the array format) or a string containing code which returns model coordinates (default: [])
            items[] = {"B_TacticalPack_blk", "ACE_Wheel", "ACE_EntrenchingTool"}; // Items to spawn in when the progress bar finishes successfully (default: [])
            name = "$STR_a3_cfgvehicleclasses_backpacks0"; // Interaction name to display when interacting with the object (default: localised version of "Take it off")
            icon = "\A3\ui_f\data\igui\cfg\actions\take_ca.paa"; // Interaction icon to display when interacting with the object (default: "\A3\ui_f\data\igui\cfg\actions\take_ca.paa")
            text = "Removing backpacks..."; // Text to display in the progress bar (default: "")
            duration = 10; // Sets the progress bar duration (default: 10 seconds)
            distance = 2; // Sets at which distance the interactions can be accessed (default: 2)
            enabled = 1; // Enables (1) or disables (0) the interaction (default: 1)
        };
    };
};
```
{% endraw %}

Individual animations can have the items they spawn in changed dynamically using a variable. If you set the items to `[]`, it will disable the interaction from completing (the progress bar will play, but once it reaches the end, it will stop and fail):
```sqf
_target setVariable [format ["ace_interaction_animsItems_%1", _anim], ["B_TacticalPack_blk"], true];

// To disable the interaction from the example above
_target setVariable ["ace_interaction_animsItems_HideBackpacks", [], true];
```

## 3. Adding actions via scripts

Two steps, creating an action (array) and then adding it to either a class or object.
Important: `ace_common_fnc_canInteractWith` is not automatically checked and needs to be explicitly called.

### 3.1 fnc_createAction

`ace_interact_menu_fnc_createAction`

```sqf
/*
 * Argument:
 * 0: Action name <STRING>
 * 1: Name of the action shown in the menu <STRING>
 * 2: Icon <STRING>
 * 3: Statement <CODE>
 * 4: Condition <CODE>
 * 5: Insert children code <CODE> (Optional)
 * 6: Action parameters <ANY> (Optional)
 * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
 * 8: Distance <NUMBER> (Optional)
 * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
 * 10: Modifier function <CODE> (Optional)
 */
```

### 3.2 fnc_addActionToClass

`ace_interact_menu_fnc_addActionToClass`

```sqf
/*
 * Argument:
 * 0: TypeOf of the class <STRING>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Parent path of the new action <ARRAY>
 * 3: Action <ARRAY>
 * 4: Use Inheritance (Default: False) <BOOL><OPTIONAL>
 * 5: Classes excluded from inheritance (children included) (Default: []) <ARRAY><OPTIONAL>
 */
```
By default this function will not use inheritance, so actions will only be added to the specific class.

### 3.3 fnc_addActionToObject

`ace_interact_menu_fnc_addActionToObject`

```sqf
/*
 * Argument:
 * 0: Object the action should be assigned to <OBJECT>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Parent path of the new action <ARRAY> (Example: `["ACE_SelfActions", "ACE_Equipment"]`)
 * 3: Action <ARRAY>
 */
```

### 3.4 fnc_addActionToZeus

`ace_interact_menu_fnc_addActionToZeus`

```sqf
/*
 * Argument:
 * 0: Parent path of the new action <ARRAY> (Example: `["ACE_ZeusActions"]`)
 * 1: Action <ARRAY>
 */
```

### 3.5 Examples

External:

```sqf
_action = ["VulcanPinch","Vulcan Pinch","",{_target setDamage 1;},{true},{},[parameters], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
[cursorTarget, 0, ["ACE_TapShoulderRight"], _action] call ace_interact_menu_fnc_addActionToObject;
```

Self:

```sqf
_condition = {
    (!pabst_radioFinder_on) && {(backpack _player) in pabst_radioFinder_backpacks} && {[_player, _target, []] call ace_common_fnc_canInteractWith}
};
_statement = {
    [true] call pabst_fnc_radioFinder_action;
};
_action = ["Open RDF","Radio Direction Finder","pabst\RDF.jpg",_statement,_condition] call ace_interact_menu_fnc_createAction;
[(typeOf _unit), 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToClass;
```

Using `addActionToClass` inheritance:

```sqf
// Adds action to check fuel levels for all land vehicles
_action = ["CheckFuel", "Check Fuel", "", {hint format ["Fuel: %1", fuel _target]}, {true}] call ace_interact_menu_fnc_createAction;
["LandVehicle", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

// Same as above, but children of "MRAP_01_Base" will not have the action
_action = ["CheckFuel", "Check Fuel", "", {hint format ["Fuel: %1", fuel _target]}, {true}] call ace_interact_menu_fnc_createAction;
["LandVehicle", 0, ["ACE_MainActions"], _action, true, ["MRAP_01_Base"]] call ace_interact_menu_fnc_addActionToClass;

// Adds action to check external fuel levels on tanks.  Will be a sub action of the previous action.
_action = ["CheckExtTank","Check External Tank","",{hint format ["Ext Tank: %1", 5]},{true}] call ace_interact_menu_fnc_createAction;
["Tank_F", 0, ["ACE_MainActions", "CheckFuel"], _action, true] call ace_interact_menu_fnc_addActionToClass;
```

Zeus:

```sqf
_statement = {
    playSound3D ["alarm.ogg", theBase]
};
_action = ["myMissionEvent1","Mission Event: Play Base Alarm","",_statement,{true}] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;
```

### 3.6 Advanced Example

This adds an interaction to a unit that allows passing items that the player is carrying.

- The child actions are generated dynamically based on the items in the player's inventory.
- The parent action's display name is modified based on the item count.
- When hovering on the action, a hint text is sent to the target.

```sqf
_condition = {
    true
};
_statement = {
    params ["_target", "_player", "_params"];
    diag_log format ["_statement [%1, %2, %3]", _target, _player, _params];

    // Run on hover:
    ["ace_common_displayTextStructured", ["someone is thinking of giving you items", 1.5, _target], [_target]] call CBA_fnc_targetEvent;
};
_insertChildren = {
    params ["_target", "_player", "_params"];
    diag_log format ["_insertChildren [%1, %2, %3]", _target, _player, _params];

    // Add children to this action
    private _actions = [];
    {
        private _childStatement = {diag_log format ["givingItem %1", _this]; _target addItem (_this select 2);};
        private _action = [format ["item:%1",_x], _x, "", _childStatement, {true}, {}, _x] call ace_interact_menu_fnc_createAction;
        _actions pushBack [_action, [], _target]; // New action, it's children, and the action's target
    } forEach (items _player);

    _actions
};
_modifierFunc = {
    params ["_target", "_player", "_params", "_actionData"];
    diag_log format ["_modifierFunc [%1, %2, %3]", _target, _player, _params];

    // Modify the action - index 1 is the display name, 2 is the icon...
    _actionData set [1, format ["Give Items: %1", count (items player)]];
};

_action = ["GiveItems", "?","",_statement,_condition,_insertChildren,[123],"",4,[false, false, false, true, false], _modifierFunc] call ace_interact_menu_fnc_createAction;
[q3, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
```

### 3.7 Using `ace_interact_menu_newControllableObject` event

CBA event `ace_interact_menu_newControllableObject` fires only once the first time the player controls a new object (new man, vehicle or controlled UAV)
This is the ideal way to add self interaction actions, as adding them via `addActionToClass` will force self interaction actions to be compiled for classes that may never be used.

```sqf
// Example: Add radio self-action to all civilian cars
["ace_interact_menu_newControllableObject", {
    params ["_type"]; // string of the object's classname
    if (!(_type isKindOf "Car")) exitWith {};
    if ((getNumber (configFile >> "CfgVehicles" >> _type >> "side")) != 3) exitWith {};

    private _action = ["playRadio","Play Radio","",{playMusic "NeverGonnaGiveYouUp"},{true}] call ace_interact_menu_fnc_createAction;
    [_type, 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
}] call CBA_fnc_addEventHandler;
```
