---
layout: wiki
title: Interaction Menu Framework
description: Explains how to add items to ACE's Interaction Menu
group: framework
order: 0
parent: wiki
---

## 1. Types of actions

- **External** (Type 0 / `ACE_Actions`)
Something the user would do to an external object (eg. Tap another unit's shoulder)
- **Self** (Type 1 / `ACE_SelfActions`)
Something the user would do to themselves or to their vehicle (eg. Put in ear plugs / Check mounted Static Weapon's ammo)
- **Zeus** (`ACE_ZeusActions`)
Available to Zeus

`ACE_Actions` and `ACE_SelfActions` can be added via config or by calling functions, it is generally preferred to add actions via config. Zeus actions can only be added via config.

The simplest action is just a condition and statement. The code to these are passed `[_target, _player, _actionParams]`. `_player` is `ace_player`; `_target` is the object being interacted with; and the 3rd argument is the optional action parameters (default `[]`).

## 2. Adding actions via config

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
```

Config Name | Type | Description
---------- | ----------- | -------------------
`displayName` | String | Text shown to user
`condition` | String (of code) | Condition to show the action
`statement` | String (of code) | Statement run when selected
`icon` | String (file path) | Icon shown (OPTIONAL)
`exceptions` | Array (of strings) | Exceptions to `canInteractWith` conditions (e.g. `"notOnMap"`) (OPTIONAL)
`insertChildren` | String (of code) | Code to return sub actions (OPTIONAL)
`modifierFunction` | String (of code) | Code to modify this action (OPTIONAL)
`runOnHover` | Number or String | (1=true) OR Condition code - Will run the statement on hover (OPTIONAL)
`distance` | Number | External Base Actions Only, Max distance player can be from action point
`position` | String (of code) | External Base Actions Only, Code to return a position in model cords (priority over `selection`)
`selection` | String | External Base Actions Only, A memory point for `selectionPosition`

Actions can be inserted anywhere on the config tree, e.g. hearing's earplugs is a sub action of `ACE_Equipment`:

```cpp
class CAManBase: Man {
    class ACE_SelfActions {
        class ACE_Equipment {
            class ACE_PutInEarplugs {
```

## 3. Adding actions via scripts

Two steps, creating an action (array) and then adding it to either a class or object.
Important: `ace_common_fnc_canInteractWith` is not automatically checked and needs to be explicitly called.

### 2.1 fnc_createAction

`ace_interact_menu_fnc_createAction`

```cpp
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

### 2.2 fnc_addActionToClass

`ace_interact_menu_fnc_addActionToClass`

```cpp
/*
 * Argument:
 * 0: TypeOf of the class <STRING>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Parent path of the new action <ARRAY>
 * 3: Action <ARRAY>
 */
```

### 2.3 fnc_addActionToObject

`ace_interact_menu_fnc_addActionToObject`

```cpp
/*
 * Argument:
 * 0: Object the action should be assigned to <OBJECT>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Parent path of the new action <ARRAY> (Example: `["ACE_SelfActions", "ACE_Equipment"]`)
 * 3: Action <ARRAY>
 */
```

### 2.4 Examples

External:

```cpp
_action = ["VulcanPinch","Vulcan Pinch","",{_target setDamage 1;},{true},{},[parameters], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
[cursorTarget, 0, ["ACE_TapShoulderRight"], _action] call ace_interact_menu_fnc_addActionToObject;
```

Self:

```cpp
_condition = {
    (!pabst_radioFinder_on) && {(backpack _player) in pabst_radioFinder_backpacks} && {[_player, _target, []] call ace_common_fnc_canInteractWith}
};
_statement = {
    [true] call pabst_fnc_radioFinder_action;
};
_action = ["Open RDF","Radio Direction Finder","pabst\RDF.jpg",_statement,_condition] call ace_interact_menu_fnc_createAction;
[(typeOf _unit), 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToClass;
```
